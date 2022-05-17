package mx.edu.utez.proyectostruts2.model.cubos;

import mx.edu.utez.proyectostruts2.service.MySQLConnection;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CubeDAO {
    private static final Logger logger = LogManager.getLogger(CubeDAO.class);
    private Connection con;
    private PreparedStatement pstm;
    private ResultSet rs;

    public List<Cube> getCubes() {
        List<Cube> cubes = new ArrayList<>();
        try {
            con = MySQLConnection.getConnection();
            pstm = con.prepareStatement("SELECT `sku`, `name`, `description`, `image` FROM `cube`");
            rs = pstm.executeQuery();
            while (rs.next()) {
                cubes.add(new Cube(
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            logger.error("Error en el método getCubes.");
            e.printStackTrace();
        } finally {
            MySQLConnection.closeConnection(con, pstm, rs);
        }
        return cubes;
    }

    public Cube getCube(String sku) {
        Cube cube = null;
        try {
            con = MySQLConnection.getConnection();
            pstm = con.prepareStatement("SELECT `sku`, `name`, `description`, `image` FROM `cube` WHERE `sku` = ?");
            pstm.setString(1, sku);
            rs = pstm.executeQuery();
            if (rs.next()) {
                cube = new Cube(
                        rs.getString("sku"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image")
                );
            }
        } catch (SQLException e) {
            logger.error("Error en el método getCube.");
            e.printStackTrace();
        } finally {
            MySQLConnection.closeConnection(con, pstm, rs);
        }
        return cube;
    }

    public void postCube(Cube cube) {
        try {
            con = MySQLConnection.getConnection();
            pstm = con.prepareStatement("INSERT INTO `cube` (`sku`, `name`, `description`, `image`) VALUES(?, ?, ?, ?)");
            pstm.setString(1, cube.getSku());
            pstm.setString(2, cube.getName());
            pstm.setString(3, cube.getDescription());
            pstm.setString(4, cube.getImage());
            pstm.execute();
        } catch (SQLException e) {
            logger.error("Error en el método postCube.");
        } finally {
            MySQLConnection.closeConnection(con, pstm);
        }
    }

    public void updateCube(Cube cube, String sku) {
        try {
            con = MySQLConnection.getConnection();
            pstm = con.prepareStatement("UPDATE `cube` SET `sku` = ?, name = ?, `description` = ?, `image` = ? WHERE `sku` = ?");
        } catch (SQLException e) {
            logger.error("Error en el método updateCube.");
        } finally {
            MySQLConnection.closeConnection(con, pstm);
        }
    }

    public void deleteCube(String sku) {
        try {
            con = MySQLConnection.getConnection();
            pstm = con.prepareStatement("DELETE FROM `cube` WHERE `sku` = ?");
        } catch (SQLException e) {
            logger.error("Error en el método deleteCube.");
        } finally {
            MySQLConnection.closeConnection(con, pstm);
        }
    }
}
