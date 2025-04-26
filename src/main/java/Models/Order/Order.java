package Models.Order;

import java.time.LocalDateTime;
import java.util.Date;

public class Order {
    private int id;
    private int idUser;
    private int totalPrice;
    private boolean isPaid;
    private Date createDate;
    private Date receiveDate;
    private String receiveAddress;
    private boolean isActive;
    private int idShipping;

    public Order(int id, int idUser, int totalPrice, boolean isPaid, Date createDate, Date receiveDate, String receiveAddress, boolean isActive, int idShipping) {
        this.id = id;
        this.idUser = idUser;
        this.totalPrice = totalPrice;
        this.isPaid = isPaid;
        this.createDate = createDate;
        this.receiveDate = receiveDate;
        this.receiveAddress = receiveAddress;
        this.isActive = isActive;
        this.idShipping = idShipping;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean isPaid() {
        return isPaid;
    }

    public void setPaid(boolean paid) {
        isPaid = paid;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(Date receiveDate) {
        this.receiveDate = receiveDate;
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public int getIdShipping() {
        return idShipping;
    }

    public void setIdShipping(int idShipping) {
        this.idShipping = idShipping;
    }
}

