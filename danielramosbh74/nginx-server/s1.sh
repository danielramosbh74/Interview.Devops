docker build -t danielramosbh74/nginx-server .
# docker run -d --name nginx-server -p 8080:80 -v nginx_data:/usr/share/nginx/html danielramosbh74/nginx-server
# Desta forma estava pegando os dados do volume gerado pelo container antigo
docker run -d --name nginx-server -p 8080:80 -v nginx_data:/usr/share/nginx/html danielramosbh74/nginx-server