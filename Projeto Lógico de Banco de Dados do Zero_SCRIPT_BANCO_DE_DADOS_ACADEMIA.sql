create database academia;
use academia;

-- criar tabela Aluno -- OK 
create table aluno(
		idAluno int auto_increment primary key,
        NomeAluno varchar(150) not null,
        IdadeAluno char(2) not null,
        EnderecoAluno varchar(100) not null,
        TelefoneAluno varchar(20) not null
);

insert into aluno (NomeAluno, IdadeAluno, EnderecoAluno, TelefoneAluno) 
	   values('Maria Silva','25','R.São Bento - 271', '51 99330-4040'),
		     ('Joao Perante','26','R.São Cristovom - 487', '51 99487-5264'),
             ('Pablo Duarte','22','R.São Valentin - 888', '51 99875-3526'),
             ('Juliana Peruca','35','R.Sto Anotnio - 658', '51 99456-4242'),
             ('Cristiane Flores','45','R.Sta Maria Bento - 741', '51 99552-3352'),
             ('Afonso Lira','32','R.São Joaquim - 698', '51 99111-3232'),
             ('Mauricio Rosa','25','R.Santa Cruz - 712', '51 99898-8898'),
             ('Elvio Monteiro','34','R.São Borja - 985', '51 99414-1430'),
             ('Estefani Silva','35','R.Garibaldi - 635', '51 99723-2341'),
             ('Claudio Lima','27','R.Pelotas - 231', '51 99656-5642');
             

-- criar tabela Aula - OK 
create table aula(
		idAula int (10) not null,
        Musculacao ENUM('Sim','Nao') not null,
        CrossFit ENUM('Sim','Nao') not null,
        Jump ENUM('Sim','Nao') not null,
		GAP ENUM('Sim','Nao') not null,
        Spinning_Bike ENUM('Sim','Nao') not null
);

alter table aula drop foreign key fk_idfornecedor;
alter table aula drop foreign key fk_idaluno;
alter table aula drop foreign key fk_idprofessor;

insert into aula (idAula, Musculacao, CrossFit, Jump, GAP, Spinning_Bike) 
	   values(1, 'Sim', 'Nao', 'Sim', 'Nao', 'Sim'),
		     (2,'Sim', 'Nao', 'Nao', 'Sim', 'Nao'),
             (3,'Sim', 'Sim', 'Nao', 'Sim', 'Nao'),
             (4,'Sim', 'Nao', 'Sim', 'Nao', 'Nao'),
             (5,'Sim', 'Sim', 'Sim', 'Nao', 'Sim'),
             (6,'Sim', 'Sim', 'Nao', 'Nao', 'Nao'),
             (7,'Sim', 'Sim', 'Nao', 'Nao', 'Nao'),
             (8,'Sim', 'Nao', 'Nao', 'Sim', 'Nao'),
             (9,'Sim', 'Nao', 'Sim', 'Nao', 'Nao'),
             (10,'Sim', 'Sim', 'Nao', 'Nao', 'Sim');
             

-- criar tabela Professores -- OK
create table professores(
		idProf int auto_increment primary key,
        NomeProf varchar(150) not null,
        IdadeProf char(2) not null,
        EnderecoProf varchar(100) not null,
        TelefoneProf varchar(20) not null
);

insert into professores (NomeProf, IdadeProf, EnderecoProf, TelefoneProf) 
	   values('Afonso Lira','32','R.São Jorge - 774', '51 98488-4040'),
		     ('Bruno Ferreira','30','R.Caxambu - 524', '51 98225-2562'),
             ('Gabriel Silva','30','R.Treze de Maio - 489', '51 98889-2530'),
             ('Renan Dutra','28','R.Sto Agostim - 669', '51 99947-4777'),
             ('Joice Alvez','36','R.Sta Imaculada - 326', '51 98181-1818');


-- criar tabela Mensalidade/Plano -- OK
create table MensalidadePlano(
		idMensPlano int (10) not null,
        Mensal ENUM('$ 100'),
        Trimestral ENUM('$ 250'),
        Anual ENUM('$ 850'),
        constraint fk_Plano foreign key (idMensPlano) references aluno(idAluno)
);

insert into MensalidadePlano (Mensal, Trimestral, Anual) 
	   values('$ 100', null, null),
		     (null, '$ 250', null),
             ('$ 100', null, null),
             (null, '$ 250', null),
             ('$ 100', null, null),
             (null, '$ 250', null),
             (null, '$ 250', null),
             (null, '$ 250', null),
             (null, null, '$ 850'),
             (null, null, '$ 850');

        
