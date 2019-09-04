<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cn.edu.neu.core.common.CommonBaseAction"%>
<%
CommonBaseAction.setReferUrl(); 
System.out.println("-----------"+session.getAttribute("_REFER_URL_"));
%>