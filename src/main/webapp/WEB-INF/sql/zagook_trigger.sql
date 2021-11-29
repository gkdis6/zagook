/*트리거 생성=============================
ID. FK 값 데이터 UPDATE
*/
CREATE OR REPLACE TRIGGER ZAGOOK_MEMBER_ID_UPDATE
AFTER UPDATE OF ID ON ZAGOOK_MEMBER FOR EACH ROW
BEGIN
    update zagook_FRIEND
    set id2 = :NEW.id
    where id2= :OLD.id;

    update zagook_FRIEND
    set id = :NEW.id
    where id= :OLD.id;
    update zagook_LIKE
    set id = :NEW.id
    where id= :OLD.id;
    update zagook_CONTENTS
    set id = :NEW.id
    where id= :OLD.id;
    update zagook_REPLY
    set id = :NEW.id
    where id= :OLD.id;
END;
/*
==========트리거 삭제 
*/
drop trigger zagook_MEMBER_id_update;




  