-- criar tabela Equipamentos -- OK
create table equipamentos(
		idEquipamentos int (10) not null,
		Bicicletas varchar(45),
		QtdBicicletas int(5),
		Esteiras varchar(45),
		QtdEsteiras int(5),
		Alteres varchar(45),
		QtdAlteres int(5),
		LegPress varchar(45),
		QtdLegPress int(5),
		SacoAreia varchar(45),
		QtdSacoAreia int(5),
		Tatames varchar(45),
		QtdTatames int(5)
);

insert into equipamentos(idEquipamentos, Bicicletas, QtdBicicletas, Esteiras, QtdEsteiras, Alteres, QtdAlteres, LegPress, QtdLegPress, SacoAreia, QtdSacoAreia, Tatames, QtdTatames) 
	   values(1,'Monark Bikes','10', null, null, null, null, null, null, null, null, null, null),
		     (2,null, null,'Running','12', null, null, null, null, null, null, null, null),
             (3,null, null, null, null,'AlteresSansung','60', null, null, null, null, null, null),
             (4,null, null, null, null, null, null, 'LegLegPP','10', null, null, null, null),
             (5,null, null, null, null, null, null, null, null,'The Sand Bag','4', null, null),
             (6,null, null, null, null, null, null, null, null, null, null,'Tatamys','60');
   
   
-- criar tabela Fornecedores -- OK
create table Fornecedores(
		idForn int (10),
        NomeForn varchar (100) not null,
        TelefoneForn varchar(20) not null,
        TipoEquipamento ENUM('Bicicleta', 'Esteira', 'Alteres', 'LegPress', 'SacoAreia', 'Tatame') not null
);
insert into Fornecedores (idForn, NomeForn, TelefoneForn, TipoEquipamento) 
	   values(1,'Bikes Ltda','51 98787-4247','Bicicleta'),
		     (2,'Caminhando em casa SA','51 99340-4032','Esteira'),
             (3,'Ciclismo é Vida','51 99330-4545','Bicicleta'),
             (4,'Peso Pesado Ltda','51 99380-4040','Alteres'),
             (5,'Peso Pesado Ltda','51 99380-4040','LegPress'),
             (6,'Tudo para Boxe','51 98899-9918','SacoAreia'),
             (7,'Japa Home','51 99445-4515','Tatame');

           
Show tables;
Desc aluno;
Select * from aluno;
Select * from aula;
Select * from equipamentos;
Select * from Fornecedores;    
Select * from MensalidadePlano; 
Select * from professores; 

-- Listar alunos com mais de 30 anos em ordem de idade.
Select * from aluno
		where idadeAluno > '30'
        order by idadeAluno;
        
-- Quantos alunos fazem CrossFit? 
Select Count(CrossFit) from aula
		where CrossFit = 'Sim';
        
-- Quais são os Alunos que fazem Jump (nome e telefone) ? 
Select a.NomeAluno, a.TelefoneAluno, b.Jump 
	From aluno as a
		Inner Join aula as b
        on a.idAluno = b.idAula
        Where Jump ='Sim';
        
-- Quais são os alunos pagam plano mensal (nome e telefone) ?   
Select a.NomeAluno, a.TelefoneAluno, b.Mensal 
	From aluno as a
		Inner Join MensalidadePlano as b
        on a.idAluno = b.idMensPlano
        Where Mensal ='$ 100';
    
-- Quais são os alunos pagam plano trimestral (nome e telefone) ? 
Select a.NomeAluno, a.TelefoneAluno, b.Trimestral 
	From aluno as a
		Inner Join MensalidadePlano as b
        on a.idAluno = b.idMensPlano
        Where Trimestral ='$ 250';
        
-- Quais são os alunos pagam plano Anual (nome e telefone) ? 
Select a.NomeAluno, a.TelefoneAluno, b.Anual 
	From aluno as a
		Inner Join MensalidadePlano as b
        on a.idAluno = b.idMensPlano
        Where Anual ='$ 850';
        
-- Quais fornecedores entregam bicicletas?
Select *
	From Fornecedores 
        Where TipoEquipamento ='Bicicleta';
        
-- Listar todos os fornecedores por ordem de nome.
Select *
	From Fornecedores
	order by NomeForn;
    

       