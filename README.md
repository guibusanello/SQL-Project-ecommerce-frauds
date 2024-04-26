# SQL-Project-ecommerce-frauds

## Introdução
Nesta análise exploratória de dados, investigaremos as transações de um e-commerce com o objetivo de identificar padrões e indicativos de fraudes. Utilizando VSCode, MySQL e o Microsoft Excel, nosso foco será entender melhor o comportamento das transações e detectar possíveis indicativos de atividades fraudulentas. Essa análise será fundamental para desenvolvermos estratégias eficazes de prevenção e detecção de fraudes, garantindo a segurança e a confiabilidade das operações do e-commerce.

Vamos iniciar nossa análise exploratória e investigar os dados em busca de insights valiosos para aprimorar a segurança das transações online.

## Dados e ferramentas utilizadas
O banco de dados está disponível no Kaggle, e pode ser acessado no link abaixo:

https://www.kaggle.com/datasets/vbinh002/fraud-ecommerce/data

Para essa análise, usei o MySQL para importar o arquivo contendo a base de dados desse estudo, o VSCode para realizar a análise exploratória dos dados e o Microsoft Excel para a estatística descritiva e a construção dos gráficos.

## Descrição do banco de dados
Segue abaixo a descrição das variáveis:

- user_id: número de identificação do usuário
- signup_time: data e horário em que o usuário fez o login
- purchase_time: data e horário em que o usuário fez a compra
- purchase_value: valor da compra
- device_id: número de identificação do aparelho utilizado pelo cliente
- source: via por onde o usuário chegou ao e-commerce
- browser: navegador utilizado pelo usuário
- sex: gênero do usuário
- age: idade do usuário
- ip_address: endereço de IP do usuário
