/* Entrée, plat de resistance, dessert, snack */
create table typePlat(
    id SERIAL NOT NULL PRIMARY KEY,
    type varchar not null
);

insert into typePlat values (default,'Entrée');
insert into typePlat values (default,'Plat de resistance');
insert into typePlat values (default,'Dessert');
insert into typePlat values (default,'Boisson');

create table plat (
    id SERIAL NOT NULL PRIMARY KEY,
    designation varchar not null,
    idType int,
    prix double precision,
    foreign key (idType) references typePlat(id)
);

insert into plat values (default,'Salade mixte',1,6000);
insert into plat values (default,'Assiette de fruits de mer pané',1,10000);
insert into plat values (default,'Gratin de fruits de mer',1,17000);
insert into plat values (default,'Salade princesse',1,20000);
insert into plat values (default,'Salade de calmar grillé',1,17000);

insert into plat values (default,'Soupe au poulet',2,12000);
insert into plat values (default,'Tsock du chef',2,12000);
insert into plat values (default,'Mine sao crevettes',2,13000);
insert into plat values (default,'Bol renversé poulet',2,11000);
insert into plat values (default,'Riz cantonnais',2,18000);

insert into plat values (default,'Porc au caramel avec riz',2,15000);
insert into plat values (default,'Cuisse de poulet au coco',2,14000);
insert into plat values (default,'Crevette à la sauce huître avec riz',2,17000);
insert into plat values (default,'Filet de poisson pané sauce aigre doux',2,15000);
insert into plat values (default,'Calmar sauté aux légumes avec riz',2,16000);

insert into plat values (default,'Akoho gasy ritra',2,13000);
insert into plat values (default,'Gana gasy ritra',2,15000);
insert into plat values (default,'Tilapia sy voanjobory',2,13000);
insert into plat values (default,'Hena omby ritra',2,13000);

insert into plat values (default,'Manara molotra',2,23000);

insert into plat values (default,'Coupe oreo',3,10000);
insert into plat values (default,'Coupe Banana split',3,11000);
insert into plat values (default,'Mille feuilles',3,7000);
insert into plat values (default,'Moka vanille',3,6000);
insert into plat values (default,'Tarte fraise',3,5000);
insert into plat values (default,'Maison blanche',3,6500);
insert into plat values (default,'Praline',3,6000);

insert into plat values (default,'Star PM',4,3000);
insert into plat values (default,'Star GM',4,7000);
insert into plat values (default,'THB',4,9000);
insert into plat values (default,'Jus naturel',4,10000);
insert into plat values (default,'Vin',4,25000);


create table latabatra(
    id SERIAL NOT NULL PRIMARY KEY
);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);
insert into latabatra values (default);

create table serveur (
    id SERIAL NOT NULL PRIMARY KEY,
    nomServeur varchar not null
);

insert into serveur values (default,'Diary');
insert into serveur values (default,'Matthieu');
insert into serveur values (default,'Saotra');
insert into serveur values (default,'Michael');
insert into serveur values (default,'Rindra');


create table commande (
    id SERIAL NOT NULL PRIMARY KEY,
    idTable int,
    idServeur int,
    etat int,
    date default CURRENT_DATE not null,
    foreign key (idTable) references latabatra(id),
    foreign key (idServeur) references serveur(id)
);

insert into commande values (default,1,1,0,CURRENT_DATE);
insert into commande values (default,2,2,0,CURRENT_DATE);
insert into commande values (default,3,3,0,CURRENT_DATE);

create table commande_details (
    id SERIAL NOT NULL PRIMARY KEY,
    idCommande int,
    idPlat int,
    etat int, /* validé ou pas */
    foreign key (idPlat) references plat(id),
    foreign key (idCommande) references commande(id)
);

insert into commande_details values (default,1,1,0);
insert into commande_details values (default,1,6,0);
insert into commande_details values (default,1,20,0);

insert into commande_details values (default,2,2,0);
insert into commande_details values (default,2,7,0);
insert into commande_details values (default,2,21,0);

insert into commande_details values (default,3,3,0);
insert into commande_details values (default,3,8,0);
insert into commande_details values (default,3,22,0);

create table ingredient (
    id SERIAL NOT NULL PRIMARY KEY,
    designation varchar,
    prix double precision
);

insert into ingredient values (default,'Riz',100);/* 1 */
insert into ingredient values (default,'Pâtes',100);/* 2 */
insert into ingredient values (default,'Crevettes',200);/* 3 */
insert into ingredient values (default,'Huître',200);/* 4 */
insert into ingredient values (default,'Poulet',150);/* 5 */
insert into ingredient values (default,'Tomate',50);/* 6 */
insert into ingredient values (default,'Porc',150);/* 7 */
insert into ingredient values (default,'Sauce',50);/* 8 */
insert into ingredient values (default,'Salade',25);/* 9 */
insert into ingredient values (default,'Voanjobory',30);/* 10 */
insert into ingredient values (default,'Hena omby',40);/* 11 */
insert into ingredient values (default,'Legumes',40);/* 12 */
insert into ingredient values (default,'Fromage',20);/* 13 */
insert into ingredient values (default,'Calmar',20);/* 14 */
insert into ingredient values (default,'Coco',20);/* 15 */
insert into ingredient values (default,'Poisson',20);/* 16 */
insert into ingredient values (default,'Gana',20);/* 17 */



create table IngredientPlat (
    id SERIAL NOT NULL PRIMARY KEY,
    idPlat int,
    idIngredient int,
    masse double precision,
    foreign key (idPlat) references plat(id),
    foreign key (idIngredient) references ingredient(id)
);

