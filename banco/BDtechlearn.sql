use techlearn;
insert into categorias (nome, descricao)
values ('Programação', 'Lógica e Linguagens de Programação');
select*from categorias;


insert into cursos (categoria_id, titulo, descricao, nivel, ativo)
values (
  (select id from categorias where nome = 'Programação'),
  'Curso de Python 3 - Mundo 1: Fundamentos',
  'Curso em vídeo-aulas de Python 3 do canal Curso em Vídeo, com aulas e exercícios práticos.',
  'Iniciante',
  true
);

set @curso_id = last_insert_id();

insert into aulas (curso_id, titulo, video_youtube_id, ordem) values
(@curso_id, 'Curso Python #01 - Seja um Programador', 'S9uPNppGsGo', 1),
(@curso_id, 'Curso Python #02 - Para que serve o Python?', 'Mp0vhMDI7fA', 2),
(@curso_id, 'Curso Python #03 - Instalando o Python3 e o IDLE', 'VuKvR1J2LQE', 3),
(@curso_id, 'Curso Python #04 - Primeiros comandos em Python3', '31llNGKWDdo', 4),
(@curso_id, 'Curso Python #05 - Instalando o PyCharm e o QPython3', 'ElRd0cbXIv4', 5),
(@curso_id, 'Exercício Python #001 - Deixando tudo pronto', 'nIHq1MtJaKs', 6),
(@curso_id, 'Exercício Python #002 - Respondendo ao Usuário', 'FNqdV5Zb_5Q', 7),
(@curso_id, 'Curso Python #06 - Tipos Primitivos e Saída de Dados', 'hdDHg1p3YVc', 8),
(@curso_id, 'Exercício Python #003 - Somando dois números', 'PB254Cfjlyk', 9),
(@curso_id, 'Exercício Python #004 - Dissecando uma Variável', 'tHYxjJxtJko', 10),
(@curso_id, 'Curso Python #07 - Operadores Aritméticos', 'Vw6gLypRKmY', 11),
(@curso_id, 'Exercício Python #005 - Antecessor e Sucessor', '664e0G_S9nU', 12),
(@curso_id, 'Exercício Python #006 - Dobro, Triplo, Raiz Quadrada', 'mqcNw_dhl8I', 13),
(@curso_id, 'Exercício Python #007 - Média Aritmética', '_QfISzy0IKs', 14),
(@curso_id, 'Exercício Python #008 - Conversor de Medidas', 'KjcdG05EAZc', 15),
(@curso_id, 'Exercício Python #009 - Tabuada', 'qajq3SI0QQs', 16),
(@curso_id, 'Exercício Python #010 - Conversor de Moedas', 'xM4AX3Lp2mo', 17),
(@curso_id, 'Exercício Python #011 - Pintando Parede', 'mzSJpn9ldt4', 18),
(@curso_id, 'Exercício Python #012 - Calculando Descontos', '4MAmKOT9FeU', 19),
(@curso_id, 'Exercício Python #013 - Reajuste Salarial', 'cTkivN8XcJ0', 20),
(@curso_id, 'Exercício Python #014 - Conversor de Temperaturas', '9l_Gay8BuAw', 21),
(@curso_id, 'Exercício Python #015 - Aluguel de Carros', 'I4NYUeetLAc', 22),
(@curso_id, 'Curso Python #08 - Utilizando Módulos', 'oOUyhGNib2Q', 23),
(@curso_id, 'Exercício Python #016 - Quebrando um número', '-iSbDpl5Jhw', 24),
(@curso_id, 'Exercício Python #017 - Catetos e Hipotenusa', 'vmPW9iWsYkY', 25),
(@curso_id, 'Exercício Python #018 - Seno, Cosseno e Tangente', '9GvsphwW26k', 26),
(@curso_id, 'Exercício Python #019 - Sorteando um item na lista', '_Nk02-mfB5I', 27),
(@curso_id, 'Exercício Python #020 - Sorteando uma ordem na lista', 'OPh0nngbBSY', 28),
(@curso_id, 'Exercício Python #021 - Tocando um MP3', '9FiEji_fzvk', 29),
(@curso_id, 'Curso Python #09 - Manipulando Texto', 'a7DH88vk2Sk', 30),
(@curso_id, 'Exercício Python #022 - Analisador de Textos', 'EQQt-6QqXOs', 31),
(@curso_id, 'Exercício Python #023 - Separando dígitos de um número', 'wD2aerLMBWA', 32),
(@curso_id, 'Exercício Python #024 - Verificando as primeiras letras de um texto', 'QroT8cZMRnc', 33),
(@curso_id, 'Exercício Python #025 - Procurando uma string dentro de outra', 'WHWGz2Dy1ZU', 34),
(@curso_id, 'Exercício Python #026 - Primeira e última ocorrência de uma string', '23UOVEetNPY', 35),
(@curso_id, 'Exercício Python #027 - Primeiro e último nome de uma pessoa', 'SifYYsXhLM8', 36),
(@curso_id, 'Curso Python #10 - Condições (Parte 1)', 'K10u3XIf1-Q', 37),
(@curso_id, 'Exercício Python #028 - Jogo da Adivinhação v.1.0', 'kchC5KLZSZ4', 38),
(@curso_id, 'Exercício Python #029 - Radar eletrônico', 'hgJ_ETNGSj8', 39),
(@curso_id, 'Exercício Python #030 - Par ou Ímpar?', '4vFCzKuHOn4', 40),
(@curso_id, 'Exercício Python #031 - Custo da Viagem', 'PGqHyzWoagc', 41),
(@curso_id, 'Exercício Python #032 - Ano Bissexto', 'cyGY_83m4Xw', 42),
(@curso_id, 'Exercício Python #033 - Maior e menor valores', 'a_8FbW5oH6I', 43),
(@curso_id, 'Exercício Python #034 - Aumentos múltiplos', 'Sfadj_AzKHw', 44),
(@curso_id, 'Exercício Python #035 - Analisando Triângulo v1.0', 'NZiNphKkxhg', 45),
(@curso_id, 'Curso Python #11 - Cores no Terminal', '0hBIhkcA8O8', 46);

