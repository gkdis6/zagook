package com.project.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.Utility.Utility;
 
@RestController
public class ReplyController {
  private static final Logger log = LoggerFactory.getLogger(ReplyController.class);
 
  @Autowired
  private ReplyMapper mapper;
 
  @GetMapping("/reply/list/{contentsno}/{sno}/{eno}")
  public ResponseEntity<List<ReplyDTO>> getList(
	  @PathVariable("contentsno") int contentsno, 
      @PathVariable("sno") int sno,
      @PathVariable("eno") int eno) {
 
    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("contentsno", contentsno);
 
    return new ResponseEntity<List<ReplyDTO>>(mapper.list(map), HttpStatus.OK);
  }
 
  @GetMapping("/reply/page")
  public ResponseEntity<String> getPage(
      @RequestParam("nPage") int nPage, 
      @RequestParam("nowPage") int nowPage,
      @RequestParam("contentsno") int contentsno, 
      @RequestParam("col") String col, 
      @RequestParam("word") String word) {
 
    int total = mapper.total(contentsno);
    String url = "read";
 
    int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
 
    String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, contentsno);
 
    return new ResponseEntity<>(paging, HttpStatus.OK);
 
  }
  @PostMapping("/reply/create")
  public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {
 
    log.info("ReplyDTO1: " + dto.getContent());
    log.info("ReplyDTO1: " + dto.getId());
    log.info("ReplyDTO1: " + dto.getContentsno());
 
    dto.setContent(dto.getContent().replaceAll("/n/r", "<br>"));
 
    int flag = mapper.create(dto);
 
    log.info("Reply INSERT flag: " + flag);
 
    return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
 
  @GetMapping("/reply/{rnum}")
  public ResponseEntity<ReplyDTO> get(@PathVariable("rnum") int rnum) {
 
    log.info("get: " + rnum);
 
    return new ResponseEntity<>(mapper.read(rnum), HttpStatus.OK);
  }
  
}