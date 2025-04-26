package Models.OrderManage;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    public int id;
    public int idUser;
    public String nameUser;

    public String getNameUser() {
        return nameUser;
    }

    public int totalPrice;
    public boolean isPaid;
    public Date createDate;
    public String receiveAddress;
    public int isActive;
    public String productName;
    public String state;

    public String getState() {
        return state;
    }

    public String getProductName() {
        return productName;
    }
public String getStateisActive(int isActive){
        if(isActive == 1){
            return "Chưa hoàn thành";
        }else if(isActive == 2){
            return "Đang giao hàng";
        }else if(isActive == 3){
            return  "Hoàn thành";
    }else{
            return "Đã huỷ";
    }
}

    public Order(int id, int idUser, int totalPrice, boolean isPaid, Date createDate, String receiveAddress, int isActive, String productName,String nameUser) {
        this.id = id;
        this.idUser = idUser;
        this.totalPrice = totalPrice;
        this.isPaid = isPaid;
        this.createDate = createDate;
        this.state = getStateisActive(isActive);

        this.receiveAddress = receiveAddress;
        this.isActive = isActive;
        this.productName = productName;
        this.nameUser = nameUser;
    }

    public int getId() {
        return id;
    }

    public int getIdUser() {
        return idUser;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public boolean isPaid() {
        return isPaid;
    }

    public Date getCreateDate() {
        return createDate;
    }


    public String getReceiveAddress() {
        return receiveAddress;
    }

    public int getIsActive() {
        return isActive;
    }
}
