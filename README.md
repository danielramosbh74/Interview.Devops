# Interview.Devops

- [x] 1. Criar um repositorio no github

- [x] 2. Colocar nesse repositorio um Dockerfile com um Nginx
- **Observação**
O Dockerfile foi colocado no repositório e o Nginx está rodando localmente como uma imagem Docker, mas ficou uma dúvida:
Da forma como configurei o Dockerfile, apenas os arquivos alterados na pasta pública do Nginx serão alterados, não será possível alterar as suas configurações via repositório Github, apenas entrando no container dele. Não acho que está "errado", mas talvez seja melhor uma outra abordagem, como colocar TODOS os arquivos do Nginx no repositório do Github.

![Conta Azure grátis criada](images/Nginx-recem-instalado-com-index-padrao.png)


- [x] 3. Criar uma conta na Azure ( Free )
![Conta Azure grátis criada](images/criei-a-conta-gratuita-no-azure.png)

- [ ] 4. Criar na azure um Cluster ACS

- [ ] 5. Via **Github Action** subir a imagem no ACS

- [ ] 6. Liberar acesso publico, porém somente na porta 80
