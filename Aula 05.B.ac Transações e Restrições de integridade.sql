/*
Questão 01. Crie um SCHEMA chamado avaliacaocontinua no seu banco de dados para armazenar os objetos criados nas próximas questões.
Após a execução de todas as instruções, os objetos serão organizados de acordo com a figura.
 */
CREATE SCHEMA avaliacaocontinua;

/* 
Questão 02. Crie a tabela "company" com os atributos company_name e city. 
Utilize a restrição "not null" para o atributo "company_name". 
O atributo "company_name" deverá ser uma chave primária. 
*/
create table avaliacaocontinua.company (company_name char(15) not null, city char(30), primary key (company_name));

/*
Questão 03. Crie a tabela "employee" com os atributos person_name, street e city. 
Utilize a restrição "not null" para o atributo "person_name". 
O atributo "person_name" deverá ser uma chave primária.
*/
create table avaliacaocontinua.employee (person_name char(20) not null, street char(30), city char(30), primary key (person_name));

/*
Questão 04. Crie a tabela "manages" com os atributos person_name e manager_name. 
Utilize a restrição "not null" para o atributo "person_name". 
O atributo "person_name" deverá ser uma chave primária.
 */
create table avaliacaocontinua.manages (person_name char(20) not null, manager_name char(20), primary key (person_name));

/*
Questão 05. Crie a tabela "works" com os atributos person_name, company_name e salary. 
Utilize a restrição "not null" para o atributo "person_name" e "company_name". 
O atributo "person_name" deverá ser uma chave primária.
*/
create table avaliacaocontinua.works (person_name char(20) not null, company_name char(15) not null, salary integer, primary key (person_name));

/*
Questão 06. Crie a integridade referencial entre a relação "works" e a relação "employee". 
O atributo "person_name" da relação "works" deverá existir na relação "employee". 
Utilize as ações em cascata: "update" e "delete".
 */
ALTER TABLE avaliacaocontinua.works ADD CONSTRAINT fk_person_name 
FOREIGN KEY ( person_name ) REFERENCES avaliacaocontinua.employee ( person_name) 
ON DELETE CASCADE
ON UPDATE CASCADE;

/*
Questão 07. Crie a integridade referencial entre a relação "works" e a relação "company". 
O atributo "company_name" da relação "works" deverá existir na relação "company". 
Utilize as ações em cascata: "update" e "delete". 
 */
ALTER TABLE avaliacaocontinua.works ADD CONSTRAINT fk_company_name 
FOREIGN KEY ( company_name ) REFERENCES avaliacaocontinua.company ( company_name ) 
ON DELETE CASCADE
ON UPDATE CASCADE;

/*
Questão 08. Crie a integridade referencial entre a relação "manages" e a relação "employee". 
O atributo "person_name" da relação "manages" deverá existir na relação "employee". 
Utilize as ações em cascata: "update" e "delete".
*/
ALTER TABLE avaliacaocontinua.manages ADD CONSTRAINT fk_manages_person_name 
FOREIGN KEY ( person_name ) REFERENCES avaliacaocontinua.employee ( person_name) 
ON DELETE CASCADE
ON UPDATE CASCADE;






