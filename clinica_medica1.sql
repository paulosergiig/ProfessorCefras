CREATE DATABASE clinica_medica;

use clinica_medica;
		
CREATE TABLE MEDICO(
 CRM INT PRIMARY KEY,
 NOME VARCHAR(50) NOT NULL,
 EMAIL VARCHAR(20) NOT NULL,
 TELEFONE VARCHAR(20),
 DATA_NASC DATE,
 ESPECIALIZACAO VARCHAR(25) 
 CHECK (ESPECIALIZACAO IN ('CARDIOLOGISTA', 'NUTRICIONISTA'))
);

CREATE TABLE PACIENTE(
    ID int primary key,
    CPF int unique,
    Nome varchar(100),
    Endereco varchar (75),
    Telefone VARCHAR(20),
    Tipo_Exame varchar(25) 
    check (Tipo_Exame in ('laboratorial', 'clinico'))
);

CREATE TABLE CONSULTA (
    ID_MEDICO INT NOT NULL,
    ID_PACIENTE INT NOT NULL,
    FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(CRM),
    FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID), 
    DATA_CONSULT DATE NOT NULL,
    VALOR DOUBLE NOT NULL,
    TIPO_PAG VARCHAR(20) UNIQUE
);

CREATE TABLE EXAME (
    ID_MEDICO INT NOT NULL,
    ID_PACIENTE INT NOT NULL,
    FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(CRM),
    FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID), 
    DATA_EXAME DATE,
    HORARIO TIME,
    VALOR DOUBLE NOT NULL,
    TIPO_PAG VARCHAR(20) UNIQUE,
    TIPO_EXAME VARCHAR(50) UNIQUE
);

insert into PACIENTE (ID, CPF, Nome, Endereco, Telefone, Tipo_Exame) 
Values (123356, 12678999, 'Matheus', 'rua ali', 8394123654,'laboratorial'),
(944632, 126678999, 'Jão', 'avenida f', 8394123654,'laboratorial'),
(1445572, 55678999, 'pedro', 'avenida j', 8394123654,'clinico'),
(7571178, 1222999, 'luiz', 'rua da aldeia', 8394123654,'clinico');


insert into PACIENTE (ID, CPF, Nome, Endereco, Telefone, Tipo_Exame) 
Values (7533178, 1222299, 'luz', ' rua da alameda', 8394126754,'clinico');


insert into MEDICO (CRM, NOME, EMAIL, TELEFONE, DATA_NASC, ESPECIALIZACAO) 
Values (123456, 'Matheus', 'email1@gmail.com', 8394123654, '1996-12-25', 'Cardiologista'),
(945632, 'Jão', '2222@gmail.com', 8394123654,'1996-12-25', 'Cardiologista'),
(1447572, 'pedro', 'email333@gmail.com', 8394123654,'1996-12-25', 'Cardiologista'),
(7576578, 'luiz', 'email3321@gmail.com', 8394123654,'1996-12-25', 'Cardiologista');

DELETE FROM PACIENTE
where ID = 7571178;

update PACIENTE
set TELEFONE = 111111111
WHERE ID = 7533178;




