/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  henning
 * Created: 26.04.2016
 */



Create Table if not exists Schwierigkeitsgrad
(
    ID_Schwierigkeitsgrad   integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Schwierigkeitsgrad      varchar(20)
);

insert into Schwierigkeitsgrad values(null, 'AFB1');
insert into Schwierigkeitsgrad values(null, 'AFB2');
insert into Schwierigkeitsgrad values(null, 'AFB3');

Create Table if not exists Zeitbedarf
(
    ID_Zeitbedarf           integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Zeitbedarf              integer
);

insert into Zeitbedarf values(null, 5);
insert into Zeitbedarf values(null, 10);
insert into Zeitbedarf values(null, 15);
insert into Zeitbedarf values(null, 20);
insert into Zeitbedarf values(null, 25);
insert into Zeitbedarf values(null, 30);
insert into Zeitbedarf values(null, 35);
insert into Zeitbedarf values(null, 40);
insert into Zeitbedarf values(null, 45);
insert into Zeitbedarf values(null, 50);
insert into Zeitbedarf values(null, 55);
insert into Zeitbedarf values(null, 60);
insert into Zeitbedarf values(null, 65);
insert into Zeitbedarf values(null, 70);
insert into Zeitbedarf values(null, 75);
insert into Zeitbedarf values(null, 80);
insert into Zeitbedarf values(null, 85);
insert into Zeitbedarf values(null, 90);

Create Table if not exists Schlagwort
(
    ID_Schlagwort           integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,             
    Schalgwort              varchar(100)
);

Create Table if not exists Aufgabe 
(
    ID_Aufgabe              integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Thema                   VARCHAR(100),
    Aufgabenstellung        CHARACTER LARGE OBJECT(1M),
    Aufgabloesung           CHARACTER LARGE OBJECT(1M),
    ID_Schwierigkeitsgrad      integer foreign key references Schwierigkeitsgrad(ID_Schwierigkeitsgrad),
    ID_Zeitbedarf              integer foreign key references Zeitbedarf(ID_Zeitbedarf)
);

Create Table if not exists Aufgabe_Zeitbedarf
(
    ID_Zeitbedarf           integer foreign key references Zeitbedarf(ID_Zeitbedarf),
    ID_Aufgabe              integer foreign key references Aufgabe (ID_Aufgabe)
);

Create Table if not exists Aufgabe_Schwierigkeitsgrad
(
    ID_Schwierigkeitsgrad   integer foreign key references Schwierigkeitsgrad(ID_Schwierigkeitsgrad),
    ID_Aufgabe              integer foreign key references Aufgabe(ID_Aufgabe)
);

Create Table if not exists Aufgabe_Schlagwort
(
    ID_Schlagwort           integer foreign key references Schlagwort(ID_Schlagwort),
    ID_Aufgabe              integer foreign key references Aufgabe(ID_Aufgabe)
);

Create Table if not exists Basiskonzept
(
    ID_Basiskonzept         integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Basiskonzept            varchar(200)
);

insert into Basiskonzept values(null, 'System');
insert into Basiskonzept values(null, 'Struktur und Funktion');
insert into Basiskonzept values(null, 'Entwicklung');

Create Table if not exists Stufe
(
    ID_Stufe                integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Stufe                   varchar(10)
);

insert into Stufe values(null, 6);
insert into Stufe values(null, 9.1);
insert into Stufe values(null, 9.2);

Create Table if not exists Konzeptkompetenz
(
    ID_Konzeptkompetenz     integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Abkuerzung              varchar(10),
    ID_Basiskonzept         integer foreign key References Basiskonzept(ID_Basiskonzept),
    ID_Stufe                integer foreign key References Stufe(ID_Stufe),
    Wortlaut                BLOB
);

Create Table if not exists Konzeptkompetenz_Basiskonzept
(
    ID_Basiskonzept         integer foreign key references Basiskonzept(ID_Basiskonzept),
    ID_Konzeptkompetenz     integer foreign key references Konzeptkompetenz(ID_Konzeptkompetenz)
);

Create Table if not exists Kompetenzbereich
(
    ID_Kompetenzbereich     integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Kompetenzbereich        Varchar(200)
);

insert into Kompetenzbereich values(null, 'Erkenntnisgewinnung');
insert into Kompetenzbereich values(null, 'Kommunikation');
insert into Kompetenzbereich values(null, 'Bewertung');

Create Table if not exists Prozesskompetenz
(
    ID_Prozesskompetenz     integer GENERATED BY DEFAULT AS IDENTITY (START WITH 1) primary key not null,
    Abkuerzung              varchar(10),
    ID_Kompetenzbereich     integer foreign key references Kompetenzbereich(ID_Kompetenzbereich),
    ID_Stufe                integer foreign key references Stufe(ID_Stufe),
    Wortlaut                BLOB
);

Create Table if not exists Prozesskompetenz_Schlagwort
(
    ID_Schlagwort           integer foreign key references Schlagwort(ID_Schlagwort),
    ID_Prozesskompetenz     integer foreign key references Prozesskompetenz(ID_Prozesskompetenz)
);

Create Table if not exists Konzeptkompetenz_Schlagwort
(
    ID_Schlagwort           integer foreign key references Schlagwort(ID_Schlagwort),
    ID_Konzeptkompetenz     integer foreign key references Konzeptkompetenz(ID_Konzeptkompetenz)
);