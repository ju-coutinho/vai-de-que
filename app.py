import os
import random
import requests
from flask import Flask, render_template, request
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)



CHAVE_API = os.getenv("TMDB_API_KEY")
LINK_BASE = "https://api.themoviedb.org/3"


IDS_STREAMING = {
    ##Disney+:
    '1': 337,
    # Netflix:
    '2': 8,
    # Prime Video:
    '3': 119,
    # Max:
    '4': 1899
}


LISTA_GENEROS = [
    {'id': 28, 'nome': 'Ação'}, {'id': 12, 'nome': 'Aventura'},
    {'id': 16, 'nome': 'Animação'}, {'id': 35, 'nome': 'Comédia'},
    {'id': 80, 'nome': 'Crime'}, {'id': 18, 'nome': 'Drama'},
    {'id': 10751, 'nome': 'Família'}, {'id': 14, 'nome': 'Fantasia'},
    {'id': 27, 'nome': 'Terror'}, {'id': 10402, 'nome': 'Música'},
    {'id': 10749, 'nome': 'Romance'}, {'id': 878, 'nome': 'Sci-Fi'}
]

def buscar_filme(canais_escolhidos, generos_escolhidos):
    lista_de_ids = []
    for numero in canais_escolhidos:
        if numero in IDS_STREAMING:
            id_real = IDS_STREAMING[numero]
            lista_de_ids.append(str(id_real))
    texto_servicos = "|".join(lista_de_ids)
    

    configuracoes = {
        "api_key": CHAVE_API,
        "language": "pt-BR",
        "region": "BR",
        "sort_by": "popularity.desc",
        "with_watch_providers": texto_servicos,
        "watch_region": "BR",
        "include_adult": "true"
    }
    

    if len(generos_escolhidos) > 0:
        texto_generos = ",".join(generos_escolhidos)
        configuracoes["with_genres"] = texto_generos



    endereco_da_busca = LINK_BASE + "/discover/movie"
    resposta = requests.get(endereco_da_busca, params=configuracoes)
    dados_recebidos = resposta.json()
    lista_de_filmes = dados_recebidos.get('results', [])

    if len(lista_de_filmes) > 0:
        filme_escolhido = random.choice(lista_de_filmes)
        id_do_filme = filme_escolhido.get('id')
        endereco_onde_assistir = LINK_BASE + "/movie/" + str(id_do_filme) + "/watch/providers"
        resposta_onde = requests.get(endereco_onde_assistir, params={"api_key": CHAVE_API})
        dados_da_plataforma = resposta_onde.json()
        
        resultados_todos = dados_da_plataforma.get('results', {})
        dados_brasil = resultados_todos.get('BR', {})
        lista_assinatura = dados_brasil.get('flatrate', [])
        
        nome_da_plataforma = "Seus streamings"
        for item in lista_assinatura:
            id_plataforma_atual = str(item.get('provider_id'))
            if id_plataforma_atual in lista_de_ids:
                nome_da_plataforma = item.get('provider_name')
                break

        titulo = filme_escolhido.get('title')
        sinopse = filme_escolhido.get('overview')
        if sinopse == "" or sinopse == None:
            sinopse = "Este filme ainda não tem uma descrição em português."

        foto_caminho = filme_escolhido.get('poster_path')
        if foto_caminho != None:
            url_foto = "https://image.tmdb.org/t/p/w500" + foto_caminho
        else:
            url_foto = "/static/default_poster.jpg"

        resultado_final = {
            "nome_filme": titulo,
            "descricao": sinopse,
            "url_capa": url_foto,
            "nome_plataforma": nome_da_plataforma
        }
        return resultado_final

    return None

@app.route('/', methods=['GET', 'POST'])
def pagina_principal():
    filme_sorteado = None
    aviso_erro = None
    canais_marcados = ['1', '2', '3', '4']
    generos_marcados = []

    if request.method == 'POST':
        canais_marcados = request.form.getlist('streamings')
        generos_marcados = request.form.getlist('generos')

        if len(canais_marcados) > 0:
            filme_sorteado = buscar_filme(canais_marcados, generos_marcados)

            if filme_sorteado == None:
                aviso_erro = "Não há filmes disponíveis que atendam a todos os filtros. Tente outros!"
        else:
            aviso_erro = "Escolha pelo menos um serviço de streaming!"

    return render_template('index.html', 
                            filme=filme_sorteado, 
                            msg_erro=aviso_erro, 
                            ids_selecionados=canais_marcados,
                            generos=LISTA_GENEROS,
                            ids_generos_selecionados=generos_marcados)

if __name__ == '__main__':
    app.run(debug=True)