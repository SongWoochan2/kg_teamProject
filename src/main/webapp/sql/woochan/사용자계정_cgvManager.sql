select * from tab;
select * from seq;
drop sequence admin_seq;
----------------------------------------------
--회원 테이블
create table member(
  member_id varchar2(30),     
  member_name varchar2(30) not null,
  nick varchar2(30),
  member_pwd varchar2(20) not null,
  member_birth date not null,
  member_email varchar2(50) not null,
  member_agency varchar2(10) not null,
  member_phone varchar2(11) not null,
  saving_point number,
  join_date date,
  member_grade char(1),
  member_gender varchar2(10) not null,
  profile_img varchar2(30),
  primary key(member_id)
);

insert into member(
  member_id, member_name, nick, member_pwd, member_birth, 
  member_email, member_agency, member_phone, saving_point,
  join_date, member_grade, member_gender, profile_img
) values(
  'song', '우찬', 'woochan', '1234', '900207',
  'ohmygoddu@naver.com', 'skt', '01050439803', 0,
  sysdate, 'g', '남', ''
);

commit;

select * from member;
drop table member purge;

----------------------------------------------------

--관리자 테이블
create table admin(
  admin_id varchar2(30) not null,
  admin_name varchar2(30) not null,
  admin_pwd varchar2(25) not null,
  admin_enroll_date date,
  primary key(admin_id)
);

--관리장계정 등록
insert into admin values(
   'cgv1', '강남cgv관리자', '1234', sysdate
);

commit;

select * from admin;
drop table admin purge;

-----------------------------------------------

--극장 테이블
create table theater(
  theater_code int,
  theater_name varchar2(30) not null,
  theater_photo_addr varchar2(255) not null,
  theater_phone varchar(11) not null,
  primary key(admin_code)
);

create sequence theater_seq nocache nocycle;

--관리장계정 등록
insert into theater values(
  theater_seq.nextval, '강남cgv', '', '01050439803'
);
insert into theater values(
  theater_seq.nextval, '서초cgv', '', '01050439803'
);
insert into theater values(
  theater_seq.nextval, '종로cgv', '', '01050439803'
);

commit;

select * from theater;
drop table theater purge;
drop sequence theater_seq;

------------------------------------------------------
-----------------------------------------------

--상영관 테이블
create table show_place(
  show_place_code int primary key,
  theater_code int not null,
  show_place_name varchar(30) not null,
  default_cost number not null,
  show_place_photo_addr varchar(255),
  FOREIGN KEY (theater_code) REFERENCES theater(theater_code)
);

create sequence show_place_seq nocache nocycle;

--관리장계정 등록
insert into show_place values(
  show_place_seq.nextval, '1', '1상영관', 10000, ''
);
insert into show_place values(
  show_place_seq.nextval, '1', '2상영관', 12000, ''
);
insert into show_place values(
  show_place_seq.nextval, '1', '3상영관', 11000, ''
);
insert into show_place values(
  show_place_seq.nextval, '2', '1상영관', 11000, ''
);
insert into show_place values(
  show_place_seq.nextval, '2', '2상영관', 10000, ''
);
insert into show_place values(
  show_place_seq.nextval, '3', '1상영관', 11000, ''
);

commit;

select show_place_seq.nextval FROM DUAL;

insert into show_place values(
  show_place_seq.nextval, '3', 'test상영관', 11000, ''
);

select * from show_place;
delete from show_place where show_place_code > 6;
drop table show_place purge;
drop sequence show_place_seq;

select * from tab;
------------------------------------------------------
-----------------------------------------------

--좌석 테이블
create table seat(
  show_place_code int not null,
  seat_type_code int not null,
  x_index number not null,
  y_index varchar(1) not null,
  primary key(x_index, y_index, show_place_code),
  FOREIGN KEY (show_place_code) REFERENCES show_place(show_place_code),
  FOREIGN KEY (seat_type_code) REFERENCES seat_type(seat_type_code)
);

insert into seat values( 1, 2, 2, '!');
insert into seat values( 1, 2, 5, '!');
insert into seat values( 1, 2, 1, 'A');
insert into seat values( 1, 2, 2, 'A');
insert into seat values( 1, 2, 3, 'A');
insert into seat values( 1, 2, 4, 'A');
insert into seat values( 1, 2, 5, 'A');
insert into seat values( 1, 2, 6, 'A');
insert into seat values( 1, 2, 7, 'A');
insert into seat values( 1, 2, 1, 'B');
insert into seat values( 1, 2, 2, 'B');
insert into seat values( 1, 2, 3, 'B');
insert into seat values( 1, 2, 4, 'B');
insert into seat values( 1, 2, 5, 'B');
insert into seat values( 1, 2, 6, 'B');
insert into seat values( 1, 2, 7, 'B');
insert into seat values( 1, 2, 1, 'C');
insert into seat values( 1, 2, 2, 'C');
insert into seat values( 1, 2, 3, 'C');
insert into seat values( 1, 2, 4, 'C');
insert into seat values( 1, 2, 5, 'C');
insert into seat values( 1, 2, 6, 'C');
insert into seat values( 1, 2, 7, 'C');
insert into seat values( 1, 2, 1, 'D');
insert into seat values( 1, 2, 2, 'D');
insert into seat values( 1, 2, 3, 'D');
insert into seat values( 1, 2, 4, 'D');
insert into seat values( 1, 2, 5, 'D');
insert into seat values( 1, 2, 6, 'D');
insert into seat values( 1, 2, 7, 'D');
insert into seat values( 1, 2, 1, 'E');
insert into seat values( 1, 2, 2, 'E');
insert into seat values( 1, 2, 3, 'E');
insert into seat values( 1, 2, 4, 'E');
insert into seat values( 1, 2, 5, 'E');
insert into seat values( 1, 2, 6, 'E');
insert into seat values( 1, 2, 7, 'E');

select max(x_index) as x_size, max(y_index) as y_size 
from seat where show_place_code = 1;

select  max(x_size) as x_size, count(*) as y_size
from (select max(x_index) as x_size, y_index
      from seat where show_place_code = 1 and y_index != '!' group by y_index);

		INSERT INTO seat 
		(show_place_code, seat_type_code, x_index, y_index)
		VALUES
		(show_place_seq.currval,2,3,4);

commit;

select * from seat;
delete from seat;
drop table seat purge;

------------------------------------------------------
-----------------------------------------------

--좌석분류표
create table seat_type(
  seat_type_code int primary key,
  add_cost number,
  seat_type_name varchar(15)
);

insert into seat_type values(
  0, 0, '빈좌석'
);
insert into seat_type values(
  1, -1000, '장애인석'
);
insert into seat_type values(
  2, 0, '일반석'
);
insert into seat_type values(
  3, 1000, '우등석'
);
insert into seat_type values(
  4, 1000, '커플석'
);

commit;


select * from seat_type;

delete from seat_type;
drop table seat_type purge;
drop sequence seat_type_seq;

------------------------------------------------------
--비회원 코드 시퀀스
create sequence seq_nonmember_code nocache nocycle;
drop sequence seq_nonmember_code;
