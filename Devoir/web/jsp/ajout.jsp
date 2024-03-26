<%-- 
    Document   : ajout
    Created on : 26 mars 2024, 17:20:25
    Author     : Mirado ANDRIANASOLO
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="mirado.devoir.ConnexionDb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    int age = Integer.parseInt(request.getParameter("age"));
    
    Connection con = null;
    PreparedStatement pstmt = null;
    try {
        con = ConnexionDb.setConnecter();
        
        String sql = "INSERT INTO etudiant (nom, prenom, age) VALUES (?, ?, ?)";
        
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, nom);
        pstmt.setString(2, prenom);
        pstmt.setInt(3, age);
        
        
        pstmt.executeUpdate();
        
        response.sendRedirect("list.jsp");
    } catch (Exception e) {
       
        out.println("Erreur lors de l'ajout du joueur : " + e.getMessage());
    } finally {
       
        if (pstmt != null) {
            pstmt.close();
        }
        if (con != null) {
            con.close();
        }
    }
%>
