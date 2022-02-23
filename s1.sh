docker build -t danielramosbh74/nginx-server .
docker run -d --name danielramosbh74/nginx-server -p 8080:80 -v nginx_data:/usr/share/nginx/html danielramosbh74/nginx-server