# FROM docker.io/nginx:latest
# Imagem oficial, padrão, original, do Nginx. Só usei a primeira vez, ANTES de configurar o Github Actions, com o Dockerfile na pasta danielramosbh74/nginx-server
FROM registro1qbem.azurecr.io/nginx-server:v1
# Nova imagem do Nginx (identica à original até o dia 23/02/2022 - 17:28) que agora está salva também no ACR do Azure
# COPY ./html/ /usr/share/nginx/html
# Copia de todo o conteúdo PERSONALIZADO para a pasta padrão da imagem oficial
EXPOSE 80
# Abre a porta 80
