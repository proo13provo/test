package Models.UserResigter;

import java.sql.Date;

public class ListRegister {
    private int id;
    private String email;
    private String userPassword;
    private String userName;
    private String phoneNumber;
    private Date birthDate;
    private String companyName;
    private String address;
    private String image;
    private int point;
    private int idFavoriteProduct;
    private int idRole;
    private Date createDate;
    private boolean isActive;

    public ListRegister(int id, String email, String userPassword, String userName, String phoneNumber, Date birthDate, String companyName, String address, String image, int point, int idFavoriteProduct, int idRole, Date createDate, boolean isActive) {
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
}
