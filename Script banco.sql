create table profissionais (
  id int not null,
  nome varchar(50) not null,
  sobrenome varchar(50) not null,
  horario_min_manha time,
  horario_max_manha time,
  HoraUnitaria time,
  horario_min_tarde time,
  horario_max_tarde time,
  constraint pk_profissionais primary key (id),
  constraint uk_nome unique (nome) using index ix_nome
)

create table Agenda (
  id int not null,
  idprofissional int not null,
  dia date NOT null,
  horario time,
  idcliente time,
  constraint pk_agenda primary key (id)
)

create table Cliente (
  id int not null,
  nome varchar(50) not null,
  sobrenome varchar(50) not null,
  datanascimento date NOT null,
  constraint pk_cliente primary key (id)
)

