package mx.edu.utez.proyectostruts2.model.cubos;

public class Cube {
    private int id;
    private String sku;
    private String name;
    private String description;
    private String image;
    private String image2;

    public Cube() {
    }

    public Cube(int id, String sku, String name, String description, String image, String image2) {
        this.id = id;
        this.sku = sku;
        this.name = name;
        this.description = description;
        this.image = image;
        this.image2 = image2;
    }

    public Cube(String sku, String name, String description, String image, String image2) {
        this.sku = sku;
        this.name = name;
        this.description = description;
        this.image = image;
        this.image2 = image2;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }
}
