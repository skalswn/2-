package kr.board.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.domain.Board;
import kr.board.mapper.BoardMapper;

@Service
public class boardservice {

	@Autowired
	private BoardMapper mapper; 
	
	
	public void boardinsertAjax(Board vo) {
		mapper.boardinsert(vo);
	}
	
	public Board boardviewAjax(int idx) {
		Board vo=mapper.boardview(idx);
		return vo;
	}
	
	public void boarddeleteAjax(int idx) {
		mapper.boarddelete(idx);
	}
	
	public void boardreplaceAjax(Board vo) {
		mapper.boardupdate(vo);
	}
	
	public void boardupdateAjax(Board vo) {
		System.out.print("1번");
		mapper.boardupdate_tw(vo);
	}

	public List<Board> boardListAjax() {
		List<Board> list=mapper.boardList();
		return list;
	}

}
