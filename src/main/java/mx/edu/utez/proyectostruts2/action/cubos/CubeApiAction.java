package mx.edu.utez.proyectostruts2.action.cubos;

import com.opensymphony.xwork2.ActionSupport;
import mx.edu.utez.proyectostruts2.model.cubos.Cube;
import mx.edu.utez.proyectostruts2.model.cubos.CubeDAO;
import mx.edu.utez.proyectostruts2.utils.Message;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

public class CubeApiAction extends ActionSupport {
    private Cube cube;
    private String sku;
    private Message message;

    public String executeCubeRegister() {
        if (new CubeDAO().postCube(cube)) {
            message = new Message(false, "Cubo registrado.");
        } else {
            message = new Message(true, "Error al registrar el cubo.");
        }
        return SUCCESS;
    }

    public String executeCubeUpdate() {
        return SUCCESS;
    }

    public String executeCubeDelete() {
        if (new CubeDAO().deleteCube(sku)) {
            message = new Message(false, "Cubo eliminado.");
        } else {
            message = new Message(true, "Error al eliminar el cubo.");
        }
        return SUCCESS;
    }

    public String executeCube() {
        Cube cube = new CubeDAO().getCube(sku);
        message = cube != null ? new Message(false, "OK", cube) : new Message(true, "Cubo no encontrado.");
        return SUCCESS;
    }

    public void setCube(Cube cube) {
        this.cube = cube;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public Message getMessage() {
        return message;
    }
}
