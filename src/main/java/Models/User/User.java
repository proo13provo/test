package Models.User;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private int id;
    private String email;
    private String userPassword;
    private String userName;
    private String phoneNumber;

    public User(String email, String userPassword, String userName,String phoneNumber) {
        this.email = email;
        this.userPassword = userPassword;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userName='" + userName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", birthDate=" + birthDate +
                ", companyName='" + companyName + '\'' +
                ", address='" + address + '\'' +
                ", image='" + image + '\'' +
                ", point=" + point +
                ", idFavoriteProduct=" + idFavoriteProduct +
                ", idRole=" + idRole +
                ", createDate=" + createDate +
                ", isActive=" + isActive +
                '}';
    }

    private Date birthDate;
    private String companyName;
    private String address;
    private String image;
    private int point;
    private int idFavoriteProduct;
    private int idRole;
    private Date createDate;
    private boolean isActive;

    public User() {}

    public User(int id, String email, String userPassword, String userName, String phoneNumber, Date birthDate, String companyName, String address, String image, int point, int idFavoriteProduct, int idRole, Date createDate, boolean isActive) {
        this.id = id;
        this.email = email;
        this.userPassword = userPassword;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
        this.companyName = companyName;
        this.address = address;
        this.image = image;
        this.point = point;
        this.idFavoriteProduct = idFavoriteProduct;
        this.idRole = idRole;
        this.createDate = createDate;
        this.isActive = isActive;
    }

    public User( String email,  String userName, String phoneNumber, Date birthDate, String address, String image,  Date createDate) {
        this.email = email;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.birthDate = birthDate;
        this.address = address;
        this.image = image;
        this.createDate = createDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getIdFavoriteProduct() {
        return idFavoriteProduct;
    }

    public void setIdFavoriteProduct(int idFavoriteProduct) {
        this.idFavoriteProduct = idFavoriteProduct;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public User(String email, String userName, String image, int idRole) {
        this.email = email;
        this.userName = userName;
        this.image = image;
        this.idRole = idRole;
    }
}
