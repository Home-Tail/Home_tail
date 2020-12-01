package com.sist.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.BoardVO;

import oracle.jdbc.OracleTypes;
import java.util.*;
@Repository
public class BoardDAO {
	@Autowired
    private DBConnection dbConn;
	private CallableStatement cs;
	private PreparedStatement ps;
	public List<BoardVO> freeBoardListData(int page)
	{
		List<BoardVO> fList=new ArrayList<BoardVO>();
		try
		{
			dbConn.getConnection();
			String sql="{CALL freeBoardListData(?,?,?)}";
			cs=dbConn.getConn().prepareCall(sql);
			int rowSize=8;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			cs.setInt(1, start);
			cs.setInt(2, end);
			cs.registerOutParameter(3, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(3);
			while(rs.next())
			{
				BoardVO fvo=new BoardVO();
				fvo.setBoard_no(rs.getInt(1));
				fvo.setTitle(rs.getString(2));
				fvo.setId(rs.getString(3));
				//System.out.println(rs.getString(3));
				fvo.setCate(rs.getInt(4));
				fvo.setRegdate(rs.getDate(5));
				fvo.setHit(rs.getInt(6));
				fList.add(fvo);
			}
			rs.close();
		}catch(Exception ex){
			ex.getStackTrace();
			System.out.println(ex.getMessage());
		}
		dbConn.disConnection();
		// dbConn.disConnection
		return fList;
	}
	public List<BoardVO> aReviewBoardListData(int page)
	{
		List<BoardVO> list=new ArrayList<BoardVO>();
		try
		{
			dbConn.getConnection();
			String sql="{CALL aReviewBoardListData(?,?,?)}";
			cs=dbConn.getConn().prepareCall(sql);
			int rowSize=6;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			cs.setInt(1, start);
			cs.setInt(2, end);
			cs.registerOutParameter(3, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(3);
			while(rs.next())
			{
				BoardVO vo=new BoardVO();
				vo.setBoard_no(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setId(rs.getString(3));
				//System.out.println(rs.getString(3));
				vo.setCate(rs.getInt(4));
				vo.setRegdate(rs.getDate(5));
				vo.setHit(rs.getInt(6));
				vo.setPoster(rs.getString(7));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex){
			ex.getStackTrace();
			System.out.println(ex.getMessage());
		}
		dbConn.disConnection();
		// dbConn.disConnection
		return list;
	}
	public List<BoardVO> qnaBoardListData(int page)
	{
		List<BoardVO> qList=new ArrayList<BoardVO>();
		try
		{
			dbConn.getConnection();
			String sql="{CALL qnaBoardListData(?,?,?)}";
			cs=dbConn.getConn().prepareCall(sql);
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			cs.setInt(1, start);
			cs.setInt(2, end);
			cs.registerOutParameter(3, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(3);
			while(rs.next())
			{
				BoardVO qvo=new BoardVO();
				qvo.setBoard_no(rs.getInt(1));
				qvo.setTitle(rs.getString(2));
				qvo.setId(rs.getString(3));
				//System.out.println(rs.getString(3));
				qvo.setCate(rs.getInt(4));
				qvo.setRegdate(rs.getDate(5));
				qvo.setHit(rs.getInt(6));
				qList.add(qvo);
			}
			rs.close();
		}catch(Exception ex){
			ex.getStackTrace();
			System.out.println(ex.getMessage());
		}
		dbConn.disConnection();
		// dbConn.disConnection
		return qList;
	}
	 public int freeboardTotalPage()
	    {
	    	int total=0;
	    	try
	    	{
				dbConn.getConnection();
	    		String sql="SELECT freeboardTotalPage() FROM board ";	
	    		ps=dbConn.getConn().prepareStatement(sql);
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		total=rs.getInt(1);
	    		rs.close();
	    		ps.close();
	    		
	    	}catch(Exception ex){}
			dbConn.disConnection();
	    	return total;
	    }
	 public int areviewboardTotalPage()
	    {
	    	int total=0;
	    	try
	    	{
				dbConn.getConnection();
	    		String sql="SELECT areviewboardTotalPage() FROM board ";	
	    		ps=dbConn.getConn().prepareStatement(sql);
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		total=rs.getInt(1);
	    		rs.close();
	    		ps.close();
	    		
	    	}catch(Exception ex){}
			dbConn.disConnection();
	    	return total;
	    }
	 public int qnaboardTotalPage()
	    {
	    	int total=0;
	    	try
	    	{
				dbConn.getConnection();
	    		String sql="SELECT qnaboardTotalPage() FROM board ";	
	    		ps=dbConn.getConn().prepareStatement(sql);
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		total=rs.getInt(1);
	    		rs.close();
	    		ps.close();
	    		
	    	}catch(Exception ex){}
			dbConn.disConnection();
	    	return total;
	    }
	 /*
	 public int areviewboardTotalPage()
	    {
	    	int total=0;
	    	try
	    	{
				dbConn.getConnection();
	    		String sql="SELECT areviewboardTotalPage() FROM board WHERE cate=2";	
	    		ps=dbConn.getConn().prepareStatement(sql);
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		total=rs.getInt(1);
	    		rs.close();
	    		ps.close();
	    		
	    	}catch(Exception ex){}
			dbConn.disConnection();
	    	return total;
	    }
	    */
	/*
	 * create or replace PROCEDURE freeBoardInsert(
		   pId board.id%TYPE,
		   pTitle board.title%TYPE,
		   pContent board.content%TYPE
		)
		IS
		BEGIN
		  INSERT INTO board(board_no,id,cate,title,content)
		  VALUES((SELECT NVL(MAX(board_no)+1,1) FROM board),
		          pId,1,pTitle,pContent);
		  COMMIT;
		END;
		/
	 */
	public void freeBoardInsert(BoardVO vo)
	{
		try
		{
			dbConn.getConnection();
			String sql="{CALL freeBoardInsert(?,?,?)}";
			cs=dbConn.getConn().prepareCall(sql);
			cs.setString(1, vo.getId());
			cs.setString(2, vo.getTitle());
			cs.setString(3, vo.getContent());
			
			cs.executeQuery();
		}catch(Exception ex){}
		dbConn.disConnection();
	}
	public void qnaBoardInsert(BoardVO vo)
	{
		try
		{
			dbConn.getConnection();
			String sql="{CALL qnaBoardInsert(?,?,?)}";
			cs=dbConn.getConn().prepareCall(sql);
			cs.setString(1, vo.getId());
			cs.setString(2, vo.getTitle());
			cs.setString(3, vo.getContent());
			
			cs.executeQuery();
		}catch(Exception ex){}
		dbConn.disConnection();
	}
	// 삭제 연습
	public void boardDelete(int board_no, String id)
	{
		try
		{
			dbConn.getConnection();
			String sql="{CALL boardDelete(?, ?)}";
			cs=dbConn.getConn().prepareCall(sql);
			cs.setInt(1, board_no);
			cs.setString(2, id);
			cs.executeQuery();
						
		}catch(Exception ex){}
		dbConn.disConnection();
	}
	
	public BoardVO BoardDetailData(int bno)
	{
		BoardVO vo=new BoardVO();
		try
		{
			dbConn.getConnection();
			String sql="{CALL BoardDetailData(?,?)}";
			cs=dbConn.getConn().prepareCall(sql);
			cs.setInt(1, bno);
			cs.registerOutParameter(2, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs=(ResultSet)cs.getObject(2);
			rs.next();
			vo.setBoard_no(rs.getInt(1));
			vo.setId(rs.getString(2));
			vo.setCate(rs.getInt(3));
			vo.setTitle(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setRegdate(rs.getDate(6));
			vo.setHit(rs.getInt(7));
			vo.setPoster(rs.getString(8));
			rs.close();
		}catch(Exception ex){}
		dbConn.disConnection();
		return vo;
	}
}










