docker build -t registro1qbem.azurecr.io/nginx-server:v1 .
# Importante lembrar deste "." no final, que quer dizer "tudo ou pasta padrão"
# docker run -d --name registro1qbem.azurecr.io/nginx-server:v1 -p 8080:80 -v nginx_data:/usr/share/nginx/html registro1qbem.azurecr.io/nginx-server:v1
docker run -d --name nginx-server -p 8080:80 -v nginx_data:/usr/share/nginx/html registro1qbem.azurecr.io/nginx-server:v1
