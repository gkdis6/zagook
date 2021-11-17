insert into zagook_reply(rnum, content, regdate, id, contentsno)
values((select nvl(max(rnum),0)+1 from zagook_reply),'좋아요.',sysdate,'user1',10);

insert into zagook_reply(rnum, content, regdate, id, contentsno)
values((select nvl(max(rnum),0)+1 from zagook_reply),'굳굳',sysdate,'user1',10);

insert into zagook_reply(rnum, content, regdate, id, contentsno)
values((select nvl(max(rnum),0)+1 from zagook_reply),'good',sysdate,'user1',10);

delete from zagook_reply where rnum=11;

--list(목록)
select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, contentsno, r
FROM(
    select rnum, content, regdate, id, contentsno, rownum r
    FROM(
        select rnum, content, regdate, id, contentsno
        from zagook_reply
        where contentsno = 10
        order by rnum DESC
    )
)WHERE r >= 1 and r <= 10;

--total(목록)
select count(*) from zagook_reply
where contentsno = 10;
--read(댓글 내용)
select * from zagook_reply
where rnum=10;
