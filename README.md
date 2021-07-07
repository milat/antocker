# ANTOCKER

## Ambiente de desenvolvimento PHP em Docker

### Utilização:

#

## 0. Certifique-se que possua o [docker](https://docs.docker.com/engine/install/ubuntu/) e o [docker-compose](https://docs.docker.com/compose/install/) instalados.

#

## 1. Criar e configurar o arquivo *.env* baseado no arquivo *.env.example*.

A variável *PROJECTS_PATH* deve informar o caminho até o diretório que os projetos estão instalados.

Ao configurar as portas dos containers PHP, caso escolha a mesma porta para mais que um container só poderá subir uma versão de cada vez, para não gerar conflito.

#

## 2. Subir a aplicação:

```
docker-compose up -d
```

ou especificando qual container deverá subir

```
# docker-compose up -d <nome_container>

docker-compose up -d php7.2
```
Obs: Os containers de persistência (mysql, mongo, memcached e redis) subirão junto com os de PHP.

Para subir os containers ao iniciar sua máquina (e não precisar rodar o comando acima), descomente a linha *restart: unless-stopped* do(s) container(s) desejado(s) no arquivo *docker-compose.yml*.

Após subir os containers uma vez, para qualquer alteração que vier a fazer na configuração dos *Dockerfiles* ou no arquivo *docker-compose.yml*, você deve rebuildar o(s) container(s) ao subir para que a alteração tenha efeito:

```
docker-compose up -d --build

# docker-compose up -d --build <nome_container>

docker-compose up -d --build php7.2
```

#

## 3. Verificando o status dos containers:
```
docker ps
```

#

## 4. Acessando o container:
```
# docker exec -ti <nome_container> bash

docker exec -ti php7.2 bash
```
#

## 5. Restartando os containers
```
docker-compose restart
```

ou especificando qual container deve ser restartado:

```
# docker-compose restart <nome_container>

docker-compose restart php7.2
```

#

## 6. Parando os containers
```
docker-compose stop
```

ou especificando qual container deve ser parado:

```
# docker-compose stop <nome_container>

docker-compose stop php7.2
```

#

## 7. Verificando o LOG dos containers

Para verificar as últimas linhas geradas no log:

```
# docker logs <nome_container>

docker logs php7.2
```

Para determinar quantas linhas do log serão exibidas:

```
# docker logs <nome_container> -n <quantidade_linhas>

docker logs php7.2 -n 5
```

Para acompanhar o log em tempo real (o terminal ficará preso até pressionar *ctrl+c*):

```
# docker logs <nome_container> -f

docker logs php7.2 -f
```

#

### Obs: Todos os comandos exibidos aqui devem ser executado fora dos containers.

#

### Serviços disponíveis:

- PHP 5.6;
- PHP 7.2;
- PHP 7.4;
- PHP 8.0;
- MySql 5.7;
- MongoDB 4.0.9
- Memcached 1.5
- Redis 5

#

### Author
- [Antonio Milat](https://github.com/milat)