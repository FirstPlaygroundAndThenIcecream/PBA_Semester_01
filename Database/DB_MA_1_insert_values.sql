--USE Hotel_MA;

delete from booking;
delete from room;
delete from price;
delete from room_category;
delete from guest;

insert into room_category values('s01', 'False', 'True', 'True', 'Standard', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('s02', 'False', 'False', 'True', 'Standard', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('d01', 'False', 'True', 'True', 'Standard', 'Standard', NULL, NULL, NULL, NULL);
insert into room_category values('d02', 'False', 'True', 'True', 'kingsize', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('d03', 'True', 'True', 'True', 'kingsize', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('f01', 'True', 'True', 'True', 'kingsize', 'Standard', 'Standard', NULL, NULL, NULL);
insert into room_category values('f02', 'False', 'True', 'True', 'Standard', 'Standard', 'Standard', 'Standard', NULL, NULL);

insert into price values('pt1', 's01', '899');
insert into price values('pt2', 's02', '769');
insert into price values('pt3', 'd01', '1250');
insert into price values('pt4', 'd02', '1299');
insert into price values('pt5', 'd03', '1399');
insert into price values('pt6', 'f01', '1799');
insert into price values('pt7', 'f02', '1689');

insert into room values('f100', 's01', 'pt1');
insert into room values('f101', 's02', 'pt2');
insert into room values('f102', 's01', 'pt1');
insert into room values('f103', 's01', 'pt1');
insert into room values('f104', 's01', 'pt1');
insert into room values('f105', 'd01', 'pt3');
insert into room values('f201', 'd01', 'pt3');
insert into room values('f202', 'd01', 'pt3');
insert into room values('f203', 'd01', 'pt3');
insert into room values('f204', 'd02', 'pt4');
insert into room values('f205', 'd02', 'pt4');
insert into room values('f301', 'd02', 'pt4');
insert into room values('f302', 'd02', 'pt4');
insert into room values('f303', 'd02', 'pt4');
insert into room values('f304', 'd03', 'pt5');
insert into room values('f305', 'd03', 'pt5');
insert into room values('f306', 'f01', 'pt6');
insert into room values('f307', 'f01', 'pt6');
insert into room values('f308', 'f02', 'pt7');
insert into room values('f309', 'f02', 'pt7');

insert into guest values('g1', 'Johan', 'Petersen', 'M', '+4555505435', 'j_pe@yahoo.com');
insert into guest values('g2', 'Tine', 'Andersen', 'F', '+4552689999', 'tine_andersen@gmail.com');
insert into guest values('g3', 'Erik', 'Bit', 'M', '+4541574121', 'erik99@mail.com');
insert into guest values('g4', 'Johan', 'Bergsø', 'M', '+4545557845', 'bergsø@gmail.com');
insert into guest values('g5', 'Johan', 'Petersen', 'M', '+4542165470', 'johanp@gmail.com');
insert into guest values('g6', 'Melissa', 'Pat', 'F', '+4544065570', 'melissa_p@gmail.com');

insert into booking values('br01', 'g1', 'f100', '2019-04-10', '2019-04-14');
insert into booking values('br02', 'g2', 'f203', '2019-03-11', '2019-03-22');
insert into booking values('br03', 'g3', 'f103', '2019-03-17', '2019-03-23');
insert into booking values('br04', 'g4', 'f304', '2019-03-28', '2019-04-02');
insert into booking values('br05', 'g5', 'f205', '2019-04-01', '2019-04-02');
insert into booking values('br06', 'g2', 'f205', '2019-05-12', '2019-05-16');
insert into booking values('br07', 'g4', 'f205', '2019-05-01', '2019-05-04');



