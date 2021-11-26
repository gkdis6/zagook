insert into zagook_reply(rnum, content, regdate, id, contentsno)
values((select nvl(max(rnum),0)+1 from zagook_reply),'좋아요.',sysdate,'user1',10);

insert into zagook_reply(rnum, content, regdate, id, contentsno, grp, grps, grpl)
values((select nvl(max(rnum),0)+1 from zagook_reply),'굳굳',sysdate,'user_1',295,1,1,0);

insert into zagook_reply(rnum, content, regdate, id, contentsno, grp, grps, grpl)
values((select nvl(max(rnum),0)+1 from zagook_reply),'테스트',sysdate,'user_1',295,2,1,0);

insert into zagook_reply(rnum, content, regdate, id, contentsno, grp, grps, grpl)
values((select nvl(max(rnum),0)+1 from zagook_reply),'제발 나와라~',sysdate,'user_1',295,3,1,0);

insert into zagook_reply(rnum, content, regdate, id, contentsno, zagookno)
values((select nvl(max(rnum),0)+1 from zagook_reply),'good',sysdate,'user1',2);

delete from zagook_reply where rnum=9;

--list(목록)
select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, contentsno, r
FROM(
    select rnum, content, regdate, id, contentsno, rownum r
    FROM(
        select rnum, content, regdate, id, contentsno
        from zagook_reply
        where contentsno = 2
        order by rnum DESC
    )
)WHERE r >= 1 and r <= 5;

--total(목록)
select count(*) from zagook_reply
where contentsno = 10;

--read(댓글 내용)
select * from zagook_reply
where rnum=10;

--update(댓글 수정)
update zagook_reply
set content = '새로운 의견을 올립니다.'
where rnum = 34;
 
--delete(댓글 삭제)
delete from zagook_reply
where contentsno = 295;

alter table zagook_reply add grp int NOT NULL;

alter table zagook_reply add grps int NOT NULL;

alter table zagook_reply add grpL int NOT NULL;