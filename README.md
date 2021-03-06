# Interview.Devops

- [x] 1. Criar um repositorio no github

- [x] 2. Colocar nesse repositorio um Dockerfile com um Nginx

- **Observação**
O Dockerfile foi colocado no repositório e o Nginx está rodando localmente como uma imagem Docker, mas ficou uma dúvida:
Da forma como configurei o Dockerfile, apenas os arquivos alterados na pasta pública do Nginx serão alterados, não será possível alterar as suas configurações via repositório Github, apenas entrando no container dele. Não acho que está "errado", mas talvez seja melhor uma outra abordagem, como colocar TODOS os arquivos do Nginx no repositório do Github.

![Conta Azure grátis criada](images/Nginx-recem-instalado-com-index-padrao.png)


- [x] 3. Criar uma conta na Azure ( Free )

![Conta Azure grátis criada](images/criei-a-conta-gratuita-no-azure.png)


- [x] 4. Criar na azure um Cluster ACS

https://qbem1.azurewebsites.net/

ssh://169.254.129.3

![Cluster ACS configurado, mas ainda sem nenhuma imagem ou App personalizado executando](images/qbem1-app-service-is-up-and-running.png)

**Observações**
1. Além de criar o Cluster ACS, já fiz, _manualmente_ também o _primeiro_ upload da imagem Docker do Nginx, pois acho importante aprender primeiro "manualmente" e repetir o processo algumas vezes, para, depois, automatizar o processo.

2. Pensei que fosse mostrar a tela inicial de boas-vindas do index.html do Nginx, mas mostrou esta tela inicial do ACS. 
É isso mesmo? (Continuarei testando e estudando as páginas de documentação do Azure)
No "Centro de implantação" consegui configurar para fazer o push "semi-automático" (graficamente) da imagem docker que já estava no ACR **sem precisar instalar o docker manualmente na ACS, como faria se fosse uma VM**

**Agora sim!** O Nginx já está rodando com a sua tela inicial index.htlm de boas-vindas! ;)

![Nginx no ACS](images/nginx-configurado-na-acs-azure.png)

- [x] 5. Via **Github Action** subir a imagem no ACS

Sucesso! :)
Primeiro build e deploy feitos automaticamente após o `git push`, que dispara o **Github Actions" 

![Github Actions](images/Agora-sim---primeiro-build-e-deploy-automatico-no-github-actions-1-de-2.png)

![Github Actions](images/Agora-sim---primeiro-build-e-deploy-automatico-no-github-actions-2-de-2.png)


- [x] 6. Liberar acesso publico, porém somente na porta 80

Consegui parcialmente... 

A configuração padrão de rede é com o acesso 100% liberado.

Criei o "Grupo de Segurança de Rede" _nsg1_ e configurei as regras de entrada permitino somente as portas 80 (http) e 22 (ssh, necessária para configurações) e bloqueando a porta 443 (https), mas mesmo parando e reiniciando o aplicativo não funcionou...

![Grupo de Segurança de Rede - nsg1](images/implantei-o-nsg1-para-configurar-as-regras-de-entrada.png)
