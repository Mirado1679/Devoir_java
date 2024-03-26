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
    <link href="../html/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Calcul de Second Degré</h1>
        
        <form method="post" class="mx-auto" style="max-width: 400px;">
            <div class="form-group">
                <label for="a">Coefficient a :</label>
                <input type="text" class="form-control" name="a" id="a" required>
            </div>
            <div class="form-group">
                <label for="b">Coefficient b :</label>
                <input type="text" class="form-control" name="b" id="b" required>
            </div>
            <div class="form-group">
                <label for="c">Coefficient c :</label>
                <input type="text" class="form-control" name="c" id="c" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Calculer</button>
        </form>

        <div class="mt-4 text-center mx-auto">
            <% 
                if (request.getMethod().equals("POST")) {
                    double a, b, c;
                    try {
                        a = Double.parseDouble(request.getParameter("a"));
                        b = Double.parseDouble(request.getParameter("b"));
                        c = Double.parseDouble(request.getParameter("c"));
                        
                        double discriminant = b * b - 4 * a * c;
                        
                        double realPart1, realPart2, imaginaryPart1, imaginaryPart2;
                        if (discriminant > 0) {
                            realPart1 = (-b + Math.sqrt(discriminant)) / (2 * a);
                            realPart2 = (-b - Math.sqrt(discriminant)) / (2 * a);
                            out.println("<div class=\"card\" style=\"width: 18rem;\">");
                            out.println("<div class=\"card-body\">");
                            out.println("<h5 class=\"card-title\">Solutions réelles</h5>");
                            out.println("<p class=\"card-text\">x1 = " + realPart1 + "</p>");
                            out.println("<p class=\"card-text\">x2 = " + realPart2 + "</p>");
                            out.println("</div></div>");
                        } else if (discriminant == 0) {
                            realPart1 = -b / (2 * a);
                            out.println("<div class=\"card\" style=\"width: 18rem;\">");
                            out.println("<div class=\"card-body\">");
                            out.println("<h5 class=\"card-title\">Solution réelle</h5>");
                            out.println("<p class=\"card-text\">x = " + realPart1 + "</p>");
                            out.println("</div></div>");
                        } else {
                            realPart1 = -b / (2 * a);
                            imaginaryPart1 = Math.sqrt(Math.abs(discriminant)) / (2 * a);
                            realPart2 = -b / (2 * a);
                            imaginaryPart2 = Math.sqrt(Math.abs(discriminant)) / (2 * a);
                            out.println("<div class=\"card\" style=\"width: 18rem;\">");
                            out.println("<div class=\"card-body\">");
                            out.println("<h5 class=\"card-title\">Solutions imaginaires</h5>");
                            out.println("<p class=\"card-text\">x1 = " + realPart1 + " + " + imaginaryPart1 + "i</p>");
                            out.println("<p class=\"card-text\">x2 = " + realPart2 + " - " + imaginaryPart2 + "i</p>");
                            out.println("</div></div>");
                        }
                    } catch (NumberFormatException e) {
                        out.println("<p>Erreur : Les coefficients doivent être des nombres valides.</p>");
                    }
                }
            %>
        </div>
    </div>

</body>
</html>
