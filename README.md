# tractian

Este projeto foi desenvolvido como parte do teste para a vaga da Tractian de Desenvolvedor Mobile Flutter. Criei seguindo princípios de OOP, Design Paterns e boas práticas de arquitetura, além de buscar melhorar a expeência com a UI da aplicação.

Imagens:
| Companies | Assets | Video |
| ---------- | ---------- | ---------- |
| <img src='https://github.com/user-attachments/assets/0142dd94-928c-4869-8deb-33002957888b' height='500'/> | <img src='https://github.com/user-attachments/assets/c633fa3b-7517-4588-925e-4398f90db125' height='500'/> | <video src='https://github.com/user-attachments/assets/c622bb43-a74f-43c8-b906-8711555ca41a' height='500'/> |


## Allterações de layout:
### Companies:
- Estilo dos botões.

### Assets:
- Atribuir o nome da compania na AppBar para ajudar na localização do usuário;
- Agrupamento mais nítido na arvore, ajuda o usuário a separar melhor as coisas e se confundir menos.

## Como esta:
- Estou recebendo a lista de locations junto com a lista de assets;
- Usei de OOP para definir melhor o papel e responsabilidades de cada entidade;
- Com uma entidade que possui `childrens` consigo montar melhor uma arvore inteira de pais que tem filhos, e que também são pais e por aí vai;
- Utilizei mapas para deixar essa estrutura com acesso mais rápido;
- Como todo elemento tem como herança a `ElementTreeEntity` criei um factory para criar esses widgets da arvore;
- Para a busca eu adicionei um médodo `toStringToSearch` onde adiciono somente as informações que preciso em uma string para busca, uso de herança para não repetir código;
- Utilizei o Bloc Cubit para gerenciamento de estado;
- Utilizei o Modular para fazer as injeções de dependências;
- Utilizei o DartZ para controlar os sucessos e falha dos usecases.

## Faria se tivesse mais tempo:
- Trabalhar com dado local: a idéria era sempre abrir a aplicação com o dado salvo local, e na sequência buscar o remoto;
- Mais testes unitátios.

## Considerações Finais:
Estou aberto a feedbacks e melhorias. Agradeço a oportunidade e estou à disposição para discutir o projeto.

