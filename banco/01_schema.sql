create table categorias (
id bigint not null auto_increment primary key,
nome varchar(100) not null unique,
descricao text
 );
 
 insert into categorias (nome, descricao)
 values ('Python', 'Curso completo de Python, do básico ao avançado'),
 ('Java', 'Curso completo de Java, do básico ao avançado'),
 ('Banco De Dados', 'Curso completo de Banco de Dados, do básico ao avançado'
 );
 
 CREATE TABLE cursos (
    id bigint not null auto_increment primary key,
    categoria_id bigint not null,
    titulo varchar(200) not null,
    descricao text,
    nivel varchar(20) not null default 'Iniciante',
    ativo boolean not null default true,
    criado_em timestamp not null default current_timestamp,
    check (nivel in ('Iniciante', 'Intermediario', 'Avançado')),
    foreign key (categoria_id) REFERENCES categorias(id)
    
);