insert into IngredientPlat values (default,1,9,300);
insert into IngredientPlat values (default,1,3,200);
insert into IngredientPlat values (default,1,6,100);

insert into IngredientPlat values (default,2,3,300);
insert into IngredientPlat values (default,2,4,200);
insert into IngredientPlat values (default,2,6,100);
insert into IngredientPlat values (default,2,9,300);

insert into IngredientPlat values (default,3,2,300);
insert into IngredientPlat values (default,3,5,200);
insert into IngredientPlat values (default,3,3,100);

insert into IngredientPlat values (default,4,9,300);
insert into IngredientPlat values (default,4,6,200);
insert into IngredientPlat values (default,4,12,100);

insert into IngredientPlat values (default,5,9,300);
insert into IngredientPlat values (default,5,14,200);
insert into IngredientPlat values (default,5,6,100);

insert into IngredientPlat values (default,6,2,300);
insert into IngredientPlat values (default,6,5,200);
insert into IngredientPlat values (default,6,12,100);

insert into IngredientPlat values (default,7,1,300);
insert into IngredientPlat values (default,7,6,200);
insert into IngredientPlat values (default,7,3,100);

insert into IngredientPlat values (default,8,2,300);
insert into IngredientPlat values (default,8,3,200);
insert into IngredientPlat values (default,8,6,100);

insert into IngredientPlat values (default,9,1,300);
insert into IngredientPlat values (default,9,5,200);
insert into IngredientPlat values (default,9,12,100);

insert into IngredientPlat values (default,10,1,300);
insert into IngredientPlat values (default,10,7,200);
insert into IngredientPlat values (default,10,12,100);

insert into IngredientPlat values (default,11,1,300);
insert into IngredientPlat values (default,11,7,200);
insert into IngredientPlat values (default,11,12,100);
insert into IngredientPlat values (default,11,8,400);

insert into IngredientPlat values (default,12,1,300);
insert into IngredientPlat values (default,12,5,200);
insert into IngredientPlat values (default,12,12,100);
insert into IngredientPlat values (default,12,15,400);


insert into IngredientPlat values (default,13,1,300);
insert into IngredientPlat values (default,13,3,200);
insert into IngredientPlat values (default,13,8,100);

insert into IngredientPlat values (default,14,16,300);
insert into IngredientPlat values (default,14,1,400);
insert into IngredientPlat values (default,14,8,100);

insert into IngredientPlat values (default,15,14,300);
insert into IngredientPlat values (default,15,1,200);
insert into IngredientPlat values (default,15,12,100);

insert into IngredientPlat values (default,16,1,300);
insert into IngredientPlat values (default,16,5,200);
insert into IngredientPlat values (default,16,6,100);

insert into IngredientPlat values (default,17,17,300);
insert into IngredientPlat values (default,17,1,200);
insert into IngredientPlat values (default,17,6,100);

insert into IngredientPlat values (default,18,1,300);
insert into IngredientPlat values (default,18,16,200);
insert into IngredientPlat values (default,18,10,100);

insert into IngredientPlat values (default,19,1,300);
insert into IngredientPlat values (default,19,11,200);
insert into IngredientPlat values (default,19,6,100);

create table pourboire (
    id SERIAL PRIMARY KEY,
    idCommande int,
    foreign key (idCommande) references commande(id)
);

create table inventaire (
    id SERIAL PRIMARY KEY,
    idIngredient int,
    entree int,
    sortie int,
    date date,
    foreign key (idIngredient) references ingredient(id)
);

insert into inventaire values (default,1,100,0,CURRENT_DATE);
insert into inventaire values (default,2,100,0,CURRENT_DATE);
insert into inventaire values (default,3,100,0,CURRENT_DATE);
insert into inventaire values (default,4,100,0,CURRENT_DATE);
insert into inventaire values (default,5,100,0,CURRENT_DATE);
insert into inventaire values (default,6,100,0,CURRENT_DATE);
insert into inventaire values (default,7,100,0,CURRENT_DATE);
insert into inventaire values (default,8,100,0,CURRENT_DATE);
insert into inventaire values (default,9,100,0,CURRENT_DATE);
insert into inventaire values (default,10,100,0,CURRENT_DATE);
insert into inventaire values (default,11,100,0,CURRENT_DATE);
insert into inventaire values (default,12,100,0,CURRENT_DATE);
insert into inventaire values (default,13,100,0,CURRENT_DATE);
insert into inventaire values (default,14,100,0,CURRENT_DATE);
insert into inventaire values (default,15,100,0,CURRENT_DATE);
insert into inventaire values (default,16,100,0,CURRENT_DATE);
insert into inventaire values (default,17,100,0,CURRENT_DATE);

create table typePayement (
    id serial primary key,
    designation varchar not null
);

insert into typePayement values (default,'Cheque');
insert into typePayement values (default,'Espèces');

create table payement(
    id serial primary key,
    idType int,
    idCommande int,
    sommePayee double precision,
    datePayement date,
    paye integer, /* payé ou non*/
    foreign key (idType) references typePayement(id),
    foreign key (idCommande) references commande(id)
);

create view prixIngredient as 
select ingredient.designation,prix*ingredientplat.masse as prix,idPlat from ingredient join ingredientplat on ingredient.id = ingredientplat.idingredient 

/* Prix de revient */
create view prixDeRevient as 
select idplat,sum(prix) as prixDeRevient from prixIngredient group by idPlat

/* Bénéfice par plat */
select id,(prix-prixDeRevient) as benefice from plat join prixDeRevient on plat.id = prixDeRevient.idPlat

/* prix total de chaque commande */
create view prixCommande as 
select idcommande,sum(plat.prix) from plat join commande_details on plat.id = commande_details.idplat group by idcommande