# use springreact;



drop table if exists tbl_authority;

create table tbl_authority
(
    authority_code mediumint not null auto_increment comment '권한코드',
    authority_name varchar(255) not null comment '권한명',
    authority_desc varchar(4000) not null comment '권한설명',
    primary key ( `authority_code` )
)
    comment = '권한';



drop table if exists tbl_category;

create table tbl_category
(
    category_code    mediumint not null auto_increment comment '카테고리코드',
    category_name    varchar(50) not null comment '카테고리명',
    primary key ( `category_code` )
)
    comment = '상품카테고리';



drop table if exists tbl_member;

create table tbl_member
(
    member_code    mediumint not null auto_increment comment '회원코드',
    member_id        varchar(100) unique not null comment '아이디',
    member_name  varchar(100) not null comment '회원이름',
    member_password    varchar(500) not null comment '비밀번호',
    member_role    varchar(100) default 'role_user' not null comment '권한',
    member_email    varchar(100) comment '이메일',
    member_status   varchar(1)   default 'y'  not null comment '직원상태',
    primary key ( `member_code` )
)
    comment = '회원';



drop table if exists tbl_member_role;

create table tbl_member_role
(
    `member_code` mediumint not null comment '회원코드',
    `authority_code` mediumint not null comment '권한코드',
    primary key ( `member_code`, `authority_code` )
)
    comment = '회원권한';


drop table if exists tbl_refresh_token;

create table tbl_refresh_token
(
    member_id   varchar(100)  not null comment '회원아이디',
    token       varchar(1000) not null comment '리프레시토큰',
    expiry_date datetime      not null comment '만료일시',
    primary key ( `member_id` )
)
    comment = '리프레시토큰';



drop table if exists tbl_order;

create table tbl_order
(
    order_code    mediumint  not null auto_increment comment '주문식별번호',
    product_code    mediumint  not null comment '상품코드',
    order_member    mediumint  not null comment '회원코드',
    order_phone    varchar(100) not null comment '핸드폰번호',
    order_email    varchar(100) not null comment '이메일주소',
    order_receiver    varchar(100) not null comment '받는사람',
    order_address    varchar(500) not null comment '배송주소',
    order_amount    varchar(50) not null comment '주문갯수',
    order_date    varchar(100) not null comment '주문일자',
    primary key ( `order_code` )
)
    comment = '주문';



drop table if exists tbl_product;

create table tbl_product
(
    product_code    mediumint not null auto_increment comment '상품코드',
    product_name    varchar(100) not null comment '상품명',
    product_price    varchar(100) not null comment '상품가격',
    product_description    varchar(1000) comment '상품설명',
    product_orderable    varchar(5) not null comment '구매가능여부',
    category_code    mediumint comment '카테고리코드',
    product_image_url    varchar(100) not null comment '상품이미지경로',
    product_stock    mediumint not null comment '상품재고',
    primary key ( `product_code` )
)
    comment = '상품';



drop table if exists tbl_review;

create table tbl_review
(
    review_code    mediumint not null auto_increment comment '리뷰식별번호',
    product_code    mediumint not null comment '상품코드',
    member_code    mediumint not null comment '회원코드',
    review_title    varchar(100) not null comment '리뷰제목',
    review_content    varchar(1000) not null comment '리뷰내용',
    review_create_date    varchar(100) not null comment '작성일',
    primary key ( `review_code` )
)
    comment = '상품리뷰';

insert into tbl_authority (authority_code,authority_name,authority_desc) values (null, 'role_admin','관리자');
insert into tbl_authority (authority_code,authority_name,authority_desc) values (null,'role_user','일반회원');



-- password : 1234
insert into tbl_member values (null, 'admin', '관리자', '$2a$10$covazywgzpxseekayhruh.payyfcsego5asrhoslzn0x8jonww2dw', 'role_admin', 'ohgiraffers@gmail.com', 'y');
insert into tbl_member values (null, 'test01', '오지라퍼', '$2a$10$n34mrj4tkvd0axwvecc8eoluybpxlopke7yw.s4/kj5fd1ou5bwsi', 'role_user', 'test01@naver.com', 'y');

insert into tbl_member_role (member_code,authority_code) values (1,1);
insert into tbl_member_role (member_code,authority_code) values (1,2);
insert into tbl_member_role (member_code,authority_code) values (2,2);
insert into tbl_member_role (member_code,authority_code) values (3,2);


insert into tbl_category values (null, '식사');
insert into tbl_category values (null, '디저트');
insert into tbl_category values (null, '음료');

