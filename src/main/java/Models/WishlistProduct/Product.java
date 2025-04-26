package Models.WishlistProduct;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable {
    public int id;
    public String img;
    public String name;
    public Date date;

    public Product(int id, String img, String name, Date date) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.date = date;
    }



    public String getImg() {
        return img;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", date=" + date +
                '}';
    }
}
