-- 식당 정보 테이블 (상호, 전화번호, 주소)
-- 메뉴 정보 테이블 (음식명, 가격)
create table restaurant (
	id int primary key auto_increment,
	name varchar(10) not null,
    tel varchar(15) not null unique,
    address varchar(30) not null unique
);
create table menu (
	menuid int primary key auto_increment,
	name varchar(10) not null,
    price int not null
);
drop table restaurant;
drop table menu;

insert into restaurant (name, tel, address) values ('도연정', '0518050071', '부산 부산진구 새싹로 16');
insert into restaurant (name, tel, address) values ('영자면옥', '0518086958', '부산 부산진구 새싹로8번길 29');
insert into restaurant (name, tel, address) values ('일품생선구이', '0518060092', '부산 부산진구 새싹로14번길 21');
insert into restaurant (name, tel, address) values ('장터돼지국밥', '0518076732', '부산 부산진구 새싹로8번길 7');
insert into restaurant (name, tel, address) values ('대모골', '0518033109', '부산 부산진구 부전로152번길 71');
insert into restaurant (name, tel, address) values ('그집곱도리탕', '050713084186', '부산 부산진구 동천로107번길 17');
insert into restaurant (name, tel, address) values ('김완쭈꾸미', '0518187778', '부산 부산진구 중앙대로755번길 10');
select * from restaurant;

insert into menu (name, price) values ('칼국수', 3000), ('짜장면', 3000),  ('밀면', 3000),  ('돌솥비빔밥', 5000),  ('왕돈까스', 6500);
insert into menu (name, price) values ('칼국수', 2500), ('짜장면', 2500),  ('밀면', 3500),  ('비빔밥', 4000),  ('제육덮밥', 4000);
insert into menu (name, price) values ('모둠생선구이', 22000), ('고등어구이', 10000);
insert into menu (name, price) values ('따로돼지국밥', 6000), ('따로내장국밥', 6000), ('따로순대국밥', 6000), ('따로섞어국밥', 6000);
insert into menu (name, price) values ('숯불간장구이', 22000), ('숯불고추장구이', 22000), ('김치부대찌개', 7000);
insert into menu (name, price) values ('곱도리탕.소', 32000), ('곱도리탕.중', 45000), ('곱도리탕.대', 57000);
insert into menu (name, price) values ('쭈꾸미 덮밥', 8000), ('쭈꾸미 정식', 11000), ('왕새우튀김', 15000);
select * from menu;

alter table menu add column restId int; -- alter : 구조를 변화시키는 명령어

update menu set restid = 1; -- update 테이블명 set 칼럼 : 데이터를 추가하는 명령어 -> 모든 행에 해당 열이 1로 바뀜
update menu set restid = 2 where menuid <> 1; -- 여기에도 where 조건달 수 있다

-- ★★restaurant의 id와 menu의 resrId를 연결시켜 줄거임~ restIdrestId를 foreign key 외래키로 부름
alter table menu add constraint foreign key (restId) references restaurant (id);
