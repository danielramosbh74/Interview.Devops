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

- xxx
- xxx

