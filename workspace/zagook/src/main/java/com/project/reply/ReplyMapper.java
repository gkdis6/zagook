package com.project.reply;

import java.util.List;
import java.util.Map;
 
public interface ReplyMapper{
 
<<<<<<< HEAD
   int create(ReplyDTO dto);
=======
   int create(ReplyDTO replyDTO);
>>>>>>> friend
 
   List<ReplyDTO> list(Map map);
 
   ReplyDTO read(int rnum);
  
<<<<<<< HEAD
   int update(ReplyDTO dto); 
=======
   int update(ReplyDTO replyDTO); 
>>>>>>> friend
   
   int delete(int rnum);
 
   int total(int contentsno);

   void upViewcnt(int contentsno);

}
<<<<<<< HEAD
=======

>>>>>>> friend