insert into tbl_product values (null, '열무김치라떼', 4500, '열무로 만든 김치 라떼', 'y', 3, '06a0060ae2da4dffb9a8a440ba5d9c5e.png', 10);
insert into tbl_product values (null, '우럭스무디', 5000, '우럭으로 만든 스무디', 'y', 3, 'fcb3e0c8f94940cf99724d26e6020259.png', 15);
insert into tbl_product values (null, '생갈치쉐이크', 6000, '생으로 갈아만든 갈치 쉐이크', 'y', 3, '8e2492fd197e42d5855ffbbb5142b4ed.png', 17);
insert into tbl_product values (null, '갈릭미역파르페', 7000, '갈릭 미역을 섞어 만든 파르페', 'y', 2, '58b3fd68f6074de2b33d4430fd29244b.png', 19);
insert into tbl_product values (null, '앙버터김치찜', 13000, '가장 먹을만한 김치찜', 'y', 1, '7580adcf59d04240b7a16f6cf07bd34b.png', 19);

insert into tbl_product values (null, '생마늘샐러드', 12000, '생마늘을 넣어 만든 샐러드', 'y', 2, '7b91aee3ddec49a69a9b7d2849493f7f.png', 24);
insert into tbl_product values (null, '민트미역국', 15000, '민트를 넣어만든 미역국', 'y', 1, 'af732dfe3e4f482bac8d1ef0bd9be02b.png', 12);
insert into tbl_product values (null, '한우딸기국밥', 20000, '한우에 딸기를 얹은 국밥', 'y', 1, '8a4cd876df574970a565b41e47561080.png', 22);
insert into tbl_product values (null, '홍어마카롱', 9000, '홍어를 갈아 넣은 마카롱', 'y', 2, 'c0a177a658b44f749699f91a23c47d8b.png', 17);
insert into tbl_product values (null, '코다리마늘빵', 7000, '코다리 마늘빵은 진리', 'y', 2, '053626c2d16f4814a5e81b842a115dc7.png', 17);

insert into tbl_product values (null, '정어리빙수', 10000, '정어리를 갈아 만든 빙수', 'y', 2, '323a5df17163482d90a74f8198a4e4c6.png', 12);
insert into tbl_product values (null, '날치알스크류바', 2000, '스크류바에 날치알이라니', 'y', 2, 'd97144a76a7b42fabfcf8a5662762040.png', 12);
insert into tbl_product values (null, '직화구이젤라또', 8000, '젤라또를 직화로', 'y', 2, 'a4195b272f764a3ab81e85fbbba6c067.png', 16);
insert into tbl_product values (null, '과메기커틀릿', 13000, '커틀렛 속에 쏙 과메기', 'y', 1, '702215dbe9784ebf92561d5504b0b5a6.png', 11);
insert into tbl_product values (null, '죽방멸치튀김우동', 11000, '너도 나도 죽방 멸치 우동', 'y', 1, '5c226e59e7c342608d220ce0c476d01f.png', 13);

insert into tbl_product values (null, '흑마늘아메리카노', 3000, '흑마늘을 넣은 아메아메아메리카노', 'y', 3, '684fd2cccfc74ad4944619bc72f76788.png', 21);
insert into tbl_product values (null, '아이스가리비관자육수', 50000, '아이스 육수 가리비 관자', 'y', 1, 'b150ff66223a46adabb75a71299cb25a.png', 16);
insert into tbl_product values (null, '붕어빵초밥', 20000, '초밥이 붕어빵에 있는것인가 그 반대인가', 'y', 1, 'c260a42b01394faba92ed9a7ca868aa9.png', 11);
insert into tbl_product values (null, '까나리코코넛쥬스', 5000, '코코넛 주스에 까나리 한스푼', 'y', 3, '21406eb90b2f4ae09ea0af015d2df6fe.png', 28);
insert into tbl_product values (null, '마라깐쇼한라봉', 22000, '마라깐쇼 한라봉 고고', 'y', 3, 'eccf4c58d72241ddb4c84401485d4363.png', 21);

insert into tbl_product values (null, '돌미나리백설기', 5000, '백설기 속에 씹히는 돌미나리', 'y', 2, '9a6c1b13af0a469fa2d9e3084f6e438c.png', 12);



insert into tbl_review values (null, 1, 2, '열무김치라떼 리뷰 입니다.', '정말 맛있는 이 라떼 저만 먹을수 없습니다! 꼭 드세요 두번 드세요~!', now());
insert into tbl_review values (null, 21, 2, '돌미나리백설기 리뷰 입니다.', '돌을 씹어 먹을수 있는 분만 드시기 바랍니다~! 진짜 돌이에요', now());
insert into tbl_review values (null, 20, 2, '마라깐쇼한라봉 리뷰 입니다.', '한라봉을 먹는데 매콤하네요? 시원합니다~!', now());
insert into tbl_review values (null, 19, 2, '까나리코코넛쥬스 리뷰 입니다.', '까나리 까나리 신나는 노래~ 나도한번 불러본다', now());
insert into tbl_review values (null, 18, 2, '붕어빵초밥 리뷰 입니다.', '붕어빵으로 만든 초밥인데 이게 빵인지 붕어인지 모르겠습니다.', now());
insert into tbl_review values (null, 17, 2, '아이스가리비관자육수 리뷰 입니다.', '이가 시려워 꽁 발이 시려워 꽁 관자육수 때문에 꽁꽁꽁!', now());


commit;

