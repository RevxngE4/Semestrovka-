package model;

public class Product {
    private int id;
    private String name;
    private String category;
    private Double price;
    private String image;

    public Product() {

    }

    public Product(int id, String name, String category, Double price, String image) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
    }

    public Product(String name, String category, double price, String fileName) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = fileName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

   public Double getPrice() {
        return price;
   }


   public void setPrice(Double price) {
        this.price = price;
   }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
