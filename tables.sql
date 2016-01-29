drop database if exists proj;
create database proj;
use proj;


%==============================实体表格================================

create table Users(
	UserId int not null AUTO_INCREMENT,
	Email varchar(20) unique,
	Password varchar(10),
	UserName varchar(30)COLLATE gbk_bin,
	primary key(UserId) 
);ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC
;

create table Login(
	LoginId int not null AUTO_INCREMENT,
	UserId int,
	foreign key (UserId) references Users(UserId) 
				on update cascade on delete cascade,
	primary key(LoginId,UserId)
);ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC
;

drop table TravelNote;
create table TravelNote(
	NoteId int not null AUTO_INCREMENT,
	Content varchar(500)COLLATE gbk_bin DEFAULT NULL,
	NoteDate varchar(20) COLLATE gbk_bin,
 	primary key(NoteId)
);ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC
;

create table Picture(
	PictureId int not null AUTO_INCREMENT,
	URL varchar(100),
 	primary key(PictureId)
);

create table Route(
	RouteId int not null AUTO_INCREMENT,
	DestinationCity varchar(20)COLLATE gbk_bin,
	DepartureCity varchar(20)COLLATE gbk_bin,
	Vehicle varchar(20)COLLATE gbk_bin,
 	primary key(RouteId)
);ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC
;

%游记里面加了NodeDate，若不必要可去除

%================================关系表格================================

create table makeRoute(
	UserId int,
	RouteId int,
 	foreign key (UserId) references Users(UserId) 
				on update cascade on delete cascade,
	foreign key (RouteId) references Route(RouteId) 
				on update cascade on delete cascade
);

create table makeNote(
	UserId int,
	NoteId int,
 	foreign key (UserId) references Users(UserId) 
				on update cascade on delete cascade,
	foreign key (NoteId) references TravelNote(NoteId) 
				on update cascade on delete cascade
);

create table storePicture(
	UserId int,
	NoteId int,
	PictureId int,
	foreign key (UserId) references Users(UserId) 
				on update cascade on delete cascade,
	foreign key (NoteId) references TravelNote(NoteId) 
				on update cascade on delete cascade,
 	foreign key (PictureId) references Picture(PictureId) 
				on update cascade on delete cascade
);

%============================使用中文字符======================================
set character_set_database=utf8;
set character_set_server=utf8;
set character_set_client=gbk;
set character_set_connection=gbk;
show variables like "%char%";


%==============================测试样例=========================================

insert into Users(Email, Password, UserName) values("12345@qq.com", "12345", "liang");
insert into Users(Email, Password, UserName) values("11111@qq.com", "11111", "陈伟源");
insert into Users(Email, Password, UserName) values("22222@qq.com", "22222", "曹健均");
insert into Users(Email, Password, UserName) values("33333@qq.com", "33333", "叶志显");


insert into TravelNote(Content, NoteDate) values("风景还是美得让人甘愿受一路寒风奔波的 ", "20160128");
insert into TravelNote(Content, NoteDate) values("人家是三月下江南 ", "20160127");
insert into TravelNote(Content, NoteDate) values("我们是腊月上江南 ", "20160126");
insert into TravelNote(Content, NoteDate) values("果不其然冻成狗", "20160125");

insert into makeNote(UserId, NoteId) values(1, 1);
insert into makeNote(UserId, NoteId) values("2", "2");
insert into makeNote(UserId, NoteId) values("3", "3");
insert into makeNote(UserId, NoteId) values("4", "4");

insert into Picture(URL) values("www.baidu.com");
insert into Picture(URL) values("www.souhu.com");
insert into Picture(URL) values("www.sina.com");
insert into Picture(URL) values("www.yahoo.com");

insert into storePicture(UserId,NoteId,PictureId) values(1,1,1);



%===========================触发器样例（只是样例！）====================================

delimiter $
create trigger t_afterUpdateNumber_on_orders
before update on courses
for each row
begin
	if new.number > 20 and new.good_id = '1001' then set new.number = '20';
	end if;
	update Goods set Goods.number = Goods.number + old.number - new.number where Goods.id = new.good_id;
end$
delimiter ;




