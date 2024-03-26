package mirado.devoir;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnexionDb {
    
    public static Connection setConnecter() throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3308/devoir";
            String utilisateur = "mirado";
            String motDePasse = "mirado2023";
            return DriverManager.getConnection(url, utilisateur, motDePasse);
        } catch (ClassNotFoundException ex) {
            throw new Exception("Impossible de charger le driver MySQL.");
        } catch (SQLException e) {
            throw new Exception("Erreur lors de la connexion à la base de données : " + e.getMessage());
        }
    }
}
