# Scraping Music

Esse é um script criado por nós para facilitar a inserção de músicas de um determinado compositor. Devido ao tempo, não foi possível estudar a API do Spotify para coletar os nomes das músicas e criar queries para inserir em nosso banco de dados. Porém, criamos um script que analisa o html da lista ordenada de músicas de um álbum coletadas manualmente e então cria as sql queries quase completas para inserção.

## Executando

É preciso ter o `BeautifulSoup` instalado. Para instalar, use o comando abaixo

```shellscript
$ pip3 innstall beautifulsoup4
```

Depois, entre na pasta `scraping-music` e execute o arquivo `scrap.sh` da seguinte forma:

```shellscript
$ ./scrap.sh [clean|create|ls] <html-file> <start-id> <cod-album>
```

html-file é um arquivo criado com apenas a lista ordenada de músicas.

start-id é o codfaixa que você deseja começar na Query.

O output desse comando é um script `sql`
