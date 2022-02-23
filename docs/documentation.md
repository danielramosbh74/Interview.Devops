# Documentação

- 22/02/2022 - 21:03 - Criei (fiz o build a partir do Dockerfile) a primeira imagem personalizada nginx-server a partir da imagem original dele do Docker Hub
    root@TigerOS-Daniel:/home/daniel/Interview.Devops/nginx-server# docker build -t nginx-server .
    Sending build context to Docker daemon   2.56kB
    Step 1/3 : FROM nginx:latest
    ---> c316d5a335a5
    Step 2/3 : COPY ./html/ /usr/share/nginx/html
    ---> 22512d7a5cca
    Step 3/3 : EXPOSE 80
    ---> Running in e7739f7ad79c
    Removing intermediate container e7739f7ad79c
    ---> 7c6ccb72f04b
    Successfully built 7c6ccb72f04b
    Successfully tagged nginx-server:latest
    root@TigerOS-Daniel:/home/daniel/Interview.Devops/nginx-server# 

- 22/02/2022 - 21:45 - 1a versão do container Nginx rodando localmente
    root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker ps -a
    CONTAINER ID   IMAGE                          COMMAND                  CREATED              STATUS          PORTS                                   NAMES
    dab7cdbb84f8   danielramosbh74/nginx-server   "/docker-entrypoint.…"   About a minute ago   Up 59 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   nginx-server
    root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server#

- 23/02/2022 - 06:43 

    - Como a página incial do Nginx que estava rodando localmente ontem não era a original, ele estava usando uma de minhas imagens personalizadas, então apaguei todas as imagens antigas e todos os containers e executei novamente o script `s1.sh`, que construiu uma nova imagem "zerada" a partir do Nginx padrão do Docker Hub. Mesmo assim ainda carregou a página index.html que eu tinha editado no desafio Coodesh... Limpei o cache do Chrome, mas tb não funcionou... Está rodando, mas... de onde pegou estas configurações?... Será que da imagem personaliza do Nginx que está lá no meu Docker Hub?
    Enfim, vou entrar dentro do container e voltar manualmente mesmo para a página index.html padrão do Nginx.
    - Listei e limpei os "Volumes" (ex. data_nginx) e alterei o Dockerfile incluindo o caminho completo da imagem original do Nginx: docker.io/nginx:latest (estava sem o docker.io e então talvez estivesse puxando do meu repositório do Docker Hub: danielramosbh74)
    - Listei e limpei todas as imagens e os containers e fiz um novo build e run executando novamente o script `s1.sh`

        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker volume ls
        DRIVER    VOLUME NAME
        local     mysql_config
        local     mysql_data
        local     nginx_data
        local     nginx_data-php
        local     runner-sthajipu-project-2054-concurrent-0-cache-3c3f060a0374fc8bc39395164f415a70
        local     runner-sthajipu-project-2054-concurrent-0-cache-c33bcaa1fd2c77edfc3893b41966cea8
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker volume prune
        WARNING! This will remove all local volumes not used by at least one container.
        Are you sure you want to continue? [y/N] y
        Deleted Volumes:
        mysql_config
        mysql_data
        nginx_data
        nginx_data-php
        runner-sthajipu-project-2054-concurrent-0-cache-3c3f060a0374fc8bc39395164f415a70
        runner-sthajipu-project-2054-concurrent-0-cache-c33bcaa1fd2c77edfc3893b41966cea8

        Total reclaimed space: 205.5MB
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker volume ls
        DRIVER    VOLUME NAME
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker image ls
        REPOSITORY                     TAG       IMAGE ID       CREATED          SIZE
        danielramosbh74/nginx-server   latest    37f6e62b6430   17 minutes ago   142MB
        nginx                          latest    c316d5a335a5   4 weeks ago      142MB
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker ps -a
        CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker image prune -a
        WARNING! This will remove all images without at least one container associated to them.
        Are you sure you want to continue? [y/N] y
        Deleted Images:
        untagged: nginx:latest
        untagged: nginx@sha256:2834dc507516af02784808c5f48b7cbe38b8ed5d0f4837f16e78d00deb7e7767
        untagged: danielramosbh74/nginx-server:latest
        deleted: sha256:37f6e62b6430ffbdc3a61f228d58d596b7b9ccffa1a93c7fef3257a0117e467d
        deleted: sha256:f050861f6abae0f21e99f8f4d32899b551e50946eba85379843cb95c17d4bb38
        deleted: sha256:9c6b8487b93d3ad5318e1f95d47779516d92bcd86edcd46bb2dfbb818ddf6115
        deleted: sha256:c316d5a335a5cf324b0dc83b3da82d7608724769f6454f6d9a621f3ec2534a5a
        deleted: sha256:67e568696593c33b4a15c9d81dc6f67499b8d973b88eb49b53d47bf4dbf4d187
        deleted: sha256:0f8d4e3d979c540644f248b4206cf540978166b095223bdc950628dca2e8f3f1
        deleted: sha256:5d75bfe8a7422476a495b27c8a1598d1206137631d350b8bdee13bc88f365282
        deleted: sha256:8284a9e28c625b2826efdd6160ea1ff7f710881a4a2afe1ef58a5eb51d3f919e
        deleted: sha256:89a1db9e1079b7574c1a707bc8c1fe04ff723bc71d4bca8bc48653e9a32186d2
        deleted: sha256:7d0ebbe3f5d26c1b5ec4d5dbb6fe3205d7061f9735080b0162d550530328abd6

        Total reclaimed space: 141.5MB
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# docker images
        REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# ./s1.sh
        Sending build context to Docker daemon  3.584kB
        Step 1/3 : FROM docker.io/nginx:latest
        latest: Pulling from library/nginx
        5eb5b503b376: Pull complete 
        1ae07ab881bd: Pull complete 
        78091884b7be: Pull complete 
        091c283c6a66: Pull complete 
        55de5851019b: Pull complete 
        b559bad762be: Pull complete 
        Digest: sha256:2834dc507516af02784808c5f48b7cbe38b8ed5d0f4837f16e78d00deb7e7767
        Status: Downloaded newer image for nginx:latest
        ---> c316d5a335a5
        Step 2/3 : COPY ./html/ /usr/share/nginx/html
        ---> 03ab677f2092
        Step 3/3 : EXPOSE 80
        ---> Running in d8b056113b27
        Removing intermediate container d8b056113b27
        ---> e49868e88b90
        Successfully built e49868e88b90
        Successfully tagged danielramosbh74/nginx-server:latest
        05bad116ccb956ecd4d1210ac834527efd93f64f0adbe43156526a266c90f299
        root@TigerOS-Daniel:/home/daniel/Interview.Devops/danielramosbh74/nginx-server# 
    
    Agora sim! Nginx oficial rodando! ;)

