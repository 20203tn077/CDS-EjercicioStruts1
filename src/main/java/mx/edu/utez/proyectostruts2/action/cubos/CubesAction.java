package mx.edu.utez.proyectostruts2.action.cubos;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import mx.edu.utez.proyectostruts2.model.cubos.Cube;
import mx.edu.utez.proyectostruts2.model.cubos.CubeDAO;

import java.util.List;

public class CubesAction extends ActionSupport {
    private String sku;
    private Cube cube;
    private String cubes;

    public String executeCubeList() {
        try {
            cubes = new ObjectMapper().writeValueAsString(new CubeDAO().getCubes());
        } catch (JsonProcessingException e) {
            return ERROR;
        }
        return SUCCESS;
    }

    public Cube getCube() {
        cube = new CubeDAO().getCube("CB-01");
        return cube;
    }

    public String getCubes() {
        return cubes;
    }

    public void setCube(Cube cube) {
        this.cube = cube;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }
}
