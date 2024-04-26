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

## Perguntas de negócio
### 1) Qual o número total de vendas? Qual a porcentagem de fraudes?

O número total de vendas do e-commerce no período analisado foi de 151112 vendas. Dessas vendas, 14151 foram fraudes, correspondendo a 9,36% do total de vendas do e-commerce. Para facilitar a interpretação dos dados, podemos analisar o gráfico abaixo.

<img src="assets/1_total_porcentagem.png">

### 2) Qual foi o valor total de vendas? Qual a porcentagem de fraudes?

No período analisado, o valor total de vendas foi de $ 5581378. Desse total, $ 523488 foram fraudes, correspondendo a 9,38% do faturamento do e-commerce.

<img src="assets/2_faturamento_porcentagem.png">

### 3) Temos algum usuário que fraudou mais de uma vez? Quem fraudou usou o mesmo dispositivo para cometer a fraude?

Procurando pelo 'user_id', não encontramos nenhum usuário que fraudou a empresa mais que uma vez. Isso pode acontecer devido a
ao fato de que o usuário que vai fraudar a empresa cria um novo usuário toda vez que faz o login.  Já utilizando o 'device_id' na busca, encontramos várias fraudes cometidas em um mesmo dispositivo, ou seja, o fraudador usa o mesmo dispositivo mais de uma vez para fraudar a empresa. 

Logo, podemos sugerir ao e-commerce barrar a compra a partir do 'device_id' para evitar mais fraudes.

Analisando os dados relacionados ao dispositivo utilizado pelo usuário, observamos que pouco mais de 50% das fraudes foram cometidas até 8 vezes no mesmo dispositivo. Especificamente, 27,49% das fraudes foram cometidas exatamente 2 vezes com um único dispositivo. A média de fraudes por dispositivo é de 7,86, com o máximo de 19 fraudes cometidas pelo mesmo dispositivo.

<img src="assets/3_device_box_plot.png">

<img src="assets/3_device_histograma.png">









