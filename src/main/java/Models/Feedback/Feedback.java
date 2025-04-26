package Models.Feedback;

import java.util.Date;
import java.util.List;

public class Feedback {
    private String comment;
    private Date createDate;
    private int ratingRank;
    private String status;
    private String nameProduct;
    private String userName;
    private Date birthDate;
    private String phoneNumber;
    private List<String> reviewImages;

    public Feedback() {
    }

    public List<String> getReviewImages() {
        return reviewImages;
    }

    public void setReviewImages(List<String> reviewImages) {
        this.reviewImages = reviewImages;
    }

    public Feedback(String comment, Date createDate, int ratingRank, String status, String nameProduct, String userName, Date birthDate, String phoneNumber, List<String> reviewImages) {
        this.comment = comment;
        this.createDate = createDate;
        this.ratingRank = ratingRank;
        this.status = status;
        this.nameProduct = nameProduct;
        this.userName = userName;
        this.birthDate = birthDate;
        this.phoneNumber = phoneNumber;
        this.reviewImages = reviewImages;
    }

    // Getter và Setter cho comment
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    // Getter và Setter cho createDate
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    // Getter và Setter cho ratingRank
    public int getRatingRank() {
        return ratingRank;
    }

    public void setRatingRank(int ratingRank) {
        this.ratingRank = ratingRank;
    }

    // Getter và Setter cho status
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Getter và Setter cho nameProduct
    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    // Getter và Setter cho userName
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    // Getter và Setter cho birthDate
    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    // Getter và Setter cho phoneNumber
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "comment='" + comment + '\'' +
                ", createDate=" + createDate +
                ", ratingRank=" + ratingRank +
                ", status='" + status + '\'' +
                ", nameProduct='" + nameProduct + '\'' +
                ", userName='" + userName + '\'' +
                ", birthDate=" + birthDate +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", reviewImages=" + reviewImages +
                '}';
    }
}
