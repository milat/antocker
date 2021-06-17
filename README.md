# ANTOCKER

## Ambiente de desenvolvimento Docker

### Utilização:

0. Certificar que possua o [docker](https://docs.docker.com/engine/install/ubuntu/) e o [docker-compose](https://docs.docker.com/compose/install/) instalados.

1. Criar e configurar o arquivo *.env* baseado no arquivo *.env.example*;

2. Subir a aplicação:

```
docker-compose up -d php7.2
```
ou
```
docker-compose up -d php5.6
```
Obs: Os containers de persistência subirão junto com os de PHP.

Obs 2: Por padrão haverá conflito entre as portas PHP, sendo necessário especificar qual versão do PHP irá utilizar. Para utilizá-las simultaneamente readeque as portas utilizadas no arquivo *docker-compose.yml*.

#

### Serviços disponíveis:

- PHP 5.6;
- PHP 7.2;
- MySql 5.7;
- MongoDB 4.0.9
- Memcached 1.5
- Redis 5