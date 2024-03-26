<%-- 
    Document   : calculsecond
    Created on : 26 mars 2024, 22:03:17
    Author     : Mirado ANDRIANASOLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Résultat du Calcul</title>
</head>
<body>
    <h1>Résultat du Calcul</h1>
    
    <%
        double a, b, c;
        try {
            a = Double.parseDouble(request.getParameter("a"));
            b = Double.parseDouble(request.getParameter("b"));
            c = Double.parseDouble(request.getParameter("c"));
        } catch (NumberFormatException e) {
            out.println("Erreur : Les coefficients doivent être des nombres valides.");
            return;
        }
        
        double discriminant = b * b - 4 * a * c;
        
        double realPart1, realPart2, imaginaryPart1, imaginaryPart2;
        if (discriminant > 0) {
            realPart1 = (-b + Math.sqrt(discriminant)) / (2 * a);
            realPart2 = (-b - Math.sqrt(discriminant)) / (2 * a);
            out.println("Les solutions de l'équation sont réelles :");
            out.println("x1 = " + realPart1);
            out.println("x2 = " + realPart2);
        } else if (discriminant == 0) {
            realPart1 = -b / (2 * a);
            out.println("L'équation a une seule solution réelle :");
            out.println("x = " + realPart1);
        } else {
            realPart1 = -b / (2 * a);
            imaginaryPart1 = Math.sqrt(Math.abs(discriminant)) / (2 * a);
            realPart2 = -b / (2 * a);
            imaginaryPart2 = Math.sqrt(Math.abs(discriminant)) / (2 * a);
            out.println("Les solutions de l'équation sont imaginaires :");
            out.println("x1 = " + realPart1 + " + " + imaginaryPart1 + "i");
            out.println("x2 = " + realPart2 + " - " + imaginaryPart2 + "i");
        }
    %>
</body>
</html>
