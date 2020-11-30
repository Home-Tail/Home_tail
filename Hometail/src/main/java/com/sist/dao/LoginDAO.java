package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.CenterServiceMapper;
import com.sist.vo.MemberVO;

import oracle.jdbc.OracleTypes;
import java.sql.*;
@Repository
public class LoginDAO {
  @Autowired
  CenterServiceMapper mapper;
  // LOGIN => 일반 SQL
  public int isLogin(String id)
  {
	  return mapper.isLogin(id);
  }
  public MemberVO Login_info(String id)
  {
	  return mapper.Login_info(id);
  }
}







