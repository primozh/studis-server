INSERT INTO klasius (sifra, opis, strokovni_naslov, raven_izobrazbe)
VALUES
  (12001, 'Osnovnošolska izobrazba', 'zaključena osnovna šola', '1'),
  (13001, 'Nižja poklicna izobrazba', 'zaključni izpit', '3'),
  (14001, 'Srednja poklicna izobrazba', 'zaključni izpit', '4'),
  (15001, 'Srednja strokovna izobrazba', 'poklicna matura/zaključni izpit', '5'),
  (15002, 'Srednja splošna izobrazba', 'splošna matura', '5'),
  (16102, 'Višješolska izobrazba (predbolonjska)', 'inženir/tehnolog/višji/drugo', '6/1'),
  (16201, 'Specializacija po višješolski izobrazbi (predbolonjska)', 'specialist', '6/2'),
  (16202, 'Visokošolska strokovna izobrazba (predbolonjska)', 'diplomirani/diplomirani inženir', '6/2'),
  (17001, 'Specializacija po visokošolski strokovni izobrazbi (predbolonjska)', 'specialist', '7'),
  (17002, 'Visokošolska univerzitetna izobrazba (predbolonjska)', 'univerzitetni diplomirani/akademski/profesor...', '7'),
  (18101, 'Specializacija po univerzitetni izobrazbi (predbolonjska)', 'specialist', '8/1'),
  (18102, 'Magisterij znanosti (predbolonjska)', 'magister znanosti/umetnosti', '8/1'),
  (18201, 'Doktorat znanosti (predbolonjska)', 'doktor znanosti', '8/2'),
  (16101, ' Višja strokovna izobrazba', 'inženir/tehnolog', '6/1'),
  (16203, 'Visokošolska strokovna izobrazba (prva bolonjska stopnja)', 'diplomirani (VS)', '6/2'),
  (16204, 'Visokošolska univerzitetna izobrazba (prva bolonjska stopnja)', 'diplomirani (UN)', '6/2'),
  (17003, 'Magistrska izobrazba (druga bolonjska stopnja)', 'magister', '7'),
  (18202, 'Doktorat znanosti (tretja bolonjska stopnja)', 'doktor zannosti', '8/2');

INSERT INTO vrsta_vpisa (sifra, vrsta_vpisa)
VALUES
  (1, 'Prvi vpis v letnik/dodatno leto'),
  (2, 'Ponavljanje letnika'),
  (3, 'Nadaljevanje letnika'),
  (4, 'Podaljšanje statusa študenta'),
  (5, 'Vpis po merilih za prehode v višji letnik'),
  (6, 'Vpis v semester skupnega št. programa'),
  (7, 'Vpis po merilih za prehode v isti letnik'),
  (98, 'Vpis za zaključek');

INSERT INTO nacin_studija (sifra, opis, opis_ang)
VALUES
  (1, 'redni', 'full-time'),
  (2, 'izredni', 'part-time');

INSERT INTO oblika_studija (sifra, opis, opis_ang)
VALUES
  (1, 'na lokaciji', 'on site'),
  (2, 'na daljavo', 'distance learning'),
  (3, 'e-študij', 'e-learning');

INSERT INTO studijski_program (sifra, naziv, sifra_evs, stevilo_semestrov, stopnja, klasius)
VALUES
  ('VV', 'Računalništvo in matematika UNI-1.st', 1000407, 6, 2, 16204),
  ('L1', 'Računalništvo in matematika MAG 2.st', 1000471, 4, 3, 17003),
  ('VT', 'Računalništvo in informatika UNI-1.st', 1000468, 6, 2, 16204),
  ('VU', 'Računalništvo in informatika VS-1.st', 1000470, 6, 1, 16203),
  ('X6', 'Računalništvo in informatika DR-3.st', 1000474, 6, 4, 18202);

INSERT INTO studijsko_leto (studijsko_leto)
VALUES
  ('2016/2017'),
  ('2017/2018'),
  ('2018/2019');

INSERT INTO letnik (letnik)
VALUES
  (1),
  (2),
  (3);

INSERT INTO zeton (prosta_izbira, student, vrsta_vpisa, letnik, nacin_studija, oblika_studija, studijski_program, studijsko_leto)
VALUES
  (false, 63150001, 1, 2, 1, 1, 1000468, 1),
  (false, 63150002, 2, 1, 1, 1, 1000468, 1),
  (true, 6315002, 1, 3, 1, 1, 1000468, 2);