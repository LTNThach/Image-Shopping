USE master 
GO
if DB_ID('ImageShopping') is not null 
drop database ImageShopping
CREATE DATABASE ImageShopping
GO
USE [ImageShopping]
GO	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE Utilisateur
(
	IDU int,
	NomUtilisateur varchar(20) unique,
	Nom varchar(10),
	Prenom varchar(40),
	Adresse varchar(100),
	NumeroTelephone varchar(15),
	Email varchar(40),
	MotdePasse varchar(30),
	EtatActiver int,
	NombreRapport int,
	PRIMARY KEY(IDU)
)

CREATE TABLE Photo
(
	IDP int,
	IDA int,
	PhotoType varchar(20),
	NomPhoto varchar(50),
	Contenu varchar(MAX),
	NombreVu int,
	NombreAchat int,
	Point int,
	NombreAimer int,
	Prix bigint,
	PRIMARY KEY(IDP)
)

CREATE TABLE Album
(
	IDA int,
	NomAlbum varchar(50),
	IDU int,
	PRIMARY KEY(IDA)
)

CREATE TABLE Rapport
(
	IDR int,
	Violence int,
	Pornographie int,
	IDP int,
	PRIMARY KEY(IDR)
)

CREATE TABLE Achat
(
	IDU int,
	IDP int,
	Etat int,
	PRIMARY KEY(IDU, IDP)
)

ALTER TABLE Achat
ADD CONSTRAINT FK_Achat_Utilisateur
FOREIGN KEY(IDU)
REFERENCES Utilisateur(IDU)

ALTER TABLE Achat
ADD CONSTRAINT FK_Achat_Photo
FOREIGN KEY(IDP)
REFERENCES Photo(IDP)

ALTER TABLE Rapport
ADD CONSTRAINT FK_Rapport_Photo
FOREIGN KEY(IDP)
REFERENCES Photo(IDP)

ALTER TABLE Album
ADD CONSTRAINT FK_Album_Utilisateur
FOREIGN KEY(IDU)
REFERENCES Utilisateur(IDU)

ALTER TABLE Photo
ADD CONSTRAINT FK_Photo_Album
FOREIGN KEY(IDA)
REFERENCES Album(IDA)

ALTER TABLE Utilisateur
ADD CONSTRAINT chk_EtatActiver CHECK (EtatActiver = 0 OR EtatActiver = 1)

ALTER TABLE Photo
ADD CONSTRAINT chk_PhotoType CHECK (PhotoType in ('Portrait', 'Paysage', 'Faune', 'Flora', 'Homme', 'Construction', 'Fantaisie', 'Vehicule', 'Autre'))

ALTER TABLE Photo
ADD CONSTRAINT chk_Prix CHECK (Prix >= 1000)

ALTER TABLE Achat
ADD CONSTRAINT chk_Etat CHECK (Etat = 0 OR Etat = 1)

ALTER TABLE Utilisateur
ADD NombreVendu int

ALTER TABLE Photo --van giu hinh trong database nhung chuyen ve 1 neu bi delete
ADD Supprime int

ALTER TABLE Photo
ADD CONSTRAINT chk_Supprime CHECK (Supprime = 0 OR Supprime = 1)

ALTER TABLE Photo
ADD Data varbinary(MAX)

CREATE TABLE Aimer
(
	IDU int,
	IDP int,
	PRIMARY KEY(IDU, IDP)
)

ALTER TABLE Aimer
ADD CONSTRAINT FK_Aimer_Utilisateur
FOREIGN KEY(IDU)
REFERENCES Utilisateur(IDU)

ALTER TABLE Aimer
ADD CONSTRAINT FK_Aimer_Photo
FOREIGN KEY(IDP)
REFERENCES Photo(IDP)

ALTER TABLE Rapport
DROP COLUMN Violence

ALTER TABLE Rapport
DROP COLUMN Pornographie

ALTER TABLE Rapport
ADD TypeErreur int

ALTER TABLE Rapport
ADD CONSTRAINT chk_TypeErreur CHECK (TypeErreur = 0 OR TypeErreur = 1) -- 0 neu la Violence,
																	   -- 1 neu la Pornographie

INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (1, 'khikhokhao', 'NGUYEN', 'Thi Tuong Vy', '35 Pham Dang GIang', '09981125321', 'nttv.2002@gmail.com', '12345', 1, 0, 0)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (2, 'hatu', 'ABC', 'XYZ', 'QWERTY', '0123456789', 'hatu@gmail.com', 'abcdef', 1, 0, 2)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (3, 'abc', 'qwert', 'Tasdfdsfsadf', '4 4qweqwsad', '785461234569', 'abc@gmail.com', '0000', 0, 0, 0)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (4, 'thach', 'LUU', 'Thai Ngoc Thach', '416/149 Nguyen Dinh Chieu', '0969554568', 'KyuzoKZ@gmail.com', '123', 1, 0, 1)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (5, 'shin', 'NGUYEN', 'Thai Hoang', '487 Nguyen Thi Minh Khai', '87542165329', 'shin@yahoo.com', '12345', 1, 0, 9)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (6, 'hoang', 'NGUYEN', 'Thai Hoang', '487 Nguyen Thi Minh Khai', '87542165329', 'shin@yahoo.com', '12345', 1, 0, 3)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (7, 'watthe', 'Mike', 'AAAA', '48 rue Rivoli', '2086132987', 'Mike@gmail.com', '12345', 1, 0, 1)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (8, 'isabelle', 'LOU', 'Isabelle', '894 Pasteur', '02012931331', 'isabelle.lou@gmail.com', '12345', 1, 0, 5)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (9, 'ribery', 'NGUYEN', 'Thi Ngoc Thach', '227 Nguyen Van Cu', '02302393384', 'thach.ngua@yahoo.com', '12345', 1, 0, 2)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (10, 'mummum', 'TON', 'Nu Thi Ngoc Thach', '8702 Nguyen Dinh Chieu', '022993020133', 'mummum@gmail.com', '12345', 1, 0, 20)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (11, 'pucku', 'MOHAMMED', 'Mummum', '2023 Washington', '3874202022', 'mohammed@yahoo.com', '12345', 1, 0, 1)
INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
VALUES (12, 'phineas', 'BI', 'Thi Ngoc Thach', '487 Nguyen Thi Minh Khai', '87542165329', 'tui_la_bi@yahoo.com', '12345', 1, 0, 1)

INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (1, 'Summer', 1)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (2, 'Winter', 2)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (3, 'Autumn', 4)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (4, 'Spring', 5)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (5, 'Car', 6)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (6, 'Movie', 7)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (7, 'Film', 8)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (8, 'Bike', 9)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (9, 'School', 10)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (10, 'Motor', 11)
INSERT INTO Album(IDA, NomAlbum, IDU)
VALUES (11, 'Animal', 12)

INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (1, 2, 'Paysage', 'Night Winter', 'So cold', 5, 2, 20, 0, 2000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\1.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (2, 9, 'Homme', 'Mong Uoc Ki Niem Xua', 'Ban be', 20, 10, 112, 3, 1000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\10.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (3, 4, 'Paysage', '2 con chim', 'Mua xuan co chim', 10, 9, 94, 1, 1000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\11.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (4, 5, 'Vehicule', 'Lamborghini', 'Xe dep', 3, 3, 38, 2, 2500, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\2.png', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (5, 6, 'Autre', 'Phim', 'Background Phim', 5, 1, 10, 0, 1000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\3.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (6, 7, 'Autre', 'Cuon phim', 'Cuon phim', 7, 5, 50, 0, 1500, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\4.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (7, 8, 'Vehicule', 'Xe dap oi!', 'Xe dap dau?', 6, 2, 20, 0, 5000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\5.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (8, 10, 'Vehicule', 'Moto', 'Qua bu', 6, 1, 10, 0, 10000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\7.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (9, 11, 'Faune', 'Kangaroo', 'Kangaroooooooooo', 6, 1, 10, 0, 3000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\8.jpg', SINGLE_BLOB) AS Data))
INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
VALUES (10, 9, 'Homme', 'Mua he yeu thuong', 'co nguoi', 15, 10, 120, 5, 1000, 0, (SELECT * FROM OPENROWSET(BULK N'D:\Downloads\Documents\ImageShopping\Photo\9.jpg', SINGLE_BLOB) AS Data))

INSERT INTO Achat(IDU, IDP, Etat)
VALUES (1, 1, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (4, 1, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (1, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (2, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (4, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (5, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (6, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (7, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (8, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (9, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (11, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (12, 2, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (1, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (2, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (4, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (6, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (7, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (8, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (9, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (10, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (11, 3, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (1, 4, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (2, 4, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (4, 4, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (11, 5, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (12, 6, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (11, 6, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (10, 6, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (9, 6, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (7, 6, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (4, 7, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (7, 7, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (1, 8, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (5, 9, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (1, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (2, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (4, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (5, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (6, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (7, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (8, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (9, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (11, 10, 1)
INSERT INTO Achat(IDU, IDP, Etat)
VALUES (12, 10, 1)

INSERT INTO Aimer(IDU, IDP)
VALUES(1, 2)
INSERT INTO Aimer(IDU, IDP)
VALUES(2, 2)
INSERT INTO Aimer(IDU, IDP)
VALUES(5, 2)
INSERT INTO Aimer(IDU, IDP)
VALUES(12, 3)
INSERT INTO Aimer(IDU, IDP)
VALUES(10, 4)
INSERT INTO Aimer(IDU, IDP)
VALUES(9, 4)
INSERT INTO Aimer(IDU, IDP)
VALUES(1, 10)
INSERT INTO Aimer(IDU, IDP)
VALUES(4, 10)
INSERT INTO Aimer(IDU, IDP)
VALUES(11, 10)
INSERT INTO Aimer(IDU, IDP)
VALUES(12, 10)
INSERT INTO Aimer(IDU, IDP)
VALUES(7, 10)

--1/ Kiem tra trung ten tai khoan
--Input: username
--Ouput: 	true neu trung bat ki ten nao
--		false neu ko trung
Create Procedure sp_CheckUsername
				@username varchar(20),
				@check int out
AS
	set @check = 1
	if ((SELECT U.NomUtilisateur
		FROM Utilisateur as U
		WHERE U.NomUtilisateur = @username) is NULL)
		set @check = 0
GO

--2/ Kiem tra username va password va trang thai
--Input: username, password
--Output:	1 neu dung username va password
--		0 neu ko dung username hoac pass
--		2 neu chua kich hoat hoac bi khoa
CREATE PROCEDURE sp_CheckUsernameAndPassword
				@username varchar(20),
				@password varchar(30),
				@check int out
AS 
	set @check = 0
	declare @status int
	set @status = (SELECT U.EtatActiver 
		FROM Utilisateur as U
		WHERE U.NomUtilisateur = @username
		AND U.MotdePasse = @password)
	if (@status is NULL)
		set @check = 0
	else if (@status = 1)
		set @check = 1
	else 
		set @check = 2
GO

--3/ Tim kiem anh theo tieu chi
--Input: Noi dung tim kiem, tieu chi
--Output: Cac dong cua bang Photo chua noi dung tim kiem thoa tieu chi
CREATE PROCEDURE sp_SearchCategories
				@IDuser int, -- khach hang chua dang nhap thi truyen IDuser = 0
				@categorie varchar(20)
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE P.PhotoType = @categorie AND U.IDU = A.IDU AND A.IDA = P.IDA
		AND P.Supprime = 0 
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE P.PhotoType = @categorie AND U.IDU = A.IDU AND A.IDA = P.IDA AND U.IDU = @IDuser
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A, Achat as Ac
		WHERE P.PhotoType = @categorie AND U.IDU = A.IDU AND A.IDA = P.IDA AND Ac.IDP = P.IDP
		AND Ac.IDU = @IDuser AND Ac.Etat = 1
GO

CREATE PROCEDURE sp_SearchContent
				@IDuser int, -- khach hang chua dang nhap thi truyen IDuser = 0
				@content varchar(MAX)
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE ((SELECT CHARINDEX(@content, P.Contenu)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA
		AND P.Supprime = 0 
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE ((SELECT CHARINDEX(@content, P.Contenu)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA AND U.IDU = @IDuser
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A, Achat as Ac
		WHERE ((SELECT CHARINDEX(@content, P.Contenu)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA AND Ac.IDP = P.IDP
		AND Ac.IDU = @IDuser AND Ac.Etat = 1
GO

CREATE PROCEDURE sp_SearchUsername
				@IDuser int, -- khach hang chua dang nhap thi truyen IDuser = 0
				@username varchar(20)
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE ((SELECT CHARINDEX(@username, U.NomUtilisateur)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA
		AND P.Supprime = 0 
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE ((SELECT CHARINDEX(@username, U.NomUtilisateur)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA AND U.IDU = @IDuser
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A, Achat as Ac
		WHERE ((SELECT CHARINDEX(@username, U.NomUtilisateur)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA AND Ac.IDP = P.IDP
		AND Ac.IDU = @IDuser AND Ac.Etat = 1
GO

CREATE PROCEDURE sp_SearchImageName
				@IDuser int, -- khach hang chua dang nhap thi truyen IDuser = 0
				@name varchar(50)
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE ((SELECT CHARINDEX(@name, P.NomPhoto)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA
		AND P.Supprime = 0 
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE ((SELECT CHARINDEX(@name, P.NomPhoto)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA AND U.IDU = @IDuser
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A, Achat as Ac
		WHERE ((SELECT CHARINDEX(@name, P.NomPhoto)) > 0) AND U.IDU = A.IDU AND A.IDA = P.IDA AND Ac.IDP = P.IDP
		AND Ac.IDU = @IDuser AND Ac.Etat = 1
GO

--4/ Tim anh nhieu nguoi mua nhat
--Input: ko co
--Output: anh nhieu nguoi mua nhat
CREATE PROCEDURE sp_SearchHotImage -- chi tinh nhung anh chua bi xoa
AS
	SELECT TOP 10 P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
	FROM Utilisateur as U, Album as A, Photo as P
	WHERE U.IDU = A.IDU AND A.IDA = P.IDA
	AND P.Supprime = 0 
	ORDER BY P.NombreAchat DESC
GO

--5/ Tim nguoi dung ban nhieu anh nhat
--Input: ko co
--Output: nguoi dung ban nhieu anh nhat
CREATE PROCEDURE sp_SearchHotUser
AS
	SELECT TOP 10 *
	FROM Utilisateur as U
	ORDER BY U.NombreVendu DESC
GO

--6/ Tim nhung anh da mua
--Input: Username (hoac IDU)
--Output: Anh da mua cua user do
CREATE PROCEDURE sp_SearchPhotoAchete
				@userID int
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U1.NomUtilisateur, U1.IDU, Al.NomAlbum
	FROM Achat as A, Photo as P, Utilisateur as U, Utilisateur as U1, Album as Al
	WHERE A.IDP = P.IDP AND A.IDU = @userID AND Al.IDU = U1.IDU
	AND Al.IDA = P.IDA AND A.Etat = 1
GO

--7/ Tim nhung anh chua mua con trong gio hang
--Input: Username (hoac IDU)
--Output: Anh chua mua cua user do
CREATE PROCEDURE sp_SearchPhoto
				@userID int
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U1.NomUtilisateur, U1.IDU, Al.NomAlbum
	FROM Achat as A, Photo as P, Utilisateur as U, Utilisateur as U1, Album as Al
	WHERE A.IDP = P.IDP AND A.IDU = @userID AND Al.IDU = U1.IDU
	AND Al.IDA = P.IDA AND A.Etat = 0 AND P.Supprime = 0
GO

--8/ Doi password
-- Input: IDU, pass
-- Output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_ChangePassword
				@userID int,
				@pass varchar(30),
				@check int out
AS
	set @check = 0
	UPDATE Utilisateur
	SET MotdePasse = @pass
	WHERE IDU = @userID AND EtatActiver = 0
	set @check = 1
GO

--9/ Doi trang thai cua user
-- Input: IDU, trang thai muon doi
-- Output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_ChangeStatusUser
				@userID int,
				@status int,
				@check int out
AS
	set @check = 0
	UPDATE Utilisateur
	SET EtatActiver = @status
	WHERE IDU = @userID
	set @check = 1
GO

--10/ Load danh sach album cua 1 user nao do
-- Input: IDU so huu album
-- Output: danh sach album
CREATE PROCEDURE sp_LoadListAlbum
				@userID int
AS
	SELECT *
	FROM Album as A
	WHERE A.IDU = @userID
GO

--11/ Xoa bao cao khi nhanh vien chap nhan/huy
-- Input: IDR, chap nhan hay huy
-- Output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_DeleteRapport
				@IDrapport int,
				@case int, -- 1 neu chap nhan, 0 neu huy
				@check int out
AS
	set @check = 0
	
	declare @value int
	declare @IDuser int
	declare @IDphoto int

	SELECT @IDuser = U.IDU, @value = U.NombreRapport, @IDphoto = P.IDP
	FROM Utilisateur as U, Album as A, Photo as P, Rapport as R
	WHERE R.IDR = @IDrapport AND P.IDP = R.IDP AND A.IDA = P.IDA AND U.IDU = A.IDU 
	
	if (@case = 1)
	BEGIN
		UPDATE Photo
		SET Supprime = 1
		WHERE IDP = @IDphoto
	END
	
	if (@case = 0)
	BEGIN
		UPDATE Utilisateur
		SET NombreRapport = @value - 1
		WHERE IDU = @IDuser
	END

	DELETE FROM Rapport
	WHERE IDR = @IDrapport
	
	set @check = 1
GO

--12/ Doi album trong bang photo
-- input: IDA cua album se duoc doi, IDP cua photo doi album
-- output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_ChangeAlbum -- co the dung ham UpdatePhotoInfo
				@IDalbum int,
				@IDphoto int,
				@check int out
AS
	set @check = 0
	UPDATE Photo
	SET IDA = @IDalbum
	WHERE IDP = @IDphoto
	set @check = 1
GO

-- 13/load bao cao cho nhan vien xu ly, co hinh anh
-- output: danh sach bao cao kem hinh
CREATE PROCEDURE sp_LoadReport
AS
	SELECT U.NomUtilisateur, P.NomPhoto, P.Data, R.IDR, R.TypeErreur, P.IDP
	FROM Utilisateur as U, Album as A, Photo as P, Rapport as R
	WHERE R.IDP = P.IDP AND P.IDA = A.IDA AND A.IDU = U.IDU
GO

--14/ Tim kiem user theo username (chuc nang cua nhan vien)
-- input: username 
-- output: toan bo thong tin user
CREATE PROCEDURE sp_SearchUser
				@username varchar(20)
AS
	SELECT *
	FROM Utilisateur as U
	WHERE U.NomUtilisateur = @username
GO

--15/ Lay thong tin user
-- input: IDuser
-- output: toan bo thong tin ca nhan cua user
CREATE PROCEDURE sp_GetUserInfo
				@IDuser int
AS
	SELECT *
	FROM Utilisateur as U
	WHERE U.IDU = @IDuser
GO

--16/ Load toan bo hinh trong 1 album
-- input: IDA, IDU cua nguoi dang xem hinh
-- output: danh sach hinh trong album
CREATE PROCEDURE sp_LoadImage
				@IDalbum int,
				@IDuser int -- neu nguoi dung chua dang nhap thi truyen IDuser = 0
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE P.IDA = @IDalbum AND U.IDU = A.IDU AND A.IDA = P.IDA
		AND P.Supprime = 0 
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A
		WHERE P.IDA = @IDalbum AND U.IDU = A.IDU AND A.IDA = P.IDA AND U.IDU = @IDuser
	UNION
		SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
		FROM Photo as P, Utilisateur as U, Album as A, Achat as Ac
		WHERE P.IDA = @IDalbum AND U.IDU = A.IDU AND A.IDA = P.IDA AND Ac.IDP = P.IDP
		AND Ac.IDU = @IDuser AND Ac.Etat = 1
GO

--17/ Luu thong tin user
-- Input: thong tin user
-- Output: IDUser neu thanh cong, -1 neu khong thanh cong
CREATE PROCEDURE sp_SaveUserInfo
				@username varchar(20),
				@ho varchar(10),
				@ten varchar(40),
				@address varchar(100),
				@telephone varchar(15),
				@mail varchar(40),
				@password varchar(30),
				@status int,
				@reportnumber int,
				@sellnumber int,
				@check int out
AS
	set @check = -1
	declare @IDuser int
	set @IDuser = (SELECT COUNT(*)
					FROM Utilisateur) + 1
	
	INSERT INTO Utilisateur(IDU, NomUtilisateur, Nom, Prenom, Adresse, NumeroTelephone, Email, MotdePasse, EtatActiver, NombreRapport, NombreVendu)
	VALUES (@IDuser, @username, @ho, @ten, @address, @telephone, @mail, @password, @status, @reportnumber, @sellnumber)
	set @check = @IDuser
GO

--18/ Them vao gio hang
-- input: IDU, IDP, trang thai: mua/chua mua
-- output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_AddToCart
					@IDuser int,
					@IDphoto int,
					@status int,
					@check int out
AS
	set @check = 0
	INSERT INTO Achat(IDU, IDP, Etat)
	VALUES (@IDuser, @IDphoto, @status)
	set @check = 1
GO

--19/ Xoa san pham trong gio hang
-- input: IDP, IDU
-- output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_DeleteProductCart
				@IDuser int,
				@IDphoto int,
				@check int out
AS
	set @check = 0
	DELETE FROM Achat
	WHERE IDU = @IDuser AND IDP = @IDphoto AND Etat = 0
	set @check = 1
GO

--20/ Chuyen trang thai sp trong gio hang 
-- input: IDU, IDP, etat // chi chuyen tu chua mua thanh mua
-- output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_ChangeStatusProductCart
				@IDuser int,
				@IDphoto int,
				@check int out
AS
	set @check = 0
	UPDATE Achat
	SET Etat = 1
	WHERE IDU = @IDuser AND IDP = @IDphoto

	declare @ban int
	declare @tacgia int

	SELECT @ban = U.NombreVendu, @tacgia = U.IDU
	FROM Utilisateur as U, Photo as P, Album as A, Achat as Ac
	WHERE Ac.IDP = P.IDP AND P.IDA = A.IDA AND A.IDU = U.IDU AND P.IDP = @IDphoto
	
	UPDATE Utilisateur
	SET NombreVendu = @ban + 1
	WHERE IDU = @tacgia

	declare @diem int
	set @diem = (SELECT P.Point
				FROM Photo as P
				WHERE P.IDP = @IDphoto)
	
	declare @soluongban int
	set @soluongban = (SELECT NombreAchat
						FROM Photo
						WHERE IDP = @IDphoto)
	
	UPDATE Photo
	SET Point = @diem + 10, NombreAchat = @soluongban + 1
	WHERE IDP = @IDphoto

	set @check = 1
GO

--21/ Cap nhat khi like, bao gom: cap nhat diem, so luong like va insert vao bang aimer
-- input: IDP, IDU
-- output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_UpdateLike
				@IDphoto int,
				@IDuser int,
				@check int out
AS
	set @check  = 0
	declare @diem int
	declare @like int

	SELECT @diem = P.Point, @like = P.NombreAimer
	FROM Photo as P
	WHERE P.IDP = @IDphoto

	UPDATE Photo
	SET Point = @diem + 4
	WHERE IDP = @IDphoto
	
	UPDATE Photo
	SET NombreAimer = @like + 1
	WHERE IDP = @IDphoto
	
	INSERT INTO Aimer(IDU, IDP)
	VALUES (@IDuser, @IDphoto)

	set @check = 1
GO

--22/ insert anh vao db, album co san
--input: ten hinh, IDA, the loai, noi dung, gia, data
--output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_InsertPhoto_1
				@IDalbum int,
				@name varchar(50),
				@theloai varchar(20),
				@noidung varchar(MAX),
				@gia bigint,
				@dulieu varbinary(MAX),
				@check int out
AS
	set @check = 0
	declare @IDphoto int
	set @IDphoto = (SELECT COUNT(*)
					FROM Photo) + 1

	INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
	VALUES(@IDphoto, @IDalbum, @theloai, @name, @noidung, 0, 0, 0, 0, @gia, 0, @dulieu)

	set @check = 1
GO

--23/ Insert anh vao db, insert album moi
--input: ten hinh, the loai, noi dung, gia, data, ten album, IDU
--output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_InsertPhoto_2
				@tenalbum varchar(50),
				@IDuser int,
				@name varchar(50),
				@theloai varchar(20),
				@noidung varchar(MAX),
				@gia bigint,
				@dulieu varbinary(MAX),
				@check int out
AS
	set @check = 0
	declare @IDalbum int
	set @IDalbum = (SELECT COUNT(*)
					FROM Album) + 1

	INSERT INTO Album(IDA, NomAlbum, IDU)
	VALUES (@IDalbum, @tenalbum, @IDuser)

	declare @IDphoto int
	set @IDphoto = (SELECT COUNT(*)
					FROM Photo) + 1

	INSERT INTO Photo(IDP, IDA, PhotoType, NomPhoto, Contenu, NombreVu, NombreAchat, Point, NombreAimer, Prix, Supprime, Data)
	VALUES(@IDphoto, @IDalbum, @theloai, @name, @noidung, 0, 0, 0, 0, @gia, 0, @dulieu)
	set @check = 1
GO

--25/ cap nhat luot xem
-- input: IDP
-- output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_UpdateView
				@IDphoto int,
				@check int out
AS
	set @check = 0
	declare @view int

	set @view = (SELECT P.NombreVu
				FROM Photo as P
				WHERE P.IDP = @IDphoto)
	
	UPDATE Photo
	SET NombreVu = @view + 1
	WHERE IDP = @IDphoto
	
	set @check = 1
GO

--26/ Kiem tra hinh da like hay chua
-- input: IDP, IDU
-- output: 1 neu da co, 2 neu chua
CREATE PROCEDURE sp_CheckLike
				@IDuser int,
				@IDphoto int,
				@check int out
AS
	set @check = 0
	if (exists(SELECT * 
		FROM Aimer as A
		WHERE A.IDP = @IDphoto AND A.IDU = @IDuser))
		set @check = 1
GO

--27/ Kiem tra hinh da mua hay chua
-- input: IDU, IDP
-- output: 1 neu roi, 0 neu chua
CREATE PROCEDURE sp_CheckBuy
				@IDuser int,
				@IDphoto int,
				@check int out
AS
	set @check = 0
	if (exists(SELECT * 
		FROM Achat as A
		WHERE A.IDP = @IDphoto AND A.IDU = @IDuser AND A.Etat = 1))
		set @check = 1
GO

--28/ Insert bao cao vao bang
--input: IDP, type
--output: 1 neu thanh cong, 0 neu nguoc lai
CREATE PROCEDURE sp_InsertReport
				@IDphoto int,
				@loai int,
				@check int out
AS
	set @check = 0
	declare @IDreport int

	if ((SELECT IDR
		FROM Rapport
		WHERE IDR >= all(SELECT IDR
						FROM Rapport)) is NULL)
		set @IDreport = 1
	else
		set @IDreport = (SELECT IDR
					FROM Rapport
					WHERE IDR >= all(SELECT IDR
									FROM Rapport)) + 1
	
	INSERT INTO Rapport(IDR, IDP, TypeErreur)
	VALUES(@IDreport, @IDphoto, @loai)

	declare @tacgia int
	declare @reportNumber int

	SELECT @tacgia = U.IDU, @reportNumber = U.NombreRapport
	FROM Utilisateur as U, Album as A, Photo as P
	WHERE U.IDU = A.IDU AND A.IDA = P.IDA AND P.IDP = @IDphoto

	UPDATE Utilisateur
	SET NombreRapport = @reportNumber + 1
	WHERE IDU = @tacgia

	set @check = 1
GO

--29/ cap nhat thong tin hinh anh
--input: ten hinh, IDA, the loai, noi dung, gia, IDP, IDU dang chinh sua thong tin hinh
--output: 1 neu thanh cong, 0 neu khong thanh cong
CREATE PROCEDURE sp_UpdatePhotoInfo
				@IDuser int,
				@IDphoto int,
				@IDalbum int,
				@name varchar(50),
				@theloai varchar(20),
				@noidung varchar(MAX),
				@gia bigint,
				@check int out
AS
	set @check = 0
	if (exists(SELECT *
				FROM Utilisateur as U, Album as A, Photo as P
				WHERE U.IDU = A.IDU AND A.IDA = P.IDA AND P.IDP = @IDphoto AND U.IDU = @IDuser))
	BEGIN
		if(@IDalbum = 0)
		BEGIN 
			set @IDalbum = (SELECT IDA FROM Photo WHERE IDP = @IDphoto) 
		END

		if(@name is NULL)
		BEGIN 
			set @name = (SELECT NomPhoto FROM Photo WHERE IDP = @IDphoto) 
		END

		if(@theloai is NULL)
		BEGIN 
			set @theloai = (SELECT PhotoType FROM Photo WHERE IDP = @IDphoto) 
		END

		if(@noidung is NULL)
		BEGIN 
			set @noidung = (SELECT Contenu FROM Photo WHERE IDP = @IDphoto) 
		END

		if(@gia = 0)
		BEGIN 
			set @gia = (SELECT Prix FROM Photo WHERE IDP = @IDphoto) 
		END

		UPDATE Photo
		SET IDA = @IDalbum, NomPhoto = @name, PhotoType = @theloai, Contenu = @noidung, Prix = @gia
		WHERE IDP = @IDphoto
		set @check = 1
	END
GO

--30/ cho phep tac gia xoa hinh cua minh
-- input: IDP, IDU dang xoa hinh
-- output: 1 neu thanh cong, 0 neu nguoc lai
CREATE PROCEDURE sp_DeletePhoto
				@IDphoto int,
				@IDuser int,
				@check int out
AS
	set @check = 0

	if(exists(SELECT *
			FROM Utilisateur as U, Album as A, Photo as P
			WHERE U.IDU = A.IDU AND A.IDA = P.IDA AND P.IDP = @IDphoto AND U.IDU = @IDuser)) -- kiem tra nguoi dung co phai tac gia hinh hay ko
	BEGIN
		UPDATE Photo
		SET Supprime = 1
		WHERE IDP = @IDphoto

		set @check = 1
	END
GO

--31/ Lay thong tin user
-- input: IDPhoto
-- output: toan bo thong tin cua Photo
CREATE PROCEDURE sp_GetInfoPhoto
					@IDPhoto int
AS
	SELECT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U.NomUtilisateur, U.IDU, A.NomAlbum
	FROM Photo as P, Album as A, Utilisateur as U
	WHERE P.IDA = A.IDA AND U.IDU = A.IDU AND P.IDP = @IDphoto
GO

--32/ Tim nhung anh da thich
--Input: IDU
--Output: Anh da mua cua user do
CREATE PROCEDURE sp_SearchPhotoAime
				@userID int
AS
	SELECT DISTINCT P.IDP, P.IDA, P.PhotoType, P.NomPhoto, P.Contenu, P.NombreVu, P.NombreAchat, P.Point, P.NombreAimer, P.Prix, P.Supprime, P.Data, U1.NomUtilisateur, U1.IDU, Al.NomAlbum
	FROM Aimer as A, Photo as P, Utilisateur as U, Utilisateur as U1, Album as Al
	WHERE A.IDP = P.IDP AND A.IDU = @userID AND Al.IDU = U1.IDU
	AND Al.IDA = P.IDA
GO