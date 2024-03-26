<%-- 
    Document   : suppression
    Created on : 26 mars 2024, 20:24:27
    Author     : Mirado ANDRIANASOLO
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mirado.devoir.ConnexionDb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String studentId = request.getParameter("studentId");
    if (studentId != null && !studentId.isEmpty()) {
        try {
            Connection con = ConnexionDb.setConnecter();
            String sql = "DELETE FROM etudiant WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, studentId);
            int rowsAffected = pstmt.executeUpdate();
            
            pstmt.close();
            con.close();
            response.sendRedirect("list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Erreur lors de la suppression de l'étudiant.");
        }
    } else {
        out.println("ID de l'étudiant manquant.");
    }
%>
