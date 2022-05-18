package mx.edu.utez.proyectostruts2.utils;

import java.util.Map;

public class Message {
    private boolean error;
    private String status;
    private Map<String, String> errors;
    private Object data;

    public Message(boolean error, String status, Map<String, String> errors, Object data) {
        this.error = error;
        this.status = status;
        this.errors = errors;
    }

    public Message(boolean error, String status, Map<String, String> errors) {
        this.error = error;
        this.status = status;
        this.errors = errors;
    }

    public Message(boolean error, String status, Object data) {
        this.error = error;
        this.status = status;
        this.data = data;
    }

    public Message(boolean error, String status) {
        this.error = error;
        this.status = status;
    }

    public boolean isError() {
        return error;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Map<String, String> getErrors() {
        return errors;
    }

    public void setErrors(Map<String, String> errors) {
        this.errors = errors;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