select count(*) as total_aulas from aulas where curso_id = @curso_id;


select count(*) from cursos;
select count(*) from aulas;

use techlearn;
select id, nome from categorias;

use techlearn;


insert into cursos (categoria_id, titulo, descricao, nivel, ativo)
values (
  (select id from categorias where nome = 'Banco de dados'),
  'Banco de Dados 1',
  'Curso em vídeo-aulas do Prof. Tiago Segato: conceitos de banco de dados, modelo entidade-relacionamento, modelo relacional e normalização.',
  'Iniciante',
  true
);

set @curso_id = last_insert_id();

insert into aulas (curso_id, titulo, video_youtube_id, ordem) values
(@curso_id, 'Conceitos Iniciais', '9JNqj8ARj_4', 1),
(@curso_id, 'Conceitos Gerais', 'RfSXBz4oj4g', 2),
(@curso_id, 'SGBD - Sistemas Gerenciadores de Banco de Dados', '33l_2gaSnAs', 3),
(@curso_id, 'Modelo Entidade Relacionamento', 'DjSwgkW_tWQ', 4),
(@curso_id, 'Tipos de atributos do MER', 'NgVs6nR1haQ', 5),
(@curso_id, 'Tipos de Relacionamentos do MER', 'wAjgPu0ZibA', 6),
(@curso_id, 'MER Estendido (MER-EX)', 'i2v2M2u4xU0', 7),
(@curso_id, 'Mapeamento do MER para o Modelo Relacional', 'aD7PjxxNJxE', 8),
(@curso_id, 'Mapeamento do MER para o Modelo Relacional (parte 2)', 'VfS3Cfmjyrg', 9),
(@curso_id, 'Normalização de relações', 'ikFjbstV98w', 10),
(@curso_id, 'Normalização de relações (parte 2)', 'nf7RoBT1l1E', 11),
(@curso_id, 'Correção da lista de exercícios 1', '3rjKo2ej3jM', 12),
(@curso_id, 'Correção da lista de exercícios 2', 'hcP8jfVUgGs', 13),
(@curso_id, 'Correção da lista de exercícios 3', 'xzu0T_Vc-fM', 14),
(@curso_id, 'Diagrams.net: Desenvolva diagramas online gratuitamente!', 'Y9LnhNs1GKo', 15);


