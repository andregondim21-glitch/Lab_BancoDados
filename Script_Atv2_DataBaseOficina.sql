#Cria o Banco de dados
create database oficina;

#Referencia os proximos comandos para o banco de dados 'oficina'
use oficina;
 
#Cria a tabela 'fabriante'
create table fabricante(
	codigo bigint primary key,  /* inteiro grande */
	nome varchar(100) not null,  /*campo é obrigatório */
	telefone varchar(30),
	email varchar(100) not null unique, /* não pode ter valor repetido */
	responsavel varchar(100)
);
 
#Cria a tabela 'modelo'
create table modelo(
	codigoModelo bigint primary key,
	tipo varchar(100) not null,
	peso decimal(12,4) default(1),   
	codigofabricante bigint,
	horaTeste int default(100),
	foreign key(codigofabricante) references fabricante(codigo)
);

#Cria a tabela 'maquina'
create table maquina(
	registro varchar(100) primary key,
	ano char(4),
	horasUso int default(0),
	codigoModelo bigint,
	foreign key(codigoModelo) references modelo(codigoModelo)
);

#Cria a tabela 'oficina'
create table oficina(
	codigoOficina bigint primary key,
	cnpj char(14) not null unique,
	nome varchar(100),
	responsavel varchar(100),
	telefone varchar(20) not null unique,
	email varchar(100) not null unique
);

#Cria a tabela 'tecnico'
create table tecnico(
	codigoFuncional bigint primary key,
	endereco varchar(100),
	telefone varchar(20) not null unique,
	salario decimal(12,4) not null,	
	qualificacao varchar(100),
	codigoOficina bigint,
	foreign key(codigoOficina) references oficina(codigoOficina)
);

#Cria a tabela 'teste'
create table teste(
	codigoTeste bigint primary key,
	pontuacao decimal(12,4) not null,
	nome varchar(100),
	responsavel varchar(100),
	telefone varchar(20) not null unique,
	email varchar(100) not null unique,
	codigoFuncional bigint,
	codigoOficina bigint,
	foreign key(codigoFuncional) references tecnico(codigoFuncional),
	foreign key(codigoOficina) references oficina(codigoOficina)
);

#Cria a tabela 'TbModeloOficina' oriunda de relacionamento N para N
create table TbModeloOficina(
	codigoModelo bigint not null,
	codigoOficina bigint not null,
	PRIMARY KEY (codigoModelo, codigoOficina),
	foreign key(codigoModelo) references modelo(codigoModelo),
	foreign key(codigoOficina) references oficina(codigoOficina)
);

#Cria a tabela 'TbModeloTecnico' oriunda de relacionamento N para N
create table TbModeloTecnico(
	codigoModelo bigint not null,
	codigoFuncional bigint not null,
	PRIMARY KEY (codigoModelo, codigoFuncional),
	foreign key(codigoModelo) references modelo(codigoModelo),
	foreign key(codigoFuncional) references tecnico(codigoFuncional)
);
