package kr.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.domain.Board;
import kr.board.mapper.BoardMapper;
import kr.board.view.boardservice;

@RestController
public class Boardrestcontroller {
	
	@Autowired
	private boardservice service; 
	
	@RequestMapping("/boardList.Ajax")
	public List<Board> boardListAjax() {
		List<Board> list=service.boardListAjax();
		return list;
	}
	@RequestMapping("/boardinsert.Ajax")
	public void boardinsertAjax(Board vo) {
		service.boardinsertAjax(vo);
	}
	@RequestMapping("/boardview.Ajax")
	public Board boardviewAjax(int idx) {
		Board vo=service.boardviewAjax(idx);
		return vo;
	}
	@RequestMapping("/boarddelete.Ajax")
	public void boarddeleteAjax(int idx) {
		service.boarddeleteAjax(idx);
	}
	@RequestMapping("/boardreplace.Ajax")
	public void boardreplaceAjax(Board vo) {
		service.boardreplaceAjax(vo);
	}
	@RequestMapping("/boardupdate.Ajax")
	public void boardupdateAjax(Board vo) {
		System.out.print("2번");
		service.boardupdateAjax(vo);
	}

}
