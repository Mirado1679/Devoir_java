<%@page import="java.sql.ResultSet"%>
<%@page import="mirado.devoir.ConnexionDb"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des joueurs</title>
        <link href="../html/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h1 class="card-title mb-0">Liste des étudiants</h1>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ajoutJoueurModal">Ajouter un étudiant</button>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nom</th>
                                <th>Prenom</th>
                                <th>Age</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String sql = "SELECT * FROM etudiant";
                                Connection con = ConnexionDb.setConnecter();
                                ResultSet rs = con.createStatement().executeQuery(sql);
                                while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("nom")%></td>
                                <td><%= rs.getString("prenom")%></td>
                                <td><%= rs.getInt("age")%></td>
                                <td>
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmationModal" data-id="<%= rs.getString("id")%>">Supprimer</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modificationModal" 
                                            data-id="<%= rs.getString("id")%>"
                                            data-nom="<%= rs.getString("nom")%>"
                                            data-prenom="<%= rs.getString("prenom")%>"
                                            data-age="<%= rs.getInt("age")%>">
                                        Modifier
                                    </button>
                                </td>
                            </tr>
                            <% }
                                rs.close();
                                con.close();
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal pour l'ajout d'un joueur -->
            <div class="modal fade" id="ajoutJoueurModal" tabindex="-1" role="dialog" aria-labelledby="ajoutJoueurModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ajoutJoueurModalLabel">Ajouter un joueur</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ajout.jsp" method="post">
                                <div class="form-group">
                                    <label for="nom">Nom:</label>
                                    <input type="text" class="form-control" id="nom" name="nom">
                                </div>
                                <div class="form-group">
                                    <label for="prenom">Prenom:</label>
                                    <input type="text" class="form-control" id="prenom" name="prenom">
                                </div>
                                <div class="form-group">
                                    <label for="age">Age:</label>
                                    <input type="number" class="form-control" id="age" name="age">
                                </div>
                                <button type="submit" class="btn btn-primary">Ajouter</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmationModalLabel">Confirmation de suppression</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Êtes-vous sûr de vouloir supprimer cet étudiant ?</p>
                        </div>
                        <div class="modal-footer">
                            <form id="deleteForm" action="suppression.jsp" method="post">
                                <input type="hidden" id="studentId" name="studentId">
                                <button type="submit" class="btn btn-danger">Confirmer</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modificationModal" tabindex="-1" role="dialog" aria-labelledby="modificationModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modificationModalLabel">Modifier un étudiant</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="modification.jsp" method="post">
                                <div class="form-group">
                                    <label for="nom_modif">Nom:</label>
                                    <input type="text" class="form-control" id="nom_modif" name="nom_modif">
                                </div>
                                <div class="form-group">
                                    <label for="prenom_modif">Prenom:</label>
                                    <input type="text" class="form-control" id="prenom_modif" name="prenom_modif">
                                </div>
                                <div class="form-group">
                                    <label for="age_modif">Age:</label>
                                    <input type="number" class="form-control" id="age_modif" name="age_modif">
                                </div>
                                <!-- Champ caché pour stocker l'ID de l'étudiant à modifier -->
                                <input type="hidden" id="studentId_modif" name="studentId_modif">
                                <button type="submit" class="btn btn-primary">Modifier</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script src="../html/jquery.slim.min.js"></script>
            <script src="../html/popper.min.js"></script>
            <script src="../html/bootstrap.min.js"></script>
            <script src="../html/sweetalert.min.js"></script>

            <script>
                $('#confirmationModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget);
                    var studentId = button.data('id');
                    var modal = $(this);
                    modal.find('#studentId').val(studentId);
                });
            </script>
            <script>
                $('#modificationModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget);
                    var studentId = button.data('id');
                    var nom = button.data('nom');
                    var prenom = button.data('prenom');
                    var age = button.data('age');
                    var modal = $(this);
                    modal.find('#studentId_modif').val(studentId);
                    modal.find('#nom_modif').val(nom);
                    modal.find('#prenom_modif').val(prenom);
                    modal.find('#age_modif').val(age);
                });
            </script>
    </body>
</html>
