
---
**Link do Render para acesso ao site:** [Clique aqui para testar o Vai de Que?](https://vai-de-que.onrender.com)
---

O Vai de Que? é uma aplicação web desenvolvida para deixar a escolha de filmes a serem assistidos mais divertida. O sistema utiliza Python com o framework Flask e integra-se à API oficial do TMDB (The Movie Database) para fornecer dados atualizados em tempo real, eliminando a necessidade de manutenção de um banco de dados local estático (como feito em versões mais antigas do site).

**Especificações Técnicas:**
Backend: Flask (Python) para gerenciamento de rotas, lógica de sorteio e conversão de IDs da API para nomes.
Frontend: HTML5, CSS3 e Jinja2.
Integração: API - TMDB para busca de títulos e provedores de streaming.
Hospedagem: Cloud PaaS (Render) com fluxo de CI/CD via GitHub.

**Funcionalidades Principais:**
A aplicação permite filtrar resultados com base nos provedores de streaming (Netflix, Disney+, Prime Video, Max) e em categorias específicas de gênero. O sorteio processa as requisições no servidor e retorna aleatoriamente um título que atenda aos filtros selecionados pelo usuário - exibindo título, sinopse, capa oficial e onde o conteúdo está disponível.
Caso não seja possível encontrar um filme que atenda a todos os critérios selecionados nos filtros o usuário verá uma mensagem de erro e poderá sortear um filme novamente.
