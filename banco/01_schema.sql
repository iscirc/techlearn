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

create table usuarios (
id bigint not null auto_increment primary key,
nome varchar (100) not null,
email varchar (100) not null unique,
senha_hash varchar (255) not null,
perfil varchar (20) not null default 'Aluno',
criado_em timestamp not null default current_timestamp,
check (perfil in ('Aluno', 'Admin'))
);

create table aulas (
id bigint not null auto_increment primary key,
curso_id bigint not null,
titulo varchar (150) not null,
video_youtube_id varchar (20) not null,
ordem int not null,
descricao text,
foreign key (curso_id) references cursos(id) on delete cascade
);

create table matriculas (
id bigint not null auto_increment primary key,
usuario_id bigint not null,
curso_id bigint not null,
matriculado_em timestamp not null default current_timestamp,
unique (usuario_id, curso_id),
foreign key (usuario_id) references usuarios(id) on delete cascade,
foreign key (curso_id) references cursos(id) on delete cascade
);

create table favoritos (
id bigint not null auto_increment primary key,
usuario_id bigint not null,
curso_id bigint not null,
criado_em timestamp not null default current_timestamp,
unique (usuario_id, curso_id),
foreign key (usuario_id) references usuarios(id) on delete cascade,
foreign key (curso_id) references cursos(id) on delete cascade
);

create table progresso_aulas (
id bigint not null auto_increment primary key,
usuario_id bigint not null,
aula_id bigint not null,
concluido_em timestamp null,
status varchar (20) not null default 'Pendente',
unique (usuario_id, aula_id),
foreign key (usuario_id) references usuarios(id) on delete cascade,
foreign key (aula_id) references aulas(id) on delete cascade,
check (status in ('Pendente', 'Concluida'))

);

select table_name, column_name, referenced_table_name
from information_schema.key_column_usage
where table_schema = 'techlearn' and referenced_table_name is not null;


