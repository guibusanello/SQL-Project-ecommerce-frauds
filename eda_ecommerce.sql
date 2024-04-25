-- Criando e usando DB

CREATE DATABASE IF NOT EXISTS ecommerce
USE ecommerce

-- Criando a tabela
/*
A tabela foi criada diretamente no MySQL Workbench utilizando o comando Table Data Import Wizard!
*/

-- Conferindo se os dados foram importados corretamente

SELECT *
FROM fraud_data
LIMIT 20

-- Perguntas de negócio
-- 1 - Qual o número de fraudes?

SELECT 
    class,
    COUNT(class) as total
FROM fraud_data
GROUP BY class

-- 2 - Qual a porcentagem de vendas com fraudes?
/*
Nesse caso, como a variável 'class' é uma variável do tipo texto, vamos criar uma subquery dentro da query 
para obter o total da contagem sem a interferência do GROUP BY, e depois sim fazer o cálculo
*/

SELECT 
    class, 
    COUNT(class) AS total,
    count(class) * 100 / (
                        SELECT count(class) FROM fraud_data) AS porcentagem
FROM fraud_data
GROUP BY class

-- 3 - Qual o faturamento total do ano e qual o valor total de fraudes? Qual a porcentagem de fraudes?

SELECT  class, 
        SUM(purchase_value) AS total
FROM fraud_data
GROUP BY class

SELECT 
    class, 
    SUM(purchase_value) AS total,
    SUM(purchase_value) * 100 / (
                        SELECT SUM(purchase_value) FROM fraud_data) AS porcentagem
FROM fraud_data
GROUP BY class

-- 4 - Temos algum usuário que fraudou mais de uma vez? Quem fraudou usou o mesmo dispositivo para cometer a fraude?

SELECT
    class,
    user_id,
    COUNT(*) AS contagem
FROM fraud_data
GROUP BY class, user_id
HAVING COUNT(*) > 1
ORDER BY contagem

SELECT
    class,
    device_id,
    COUNT(*) AS contagem
FROM fraud_data
GROUP BY class, device_id
HAVING COUNT(*) > 1 AND class = 1
ORDER BY contagem DESC

/*
Procurando pelo 'user_id', não encontramos nenhum usuário que fraudou a empresa mais que uma vez. Isso pode acontecer devido a
ao fato de que o usuário que vai fraudar a empresa cria um novo usuário toda vez que faz o login. Já utilizando o 'device_id' na
busca, encontramos várias fraudes cometidas em um mesmo dispositivo, ou seja, o fraudador usa o mesmo dispositivo várias vezes
para fraudar a empresa. 
Logo, podemos barrar a compra a partir do 'device_id' e evitar mais fraudes.
*/

-- 5 - Qual o intervalo de tempo entre o cadastro e a compra do site? Existe alguma relação do intervalo de tempo com as fraudes?
/* Calculando a diferença em número de dias */

SELECT
    class,
    signup_time,
    purchase_time,
    DATEDIFF(signup_time, purchase_time) AS diferenca_data
FROM fraud_data
HAVING class = 1
ORDER BY diferenca_data DESC

SELECT
    class,
    signup_time,
    purchase_time,
    DATEDIFF(signup_time, purchase_time) AS diferenca_data
FROM fraud_data
HAVING class = 1 AND diferenca_data = 0
ORDER BY diferenca_data DESC

SELECT
    class,
    signup_time,
    purchase_time,
    DATEDIFF(signup_time, purchase_time) AS diferenca_data
FROM fraud_data
HAVING class = 1 AND diferenca_data <> 0
ORDER BY diferenca_data DESC

/* Podemos observar que em pouco mais da maioria dos casos fraudulentos, a diferença de data é 0 dias.
Agora vamos calcular a diferença de tempo em segundos */

SELECT
    class,
    signup_time,
    purchase_time,
    TIMESTAMPDIFF(SECOND, signup_time, purchase_time) AS diferenca_segundos
FROM fraud_data
HAVING class = 1
ORDER BY diferenca_segundos

SELECT
    class,
    signup_time,
    purchase_time,
    TIMESTAMPDIFF(SECOND, signup_time, purchase_time) AS diferenca_segundos
FROM fraud_data
HAVING class = 1 AND diferenca_segundos = 1
ORDER BY diferenca_segundos

SELECT
    class,
    signup_time,
    purchase_time,
    TIMESTAMPDIFF(SECOND, signup_time, purchase_time) AS diferenca_segundos
FROM fraud_data
HAVING class = 1 AND diferenca_segundos <> 1
ORDER BY diferenca_segundos

/* Mais da metade das fraudes (7600) aconteceram em compras que duraram 1 segundo. */

-- 6 - Qual o browser teve mais fraudes?

SELECT
    class,
    browser,
    COUNT(browser) AS num_fraudes_browser
FROM fraud_data
WHERE class = 1
GROUP BY browser
ORDER BY num_fraudes_browser DESC

-- 7 - Qual fonte teve mais fraudes?

SELECT
    class,
    source,
    COUNT(source) AS num_fraudes_source
FROM fraud_data
WHERE class = 1
GROUP BY source
ORDER BY num_fraudes_source DESC

-- 8 - Quem comete mais fraudes: homens ou mulheres?

SELECT
    class,
    sex,
    COUNT(sex) AS num_fraudes_sex
FROM fraud_data
WHERE class = 1
GROUP BY sex
ORDER BY num_fraudes_sex DESC

-- 9 - De quais idades são as pessoas que mais cometeram fraudes?

SELECT
    class,
    age,
    COUNT(age) AS num_fraudes_age
FROM fraud_data
WHERE class = 1
GROUP BY age
ORDER BY num_fraudes_age DESC

-- 10 - Existe alguma faixa de preço que tem mais fraudes?
/*
Nesse caso, podemos descobrir quais produtos são mais visados pelos usuários que cometem fraudes
de acordo com o seu preço.
*/

SELECT
    class,
    purchase_value,
    COUNT(purchase_value) AS num_fraudes_preco
FROM fraud_data
WHERE class = 1
GROUP BY purchase_value
ORDER BY num_fraudes_preco DESC