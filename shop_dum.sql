insert into user(email, password, address, name, id, phone_number) 
values ('flora@naver.com', '경기도 부천시', '조수현', 'flora123', 0321231234);

insert into category(category_name)
values('TOP'),('BOTTOM'),('OUTER'), ('ACCESSARY');
insert into cloth(cloth_name, price, c_id) 
values('방울 원피스', 15000, 2), ('가을 트렌치 코트', 55000, 3), ('골지 반팔티', 10000, 1);

insert into cart(u_id, c_id, many) values(1, 1, 3);

insert into status(status_name) 
values('배송 준비중'), ('배송중'), ('배송완료');

/*insert into order(cart_id,total_price, status)
 values(0, 50000, 2);*/