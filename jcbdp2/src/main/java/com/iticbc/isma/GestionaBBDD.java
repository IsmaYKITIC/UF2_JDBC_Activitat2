package com.iticbc.isma;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class GestionaBBDD {
    public static boolean creaBBDD(Connection connection, InputStream input) throws IOException, SQLException {

        boolean duplicada = false;

        try (BufferedReader br = new BufferedReader(new InputStreamReader(input));
                Statement statement = connection.createStatement()) {

            StringBuilder sqlBuffer = new StringBuilder();
            String line;

            while ((line = br.readLine()) != null) {
                line = line.trim();

                // Ignorar comentarios y líneas vacías
                if (line.isEmpty() || line.startsWith("--") || line.startsWith("//") || line.startsWith("/*")) {
                    continue;
                }
                sqlBuffer.append(line);

                if (line.endsWith(";")) {
                    String sql = sqlBuffer.toString().replace(";", "").trim();
                    try {
                        statement.execute(sql);
                    } catch (SQLException sqlE) {
                        if (sqlE.getMessage().contains("Duplicate entry")) {
                            duplicada = true;
                        } else {
                            throw sqlE; // Lanzar otras excepciones
                        }
                    }
                    sqlBuffer.setLength(0);
                }
            }
        }
        return duplicada;
    }
}
