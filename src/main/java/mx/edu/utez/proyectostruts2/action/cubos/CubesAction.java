package mx.edu.utez.proyectostruts2.action.cubos;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import mx.edu.utez.proyectostruts2.model.cubos.Cube;
import mx.edu.utez.proyectostruts2.model.cubos.CubeDAO;

import java.util.List;

public class CubesAction extends ActionSupport {
    private String cubes;

    public String executeCubeList() {
        try {
            cubes = new ObjectMapper().writeValueAsString(new CubeDAO().getCubes());
        } catch (JsonProcessingException e) {
            return ERROR;
        }
        return SUCCESS;
    }

    public String getCubes() {
        return cubes;
    }
}
