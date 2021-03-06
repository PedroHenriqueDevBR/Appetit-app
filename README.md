
<h1  align="center">
<img width="200" src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/assets/app_logo.png" /><br>
</h1>

<h3 align="center">
    :coffee: Front-end da aplicação para solicitação de pedidos em um café fictício.
</h3>


<p align="center">
<img alt="Developer" src="https://img.shields.io/badge/Developer-PedroHenriqueDevBR-green">
<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/pedrohenriquedevbr/Appetit-app">
<img alt="Framework" src="https://img.shields.io/badge/Framework-Flutter-blue">
<img alt="Framework" src="https://img.shields.io/badge/State_Manager-MobX-blue">
</p>

# :memo: Visão Geral

Esta aplicação foi desenvolvida durante o processo de seleção para programador mobile Júnior da empresa Maida Health, esta aplicação contempla o front-end da solução, ou seja, não utiliza o consumo de dados de nenhuma API externa.


 * <strong><a href="#tecnologias">Tecnologias utilizadas</a></strong>
 * <strong><a href="#modelagem">Modelagem da aplicação</a></strong>
    * <strong><a href="#modelagem-classes">Modelagem das classes</a></strong>
    * <strong><a href="#modelagem-mapa-aplicacao">Mapa da aplicação</a></strong>
 * <strong><a href="#requisitos">Pré-requisitos</a></strong>
 * <strong><a href="#instalacao">Instalação</a></strong>
 * <strong><a href="#funcionalidades">Funcionalidades</a></strong>
 * <strong><a href="#screenshots">Screenshots</a></strong>

<h1 id="tecnologias">:rocket: Tecnologias utilizadas</h1>

<br>

* <img alt="Dart" src="https://img.shields.io/badge/-Dart-blue"> - Linguagem de programação utilizada pelo Framework Flutter.
* <img alt="Flutter" src="https://img.shields.io/badge/-Flutter-blue"> - Framework utilizado no desenvolvimento da aplicação.
* <img alt="MobX" src="https://img.shields.io/badge/-MobX-blue"> - Biblioteca utilizada para facilitar a gerência de estado da aplicação.

<h1 id="modelagem">:bulb: Modelagem da aplicação</h1>

Esta seção irá mostrar como a aplicação foi modelada para que pudesse atender todas as necessidades propostas da descrição do desafio.

A modelagem foi criada antes de iniciar o desenvolvimento da aplicação, com o objetivo de guiar o desenvolvimento e evitar erros que pudessem atrapalhar o andamento do desenvolvimento.

<h2 id="modelagem-classes">Modelagem das classes</h2>

<img width="100%" src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/models/project-modeling.png" />

### Descrição das classes

* **User** - Classe referente ao usuário logado na aplicação, é a classe principal da aplicação, entre os atributos da classe User, destaco o food_categories e o demands, o primeiro atributo citado armazenam informações sobre as categorias com as comidas que um usuário possui, comidas que estão disponíeis para venda, e o segundo atributo refere-se a lista de pedidos que o usuário possui.

* **Food Category** - Classe que possui uma lista de comidas (Food).

* **Food** - Classe com informações das comidas.

* **Client** - Classe com informações dos clientes registrados.

* **Demand** - Classe com informações de um pedido.

* **Food Demand** - Classe auxiliar, esta classe serve para auxiliar a classe Food e Demand, onde, um pedido possui uma lista de comidas e para cada comida dessa lista há uma quantidade de unidades selecionada, exemplo 3 unidades de misto quente. Esta classe mantém informações da comida selecionada na classe de pedido (Demand).

* **Demand Date** - Classe auxiliar, o objetivo dessa classe é facilitar a apresentação dos pedidos em suas respectivas datas.

<h2 id="modelagem-mapa-aplicacao">Mapa da aplicação</h2>

<img width="100%" src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/models/pages.svg" />

### Descrição das páginas

* **Login** - A página de login é a primeira página apresentada na aplicação, a função dessa página é controlar o acesso ao resto da aplicação. Dois requisitos devem ser satisfeitos para que um usuário possa ativar o botão de login da página, que são elas, o e-mail deve ser válido e a senha deve conter pelo menos 6 caracteres.

* **History** - A página de histórico apresenta todos os pedidos salvos do usuário logado.

* **Demand Information** - Esta é a primeira página apresentada no processo de criação de um pedido, esta é a página onde as comidas podem ser selecionadas e a página de seleção de comida possa ser chamada.

* **Select food** - Página responsável por obter informações sobre uma comida selecionada na página Demand Information, esta página irá obter os dados da comida selecionada e retornar uma nova comida para a página Demand Informations.

* **List Clients** - Página apresentada quando a página Demand Information está concluída, esta página lista os clientes disponíveis para seleção, onde a seleção de um cliente indica que este cliente está fazendo a compra da comida.

* **Demand Status** - Página para obter informações sobre o status do pedido.

* **End** - Página que informa a finalização do pedido, a partir dessa página o usuário possui duas opções, ir para a página History ou fazer um novo pedido em Demand Information. 

<h1 id="requisitos">:warning: Pré-requisitos</h1>

O desenvolvimento dessa aplicação utiliza como base as seguintes tecnologias e versões apresentadas abaixo. Caso ocorra algum erro na execução da aplicação ou mesmo nos comandos de configurações, verifique se a versão do Dart e do Flutter no seu computador estão devidamente atualizados.

1. Dart 2.10.0 (stable)
2. Flutter 1.22.1 (stable)
3. git version 2.17.1

<h1 id="instalacao">:information_source: Instalação</h1>

```bash
# Execute o comando abaixo e clone o repositório do projeto
git clone https://github.com/PedroHenriqueDevBR/Appetit-app.git

# Acesse o projeto
cd Appetit-app

# Execute o comanmdo para obter as dependências do projeto
flutter pub get 

# Execute o seguinte comando para construir as classes do MobX
flutter pub run build_runner build

# Se o comando anterior apresentar uma mensagem de erro execute
# o comando abaixo, e em seguite execute o comando anterior novamente
flutter pub run build_runner build --delete-conflicting-outputs

# Por fim, para executar o projeto execute o comando abaixo
flutter run 
```

<h2 id="funcionalidades">:heavy_check_mark: Funcionalidades</h2>
- [x] Páginas de login;
- [x] Página com lista de pedidos efetuados;
- [x] Página de novos pedidos;
- [x] Página de detalhamento do pedido;
- [x] Página de selecionar clientes;
- [x] Página de adicionar informações ao pedido;
- [x] Feedback do pedido realizado.

<h2 id="screenshots">:iphone: Screenshots (All screenshots)</h2>

## Login

<div>
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/login-01.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/login-02.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/login-03.png" width="210" />
</div>

## History
<div>
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/history-01.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/history-02.png" width="210" />
</div>

## Demand information
<div>
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/demand-informatio-01.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/demand-informatio-02.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/demand-informatio-03.png" width="210" />
</div>

## Select product
<div>
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/select-food-01.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/select-food-02.png" width="210" />
</div>

## Client List
<div>
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/client-list-01.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/client-list-02.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/client-list-03.png" width="210" />
</div>

## Demand Status
<div>
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/demand-status-01.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/demand-status-02.png" width="210" />
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/demand-status-03.png" width="210" />
</div>

## End
<div>
<img src="https://raw.githubusercontent.com/PedroHenriqueDevBR/Appetit-app/main/docs/screenshots/end.png" width="210" />
</div>
