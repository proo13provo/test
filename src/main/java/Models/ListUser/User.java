package Models.ListUser;

import java.io.Serializable;

public class User implements Serializable {
    public int id;
    public String email;
    public String name;
    public String address;
    public String phoneNumber;
    public String birtDate;
    public String createDate;
    public int idRole;
    public boolean isActive;
    public String state;
    public String role;

    public String getRole() {
        return role;
    }

    public String checkisActive(boolean isActive){
        if(isActive){
            return "Đang hoạt động";
        }else{
            return "Đã khoá";
        }
    }
    public String checkRole(int idRole){
        if(idRole == 1){
            return "Admin";
        }
        return "Customer";
    }
    public User(int id, String email, String name, String address, String phoneNumber, String birtDate, String createDate, int idRole, boolean isActive) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.birtDate = birtDate;
        this.createDate = createDate;
        this.idRole = idRole;
        this.isActive = isActive;
        this.state = checkisActive(isActive);
        this.role = checkRole(idRole);
    }


    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getBirtDate() {
        return birtDate;
    }

    public String getCreateDate() {
        return createDate;
    }

    public int getIdRole() {
        return idRole;
    }

    public boolean isActive() {
        return isActive;
    }

    public String getState() {
        return state;
    }
}
