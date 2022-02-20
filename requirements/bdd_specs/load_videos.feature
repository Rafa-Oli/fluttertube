Feature: Listar Videos
Como usuário
Quero poder ver todos os videos

Cenário: Com internet
Dado que o usuário tem conexão com a internet
Quando solicitar para ver os videos
Então o sistema deve exibir os videos

Cenário: Sem internet
Dado que o cliente não tem conexão com a internet
Quando solicitar para ver os videos
Então o sistema deve exibir os videos