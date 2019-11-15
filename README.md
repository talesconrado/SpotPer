# SpotPer
Trabalho final da disciplina de Fundamentos de Bancos de Dados, na UFC. Um "Spotify" personalizado, usando Node, React e SQL Server.

## Contributing

[Saiba como contribuir](./CONTRIBUTING.md)

## Scraping Music

Esse é um script criado por nós para facilitar a inserção de músicas de um determinado com    positor. Devido ao tempo, não foi possível estudar a API do Spotify para coletar os nomes     das músicas e criar queries para inserir em nosso banco de dados. Porém, criamos um script     que analisa o html da lista ordenada de músicas de um álbum coletadas manualmente e então     cria as sql queries quase completas para inserção.

## Executando scrap.sh

É preciso ter o  `Python3` e `BeautifulSoup` instalado. Para instalar o segundo, use o comando abaixo

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

## LICENSE

[MIT](./LICENSE)
