#Base de Dados para realizar reservas em um Hotel


#Primeiro vamos criar uma central de dados
create database hotel;
#Após, vamos usar esse banco e criar as nossas tabelas
use hotel;
#Criando a tabela cliente.
create table cliente(
		id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT, #Aqui declaramos que o id_cliente é uma chave primaria, automaticamente preenchido e não pode ser nulo
        nome varchar (255) not null, 
        sobrenome varchar(255) not null,
        tipo_documento enum("cpf","rg","passaporte") not null, #Declarei como "ENUM", para que a coluna tipo_de_documento, só aceite aqueles documentos 
        endereco varchar (255) not null,
        data_registro datetime default now() #Registro auto preenchido.
        );
#Criação da tabela reservas.
create table reservas(
		id_reserva INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        data_entrada DateTime default now(),
        data_saida DateTime,
        data_registro DateTime default now(),
        observacao text,
        id_cliente int,
        foreign key(id_cliente) references cliente(id_cliente)#Aqui indicamos que as tabelas fazem referencia pelo id.
	#Essas tabelas que fazem referencia pelo id, será de grande necessidade no final de nosso código.
        );

#Agora, vamos excluir a coluna observacao e adicionar a coluna comentario_cliente do tipo texto.
ALTER TABLE reservas DROP COLUMN observacao;
select * from reservas;#Conferindo que foi deletado.
ALTER TABLE reservas ADD COLUMN comentario_cliente varchar(255);


#---------------------------------------------------------------------------------
#Vamos fazer as atribuições  das colunas dentro das tabelas cliente e reservas utilizando o insert into.

insert into cliente(nome,sobrenome,tipo_documento,endereco,data_registro)
values ("Caio","Ramos de Lima","RG","Guilherme Ceolin",default);
        
insert into cliente(nome,sobrenome,tipo_documento,endereco,data_registro)
values ("Djhonatan","Ramos de Lima","cpf","Uberaba",default);
        
insert into cliente(nome,sobrenome,tipo_documento,endereco,data_registro)
values ("Arthur","Ramos Lima","passaporte","Joao Kleber",default);

select * from cliente;#Conferindo tabela.
        
#-------------------------------------------------------------------------------
#Atribuições da tabela reservas.

 insert into reservas(data_entrada,data_saida,data_registro,comentario_cliente)
 values (default,"2023-04-22 18:30:30",default,"Muito bom");

 insert into reservas(data_entrada,data_saida,data_registro,comentario_cliente)
 values (default,"2023-04-22 19:45:10",default,"Perfeitamente perfeito");
 
  insert into reservas(data_entrada,data_saida,data_registro,comentario_cliente)
 values (default,"2023-04-22 21:20:10",default,"Maravilhosamente maravilhoso");
 
insert into reservas(data_entrada,data_saida,data_registro,comentario_cliente)
values (default,"2023-04-22 23:20:10",default,"Maravilhoso");

insert into reservas(data_entrada,data_saida,data_registro,comentario_cliente)
values (default,"2023-04-22 20:20:30",default,"Surpresamento surpreso");
 
insert into reservas(data_entrada,data_saida,data_registro,comentario_cliente)
values (default,"2023-04-22 18:30:30",default,"Extremamente extremo");


 
 select * from reservas; #Conferindo tabela
 
 #Agora, vamos mudar o nome dos clientes pelo seu "id_cliente",
      update 
      cliente
     set
     nome = "Pedro",
     sobrenome = "Henrique",
     tipo_documento = "RG",
     endereco = "Olavio Bilack",
     data_registro = default
     #declaramos where para realizar uma condição
     where id_cliente = "1"; 
     
     update 
      cliente
     set
     nome = "Thomas",
     sobrenome = "Henrique",
     tipo_documento = "RG",
     endereco = "Sampaio Bilack",
     data_registro = default
     where id_cliente = "2";
     
     update 
      cliente
     set
     nome = "Augusto ",
     sobrenome = "Morais",
     tipo_documento = "CPF",
     endereco = "Olavio Black",
     data_registro = default
     where id_cliente = "3";
     
select * from cliente;#Conferindo tabela cliente

#Vou realizar uma Subquery  para que eu possa realizar uma consultada filtrada com informações especificas
select a.id_reserva,
	(select nome 
	from cliente as b
	where b.id_cliente = a.id_reserva) nm_cliente#subconsulta
from reservas as a;




