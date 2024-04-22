CREATE TABLE Ugyfel
(ID int IDENTITY PRIMARY KEY,
LOGIN nvarchar(255) MASKED WITH (Function = 'partial(0,"XXX",2)'),
EMAIL nvarchar(255)	MASKED WITH (Function = 'email()'),
NEV nvarchar(255),
SZULEV int MASKED WITH (Function = 'random(1, 2024)'),
NEM nvarchar(1),
CIM nvarchar(255)
)

INSERT INTO Ugyfel (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM)
VALUES
('adam1', 'ádám.kiss@mail.hu', 'Kiss Ádám', 1991, 'F', '5630 Békés, Szolnoki út 8.'),
('adam3', 'adam3@gmail.com', 'Barkóci Ádám', 1970, 'F', '3910 Tokaj, Dózsa György utca 37.'),
('adam4', 'ádám.bieniek@mail.hu', 'Bieniek Ádám', 1976, 'F', '8630 Balatonboglár, Juhászföldi út 1.'),
('agnes', 'agnes@gmail.com', 'Lengyel Ágnes', 1979, 'N', '5200 Törökszentmiklós, Deák Ferenc út 5.'),
('agnes3', 'agnes3@gmail.com', 'Hartyánszky Ágnes', 1967, 'N', '6430 Bácsalmás, Posta köz 2.'),
('AGNESH', 'AGNESH@gmail.com', 'Horváth Ágnes', 1981, 'N', '8200 Veszprém, Rákóczi utca 21.'),
('AGNESK', 'AGNESK@gmail.com', 'Kovács Ágnes', 1988, 'N', '1084 Budapest, Endrődi Sándor utca 47.'),
('akos', 'ákos.bíró@mail.hu', 'Bíró Ákos', 1982, 'F', '9023 Győr, Kossuth Lajos utca 47/b.'),
('aladar', 'aladár.dunai@mail.hu', 'Dunai Aladár', 1980, 'F', '5931 Nagyszénás, Árpád utca 23.'),
('alexandra', 'alexandra.bagóczki@mail.hu', 'Bagóczki Alexandra', 1992, 'N', '2381 Táborfalva, Petőfi utca 1/2.')


CREATE USER Masked WITHOUT Login;
GRANT SELECT ON Ugyfel TO Masked

EXECUTE AS USER='Masked';
SELECT *
FROM Ugyfel
REVERT