select count(*) as total_aulas from aulas where curso_id = @curso_id;

show tables;
SELECT id, titulo
FROM cursos
WHERE titulo LIKE '%Java%';


DESCRIBE cursos;
describe aulas;
describe categorias;
describe curso_id;

use techlearn;


SET @curso_id = 1;

INSERT INTO aulas (curso_id, titulo, youtube_id, url, ordem)
VALUES
(@curso_id, 'Curso de Java #01 - História do Java', 'sTX0UEplF54', 'https://www.youtube.com/watch?v=sTX0UEplF54&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 1),
(@curso_id, 'Exercícios de Java #01 - Curso de Java para Iniciantes', 'ZBKxhnqX-Q0', 'https://www.youtube.com/watch?v=ZBKxhnqX-Q0&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 2),
(@curso_id, 'Curso de Java #02 - Como Funciona o Java', 'v_ZCtgwbS3o', 'https://www.youtube.com/watch?v=v_ZCtgwbS3o&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 3),
(@curso_id, 'Exercícios de Java #02 - Curso de Java para Iniciantes', 'bIXDystGxj0', 'https://www.youtube.com/watch?v=bIXDystGxj0&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 4),
(@curso_id, 'Curso de Java #03 - Instalando o JDK no seu Computador', 'yWU5bm_pZzY', 'https://www.youtube.com/watch?v=yWU5bm_pZzY&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 5),
(@curso_id, 'Exercícios de Java #03 - Curso de Java para Iniciantes', 'gsp1H0-FVGI', 'https://www.youtube.com/watch?v=gsp1H0-FVGI&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 6),
(@curso_id, 'Curso de Java #04 - Primeiro Programa em Java', 'ijXXaIYsVx4', 'https://www.youtube.com/watch?v=ijXXaIYsVx4&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 7),
(@curso_id, 'Exercícios de Java #04 - Curso de Java', 'H7Qpt8NRpDw', 'https://www.youtube.com/watch?v=H7Qpt8NRpDw&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 8),
(@curso_id, 'Curso de Java #05 - Introdução ao Swing e JavaFX', 'cYMruFKwqf0', 'https://www.youtube.com/watch?v=cYMruFKwqf0&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 9),
(@curso_id, 'Exercícios de Java #05 - Curso de Java', 'UaTZTP50i08', 'https://www.youtube.com/watch?v=UaTZTP50i08&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 10),
(@curso_id, 'Curso de Java #06 - Tipos Primitivos e Manipulação de Dados', 'JEAQeT7YGs4', 'https://www.youtube.com/watch?v=JEAQeT7YGs4&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 11),
(@curso_id, 'Exercícios de Java #06 - Curso de Java', '7XPR-v1Fzjw', 'https://www.youtube.com/watch?v=7XPR-v1Fzjw&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 12),
(@curso_id, 'Curso de Java #07 - Operadores Aritméticos e Classe Math', 'W9V5wtOOZHs', 'https://www.youtube.com/watch?v=W9V5wtOOZHs&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 13),
(@curso_id, 'Exercícios de Java #07 - Curso de Java', 'dEuQBmHXRnY', 'https://www.youtube.com/watch?v=dEuQBmHXRnY&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 14),
(@curso_id, 'Curso de Java #08 - Operadores Lógicos e Relacionais', 'xHgnlic7fj8', 'https://www.youtube.com/watch?v=xHgnlic7fj8&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 15),
(@curso_id, 'Exercícios de Java #08 - Curso de Java', 'LNECh9RplE0', 'https://www.youtube.com/watch?v=LNECh9RplE0&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 16),
(@curso_id, 'Curso de Java #09 - Estruturas Condicionais (Parte 1)', 'wW3eve4vTMc', 'https://www.youtube.com/watch?v=wW3eve4vTMc&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 17),
(@curso_id, 'Exercícios de Java #09 - Curso de Java', 'mGgd1f66kWE', 'https://www.youtube.com/watch?v=mGgd1f66kWE&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 18),
(@curso_id, 'Curso de Java #10 - Estruturas Condicionais (Parte 2)', 'oNSrBld06qs', 'https://www.youtube.com/watch?v=oNSrBld06qs&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 19),
(@curso_id, 'Exercícios de Java #10 - Curso de Java', 'd-2E7c2Kfcc', 'https://www.youtube.com/watch?v=d-2E7c2Kfcc&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 20),
(@curso_id, 'Curso de Java #11 - Estruturas de Repetição (Parte 1)', '2fawKjR8d4c', 'https://www.youtube.com/watch?v=2fawKjR8d4c&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 21),
(@curso_id, 'Exercícios de Java #11 - Curso de Java', 'vdAArHfOS9k', 'https://www.youtube.com/watch?v=vdAArHfOS9k&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 22),
(@curso_id, 'Curso de Java #12 - Estruturas de Repetição (Parte 2)', 'ojLALwmvQIU', 'https://www.youtube.com/watch?v=ojLALwmvQIU&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 23),
(@curso_id, 'Exercício de Java #12', 'sUSnoHiTZ8E', 'https://www.youtube.com/watch?v=sUSnoHiTZ8E&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 24),
(@curso_id, 'Curso de Java #13 - Estruturas de Repetição (Parte 3)', 'XLqPZh6n8IA', 'https://www.youtube.com/watch?v=XLqPZh6n8IA&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 25),
(@curso_id, 'Exercícios de Java #13 - Curso de Java', 'ZYvGz1h_2MU', 'https://www.youtube.com/watch?v=ZYvGz1h_2MU&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 26),
(@curso_id, 'Curso de Java #14 - Vetores', 'KAS94-Lcboc', 'https://www.youtube.com/watch?v=KAS94-Lcboc&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 27),
(@curso_id, 'Exercícios de Java #14 - Curso de Java', '6YxJOIxJyKo', 'https://www.youtube.com/watch?v=6YxJOIxJyKo&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 28),
(@curso_id, 'Curso de Java #15 - Métodos', 'EuxmbXZCFVQ', 'https://www.youtube.com/watch?v=EuxmbXZCFVQ&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 29),
(@curso_id, 'Exercícios de Java #15 - Curso de Java', 'Fh5s0RUjhmQ', 'https://www.youtube.com/watch?v=Fh5s0RUjhmQ&list=PLHz_AreHm4dkI2ZdjTwZA4mPMxWTfNSpR', 30);

select * from categorias;
select * from cursos;
select * from aulas;

USE TechLearn;


USE TechLearn;

INSERT INTO cursos (
    categoria_id,
    titulo,
    descricao,
    nivel,
    ativo
)
SELECT
    2,
    'Curso de Java para Iniciantes',
    'Curso de Java do básico ao avançado, com aulas teóricas e exercícios práticos.',
    'Iniciante',
    1
WHERE NOT EXISTS (
    SELECT 1
    FROM cursos
    WHERE titulo = 'Curso de Java para Iniciantes'
);

SET @curso_java_id = (
    SELECT id
    FROM cursos
    WHERE titulo = 'Curso de Java para Iniciantes'
    LIMIT 1
);

SELECT @curso_java_id AS id_curso_java;


SET @curso_java_id = (
    SELECT id
    FROM cursos
    WHERE titulo = 'Curso de Java para Iniciantes'
    LIMIT 1
);

INSERT INTO aulas (
    curso_id,
    titulo,
    video_youtube_id,
    ordem,
    descricao
)
SELECT
    @curso_java_id,
    v.titulo,
    v.youtube_id,
    v.ordem,
    'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'
FROM (
    SELECT 1 AS ordem, 'Curso de Java #01 - História do Java' AS titulo, 'sTX0UEplF54' AS youtube_id
    UNION ALL SELECT 2, 'Exercícios de Java #01 - Curso de Java para Iniciantes', 'ZBKxhnqX-Q0'
    UNION ALL SELECT 3, 'Curso de Java #02 - Como Funciona o Java', 'v_ZCtgwbS3o'
    UNION ALL SELECT 4, 'Exercícios de Java #02 - Curso de Java para Iniciantes', 'bIXDystGxj0'
    UNION ALL SELECT 5, 'Curso de Java #03 - Instalando o JDK no seu Computador', 'yWU5bm_pZzY'
    UNION ALL SELECT 6, 'Exercícios de Java #03 - Curso de Java para Iniciantes', 'gsp1H0-FVGI'
    UNION ALL SELECT 7, 'Curso de Java #04 - Primeiro Programa em Java', 'ijXXaIYsVx4'
    UNION ALL SELECT 8, 'Exercícios de Java #04 - Curso de Java', 'H7Qpt8NRpDw'
    UNION ALL SELECT 9, 'Curso de Java #05 - Introdução ao Swing e JavaFX', 'cYMruFKwqf0'
    UNION ALL SELECT 10, 'Exercícios de Java #05 - Curso de Java', 'UaTZTP50i08'
    UNION ALL SELECT 11, 'Curso de Java #06 - Tipos Primitivos e Manipulação de Dados', 'JEAQeT7YGs4'
    UNION ALL SELECT 12, 'Exercícios de Java #06 - Curso de Java', '7XPR-v1Fzjw'
    UNION ALL SELECT 13, 'Curso de Java #07 - Operadores Aritméticos e Classe Math', 'W9V5wtOOZHs'
    UNION ALL SELECT 14, 'Exercícios de Java #07 - Curso de Java', 'dEuQBmHXRnY'
    UNION ALL SELECT 15, 'Curso de Java #08 - Operadores Lógicos e Relacionais', 'xHgnlic7fj8'
    UNION ALL SELECT 16, 'Exercícios de Java #08 - Curso de Java', 'LNECh9RplE0'
    UNION ALL SELECT 17, 'Curso de Java #09 - Estruturas Condicionais (Parte 1)', 'wW3eve4vTMc'
    UNION ALL SELECT 18, 'Exercícios de Java #09 - Curso de Java', 'mGgd1f66kWE'
    UNION ALL SELECT 19, 'Curso de Java #10 - Estruturas Condicionais (Parte 2)', 'oNSrBld06qs'
    UNION ALL SELECT 20, 'Exercícios de Java #10 - Curso de Java', 'd-2E7c2Kfcc'
    UNION ALL SELECT 21, 'Curso de Java #11 - Estruturas de Repetição (Parte 1)', '2fawKjR8d4c'
    UNION ALL SELECT 22, 'Exercícios de Java #11 - Curso de Java', 'vdAArHfOS9k'
    UNION ALL SELECT 23, 'Curso de Java #12 - Estruturas de Repetição (Parte 2)', 'ojLALwmvQIU'
    UNION ALL SELECT 24, 'Exercício de Java #12', 'sUSnoHiTZ8E'
    UNION ALL SELECT 25, 'Curso de Java #13 - Estruturas de Repetição (Parte 3)', 'XLqPZh6n8IA'
    UNION ALL SELECT 26, 'Exercícios de Java #13 - Curso de Java', 'ZYvGz1h_2MU'
    UNION ALL SELECT 27, 'Curso de Java #14 - Vetores', 'KAS94-Lcboc'
    UNION ALL SELECT 28, 'Exercícios de Java #14 - Curso de Java', '6YxJOIxJyKo'
    UNION ALL SELECT 29, 'Curso de Java #15 - Métodos', 'EuxmbXZCFVQ'
    UNION ALL SELECT 30, 'Exercícios de Java #15 - Curso de Java', 'Fh5s0RUjhmQ'
) AS v
WHERE @curso_java_id IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM aulas a
      WHERE a.video_youtube_id = v.youtube_id
  );
  
  SELECT c.id, c.titulo, COUNT(a.id) AS total_aulas
FROM cursos c
LEFT JOIN aulas a ON a.curso_id = c.id
GROUP BY c.id, c.titulo;

SELECT c.id, c.titulo, c.categoria_id, cat.nome AS categoria
FROM cursos c
JOIN categorias cat ON cat.id = c.categoria_id;

SELECT curso_id, MIN(ordem) AS primeira, MAX(ordem) AS ultima, COUNT(*) AS total
FROM aulas
GROUP BY curso_id;

SELECT id, nome FROM categorias;

UPDATE cursos
SET categoria_id = (SELECT id FROM categorias WHERE nome = 'Python')
WHERE id = 1;

SELECT c.id, c.titulo, cat.nome AS categoria
FROM cursos c
JOIN categorias cat ON cat.id = c.categoria_id;