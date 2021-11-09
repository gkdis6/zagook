--친구 목록 반환
select id2 from zagook_friend where id='user_1' and status=3;

--반환된 목록에서 친구들의 id를 순차적으로 조회해서 해당 아이디에 대해 검색할 수 있도록 진행

select count(*) from zagook_contents where id in (select id2 from zagook_friend where id='user_1' and status=3) and privacy!=3;

--좋아요 click 여부 판단, id와 contentsno를 넘겨줌
select count(*) from zagook_like where id='user_1' and contentsno=1;

--tag 삽입, contentsno를 넘겨 받아야 함
select tag from zagook_tag where tag_id in (select tag_id from zagook_posttag where contentsno=1);

--최종 순서는 초기 받은 id로 contents 테이블 조회 -> 조회된 결과를 list로 받음 -> business logic에 따라 거리 compare 및 정렬 -> 정렬된 list를 for문에서 id와 contentsno를 넘겨서 좋아요 여부 cnt로 return -> 두 번째로 contentsno를 넘겨 post tag 정보를 받아 tag 구성

--예시 tag 생성
Insert into zagook_tag values(0, 'family');