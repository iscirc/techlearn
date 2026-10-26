-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: techlearn
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `techlearn`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `techlearn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `techlearn`;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `curso_id` bigint NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `video_youtube_id` varchar(20) NOT NULL,
  `ordem` int NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
INSERT INTO `aulas` VALUES (1,1,'Curso Python #01 - Seja um Programador','S9uPNppGsGo',1,NULL),(2,1,'Curso Python #02 - Para que serve o Python?','Mp0vhMDI7fA',2,NULL),(3,1,'Curso Python #03 - Instalando o Python3 e o IDLE','VuKvR1J2LQE',3,NULL),(4,1,'Curso Python #04 - Primeiros comandos em Python3','31llNGKWDdo',4,NULL),(5,1,'Curso Python #05 - Instalando o PyCharm e o QPython3','ElRd0cbXIv4',5,NULL),(6,1,'Exercício Python #001 - Deixando tudo pronto','nIHq1MtJaKs',6,NULL),(7,1,'Exercício Python #002 - Respondendo ao Usuário','FNqdV5Zb_5Q',7,NULL),(8,1,'Curso Python #06 - Tipos Primitivos e Saída de Dados','hdDHg1p3YVc',8,NULL),(9,1,'Exercício Python #003 - Somando dois números','PB254Cfjlyk',9,NULL),(10,1,'Exercício Python #004 - Dissecando uma Variável','tHYxjJxtJko',10,NULL),(11,1,'Curso Python #07 - Operadores Aritméticos','Vw6gLypRKmY',11,NULL),(12,1,'Exercício Python #005 - Antecessor e Sucessor','664e0G_S9nU',12,NULL),(13,1,'Exercício Python #006 - Dobro, Triplo, Raiz Quadrada','mqcNw_dhl8I',13,NULL),(14,1,'Exercício Python #007 - Média Aritmética','_QfISzy0IKs',14,NULL),(15,1,'Exercício Python #008 - Conversor de Medidas','KjcdG05EAZc',15,NULL),(16,1,'Exercício Python #009 - Tabuada','qajq3SI0QQs',16,NULL),(17,1,'Exercício Python #010 - Conversor de Moedas','xM4AX3Lp2mo',17,NULL),(18,1,'Exercício Python #011 - Pintando Parede','mzSJpn9ldt4',18,NULL),(19,1,'Exercício Python #012 - Calculando Descontos','4MAmKOT9FeU',19,NULL),(20,1,'Exercício Python #013 - Reajuste Salarial','cTkivN8XcJ0',20,NULL),(21,1,'Exercício Python #014 - Conversor de Temperaturas','9l_Gay8BuAw',21,NULL),(22,1,'Exercício Python #015 - Aluguel de Carros','I4NYUeetLAc',22,NULL),(23,1,'Curso Python #08 - Utilizando Módulos','oOUyhGNib2Q',23,NULL),(24,1,'Exercício Python #016 - Quebrando um número','-iSbDpl5Jhw',24,NULL),(25,1,'Exercício Python #017 - Catetos e Hipotenusa','vmPW9iWsYkY',25,NULL),(26,1,'Exercício Python #018 - Seno, Cosseno e Tangente','9GvsphwW26k',26,NULL),(27,1,'Exercício Python #019 - Sorteando um item na lista','_Nk02-mfB5I',27,NULL),(28,1,'Exercício Python #020 - Sorteando uma ordem na lista','OPh0nngbBSY',28,NULL),(29,1,'Exercício Python #021 - Tocando um MP3','9FiEji_fzvk',29,NULL),(30,1,'Curso Python #09 - Manipulando Texto','a7DH88vk2Sk',30,NULL),(31,1,'Exercício Python #022 - Analisador de Textos','EQQt-6QqXOs',31,NULL),(32,1,'Exercício Python #023 - Separando dígitos de um número','wD2aerLMBWA',32,NULL),(33,1,'Exercício Python #024 - Verificando as primeiras letras de um texto','QroT8cZMRnc',33,NULL),(34,1,'Exercício Python #025 - Procurando uma string dentro de outra','WHWGz2Dy1ZU',34,NULL),(35,1,'Exercício Python #026 - Primeira e última ocorrência de uma string','23UOVEetNPY',35,NULL),(36,1,'Exercício Python #027 - Primeiro e último nome de uma pessoa','SifYYsXhLM8',36,NULL),(37,1,'Curso Python #10 - Condições (Parte 1)','K10u3XIf1-Q',37,NULL),(38,1,'Exercício Python #028 - Jogo da Adivinhação v.1.0','kchC5KLZSZ4',38,NULL),(39,1,'Exercício Python #029 - Radar eletrônico','hgJ_ETNGSj8',39,NULL),(40,1,'Exercício Python #030 - Par ou Ímpar?','4vFCzKuHOn4',40,NULL),(41,1,'Exercício Python #031 - Custo da Viagem','PGqHyzWoagc',41,NULL),(42,1,'Exercício Python #032 - Ano Bissexto','cyGY_83m4Xw',42,NULL),(43,1,'Exercício Python #033 - Maior e menor valores','a_8FbW5oH6I',43,NULL),(44,1,'Exercício Python #034 - Aumentos múltiplos','Sfadj_AzKHw',44,NULL),(45,1,'Exercício Python #035 - Analisando Triângulo v1.0','NZiNphKkxhg',45,NULL),(46,1,'Curso Python #11 - Cores no Terminal','0hBIhkcA8O8',46,NULL),(47,2,'Conceitos Iniciais','9JNqj8ARj_4',1,NULL),(48,2,'Conceitos Gerais','RfSXBz4oj4g',2,NULL),(49,2,'SGBD - Sistemas Gerenciadores de Banco de Dados','33l_2gaSnAs',3,NULL),(50,2,'Modelo Entidade Relacionamento','DjSwgkW_tWQ',4,NULL),(51,2,'Tipos de atributos do MER','NgVs6nR1haQ',5,NULL),(52,2,'Tipos de Relacionamentos do MER','wAjgPu0ZibA',6,NULL),(53,2,'MER Estendido (MER-EX)','i2v2M2u4xU0',7,NULL),(54,2,'Mapeamento do MER para o Modelo Relacional','aD7PjxxNJxE',8,NULL),(55,2,'Mapeamento do MER para o Modelo Relacional (parte 2)','VfS3Cfmjyrg',9,NULL),(56,2,'Normalização de relações','ikFjbstV98w',10,NULL),(57,2,'Normalização de relações (parte 2)','nf7RoBT1l1E',11,NULL),(58,2,'Correção da lista de exercícios 1','3rjKo2ej3jM',12,NULL),(59,2,'Correção da lista de exercícios 2','hcP8jfVUgGs',13,NULL),(60,2,'Correção da lista de exercícios 3','xzu0T_Vc-fM',14,NULL),(61,2,'Diagrams.net: Desenvolva diagramas online gratuitamente!','Y9LnhNs1GKo',15,NULL),(62,3,'Curso de Java #01 - História do Java','sTX0UEplF54',1,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(63,3,'Exercícios de Java #01 - Curso de Java para Iniciantes','ZBKxhnqX-Q0',2,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(64,3,'Curso de Java #02 - Como Funciona o Java','v_ZCtgwbS3o',3,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(65,3,'Exercícios de Java #02 - Curso de Java para Iniciantes','bIXDystGxj0',4,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(66,3,'Curso de Java #03 - Instalando o JDK no seu Computador','yWU5bm_pZzY',5,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(67,3,'Exercícios de Java #03 - Curso de Java para Iniciantes','gsp1H0-FVGI',6,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(68,3,'Curso de Java #04 - Primeiro Programa em Java','ijXXaIYsVx4',7,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(69,3,'Exercícios de Java #04 - Curso de Java','H7Qpt8NRpDw',8,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(70,3,'Curso de Java #05 - Introdução ao Swing e JavaFX','cYMruFKwqf0',9,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(71,3,'Exercícios de Java #05 - Curso de Java','UaTZTP50i08',10,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(72,3,'Curso de Java #06 - Tipos Primitivos e Manipulação de Dados','JEAQeT7YGs4',11,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(73,3,'Exercícios de Java #06 - Curso de Java','7XPR-v1Fzjw',12,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(74,3,'Curso de Java #07 - Operadores Aritméticos e Classe Math','W9V5wtOOZHs',13,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(75,3,'Exercícios de Java #07 - Curso de Java','dEuQBmHXRnY',14,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(76,3,'Curso de Java #08 - Operadores Lógicos e Relacionais','xHgnlic7fj8',15,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(77,3,'Exercícios de Java #08 - Curso de Java','LNECh9RplE0',16,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(78,3,'Curso de Java #09 - Estruturas Condicionais (Parte 1)','wW3eve4vTMc',17,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(79,3,'Exercícios de Java #09 - Curso de Java','mGgd1f66kWE',18,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(80,3,'Curso de Java #10 - Estruturas Condicionais (Parte 2)','oNSrBld06qs',19,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(81,3,'Exercícios de Java #10 - Curso de Java','d-2E7c2Kfcc',20,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(82,3,'Curso de Java #11 - Estruturas de Repetição (Parte 1)','2fawKjR8d4c',21,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(83,3,'Exercícios de Java #11 - Curso de Java','vdAArHfOS9k',22,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(84,3,'Curso de Java #12 - Estruturas de Repetição (Parte 2)','ojLALwmvQIU',23,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(85,3,'Exercício de Java #12','sUSnoHiTZ8E',24,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(86,3,'Curso de Java #13 - Estruturas de Repetição (Parte 3)','XLqPZh6n8IA',25,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(87,3,'Exercícios de Java #13 - Curso de Java','ZYvGz1h_2MU',26,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(88,3,'Curso de Java #14 - Vetores','KAS94-Lcboc',27,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(89,3,'Exercícios de Java #14 - Curso de Java','6YxJOIxJyKo',28,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(90,3,'Curso de Java #15 - Métodos','EuxmbXZCFVQ',29,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara'),(91,3,'Exercícios de Java #15 - Curso de Java','Fh5s0RUjhmQ',30,'Aula em vídeo do Curso em Vídeo - Gustavo Guanabara');
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Python','Curso completo de Python, do básico ao avançado'),(2,'Java','Curso completo de Java, do básico ao avançado'),(3,'Banco De Dados','Curso completo de Banco de Dados, do básico ao avançado'),(5,'Programação','Lógica e Linguagens de Programação');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria_id` bigint NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descricao` text,
  `nivel` varchar(20) NOT NULL DEFAULT 'Iniciante',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `cursos_chk_1` CHECK ((`nivel` in (_utf8mb4'Iniciante',_utf8mb4'Intermediario',_utf8mb4'Avançado')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,1,'Curso de Python 3 - Mundo 1: Fundamentos','Curso em vídeo-aulas de Python 3 do canal Curso em Vídeo, com aulas e exercícios práticos.','Iniciante',1,'2026-10-22 03:51:55'),(2,3,'Banco de Dados 1','Curso em vídeo-aulas do Prof. Tiago Segato: conceitos de banco de dados, modelo entidade-relacionamento, modelo relacional e normalização.','Iniciante',1,'2026-10-22 23:38:50'),(3,2,'Curso de Java para Iniciantes','Curso de Java do básico ao avançado, com aulas teóricas e exercícios práticos.','Iniciante',1,'2026-10-23 01:25:59');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `curso_id` bigint NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`,`curso_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `curso_id` bigint NOT NULL,
  `matriculado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`,`curso_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progresso_aulas`
--

DROP TABLE IF EXISTS `progresso_aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progresso_aulas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `aula_id` bigint NOT NULL,
  `concluido_em` timestamp NULL DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pendente',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`,`aula_id`),
  KEY `aula_id` (`aula_id`),
  CONSTRAINT `progresso_aulas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `progresso_aulas_ibfk_2` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `progresso_aulas_chk_1` CHECK ((`status` in (_utf8mb4'Pendente',_utf8mb4'Concluida')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progresso_aulas`
--

LOCK TABLES `progresso_aulas` WRITE;
/*!40000 ALTER TABLE `progresso_aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `progresso_aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `perfil` varchar(20) NOT NULL DEFAULT 'Aluno',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `usuarios_chk_1` CHECK ((`perfil` in (_utf8mb4'Aluno',_utf8mb4'Admin')))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Maria Teste','maria@teste.com','hash_de_teste','Aluno','2026-10-15 03:13:48'),(4,'Priscila','iscirc.deassis@gmail.com','$2a$10$qnfxut8dp.YUoT5bXRG/LOnlIjXC0rO2yBuAofGLOEZZQi72WRI3S','Aluno','2026-10-24 21:48:58'),(5,'Usuario Teste','teste_ia@techlearn.com','$2a$10$1LxWKQ2fS8t2jZIDHF1e3eqtlQSfFwiVuFy4yhipt6eFonsOQA7W6','Aluno','2026-10-26 02:13:45');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-26 12:17:38