![Nginx](images/Nginx-recem-instalado-com-index-padrao.png)

23/02 - 07:53 - Instalei o Azure CLI no meu Linux (TigerOS - Derivado do Debian / Ubuntu)

    daniel@TigerOS-Daniel:~/Interview.Devops$ az --version
    azure-cli                         2.0.81

    core                              2.0.81
    telemetry                          1.0.4

    Extensions:
    azure-devops                      0.17.0

    Python location '/usr/bin/python3'
    Extensions directory '/home/daniel/.azure/cliextensions'

    Python (Linux) 3.8.10 (default, Nov 26 2021, 20:14:08) 
    [GCC 9.3.0]

    Legal docs and information: aka.ms/AzureCliLegal



    Unable to check if your CLI is up-to-date. Check your internet connection.

    Please let us know how we are doing: https://aka.ms/clihats
    daniel@TigerOS-Daniel:~/Interview.Devops$ az --version
    azure-cli                         2.0.81

    core                              2.0.81
    telemetry                          1.0.4

    Extensions:
    azure-devops                      0.17.0

    Python location '/usr/bin/python3'
    Extensions directory '/home/daniel/.azure/cliextensions'

    Python (Linux) 3.8.10 (default, Nov 26 2021, 20:14:08) 
    [GCC 9.3.0]

    Legal docs and information: aka.ms/AzureCliLegal



    Unable to check if your CLI is up-to-date. Check your internet connection.

    Please let us know how we are doing: https://aka.ms/clihats


23/02 - 08:23 - Tive um problema na autenticação do azure CLI, pois como só consigo me autenticar lá SEM SER ROOT, o Docker dava erro... 
Mas adicionei o meu usuário comum (sem ser root) ao grupo Docker e resolvi o problema: consegui fazer login no registro1qbem

    daniel@TigerOS-Daniel:~/Interview.Devops$ az login
    You have logged in. Now let us find all the subscriptions to which you have access...
    [
    {
        "cloudName": "AzureCloud",
        "id": "ea8d30da-3f15-47e1-afb7-e67a05cf8972",
        "isDefault": true,
        "name": "Azure subscription 1",
        "state": "Enabled",
        "tenantId": "40432a6b-d61a-4db3-9a3f-ebb073e57bf9",
        "user": {
        "name": "danielramosbh74@gmail.com",
        "type": "user"
        }
    }
    ]
    daniel@TigerOS-Daniel:~/Interview.Devops$ az acr login --name registro1qbem
    An error occurred: DOCKER_COMMAND_ERROR
    Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json: dial unix /var/run/docker.sock: connect: permission denied

    daniel@TigerOS-Daniel:~/Interview.Devops$ sudo groupadd docker
    [sudo] senha para daniel:    
    groupadd: grupo 'docker' já existe
    daniel@TigerOS-Daniel:~/Interview.Devops$ sudo gpasswd -a $USER docker
    Adicionando usuário daniel ao grupo docker
    daniel@TigerOS-Daniel:~/Interview.Devops$ newgrp docker
    daniel@TigerOS-Daniel:~/Interview.Devops$ docker ps -a
    CONTAINER ID   IMAGE                          COMMAND                  CREATED             STATUS             PORTS                                   NAMES
    05bad116ccb9   danielramosbh74/nginx-server   "/docker-entrypoint.…"   About an hour ago   Up About an hour   0.0.0.0:8080->80/tcp, :::8080->80/tcp   nginx-server
    daniel@TigerOS-Daniel:~/Interview.Devops$ az acr login --name registro1qbem
    Login Succeeded
    daniel@TigerOS-Daniel:~/Interview.Devops$ 

23/02 - 13:28 - Finalmente o push para o ACR terminou!

    daniel@TigerOS-Daniel:~/Interview.Devops$ docker push registro1qbem.azurecr.io/nginx-server:v1
    The push refers to repository [registro1qbem.azurecr.io/nginx-server]
    df777efa38d6: Layer already exists 
    762b147902c0: Layer already exists 
    235e04e3592a: Layer already exists 
    6173b6fa63db: Layer already exists 
    9a94c4a55fe4: Layer already exists 
    9a3a6af98e18: Layer already exists 
    7d0ebbe3f5d2: Pushed 
    v1: digest: sha256:f2405927204d94ad268a8c3cfdefc17726c1a52559dea9f8dfc5988d053f05e8 size: 1777
    daniel@TigerOS-Daniel:~/Interview.Devops$ 









    


- xxx

