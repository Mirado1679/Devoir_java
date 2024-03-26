<%-- 
    Document   : modification
    Created on : 26 mars 2024, 20:55:27
    Author     : Mirado ANDRIANASOLO
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="mirado.devoir.ConnexionDb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = request.getParameter("studentId_modif");
    String nom = request.getParameter("nom_modif");
    String prenom = request.getParameter("prenom_modif");
    String ageStr = request.getParameter("age_modif");

    if (studentId != null && nom != null && prenom != null && ageStr != null) {
        try {
            
            int age = Integer.parseInt(ageStr);
            
            Connection con = ConnexionDb.setConnecter();
            
            String sql = "UPDATE etudiant SET nom=?, prenom=?, age=? WHERE id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nom);
            pstmt.setString(2, prenom);
            pstmt.setInt(3, age);
            pstmt.setString(4, studentId);
            
            
            int rowsAffected = pstmt.executeUpdate();
            
            
            pstmt.close();
            con.close();
            
            
            response.sendRedirect("list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Erreur lors de la modification de l'étudiant.");
        }
    } else {
        out.println("Paramètres manquants pour la modification de l'étudiant.");
    }
%>

