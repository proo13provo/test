package Models.Discount;

import java.sql.Timestamp;

public class Discount {
    private int id;
    private String discountCode;
    private double discountPercentage;
    private double discountAmount;
    private Timestamp startDate;
    private Timestamp endDate;
    private boolean isActive;
    private double minOrderAmount;
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getDiscountCode() { return discountCode; }
    public void setDiscountCode(String discountCode) { this.discountCode = discountCode; }
    public double getDiscountPercentage() { return discountPercentage; }
    public void setDiscountPercentage(double discountPercentage) { this.discountPercentage = discountPercentage; }
    public double getDiscountAmount() { return discountAmount; }
    public void setDiscountAmount(double discountAmount) { this.discountAmount = discountAmount; }
    public Timestamp getStartDate() { return startDate; }
    public void setStartDate(Timestamp startDate) { this.startDate = startDate; }
    public Timestamp getEndDate() { return endDate; }
    public void setEndDate(Timestamp endDate) { this.endDate = endDate; }
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
    public double getMinOrderAmount() { return minOrderAmount; }
    public void setMinOrderAmount(double minOrderAmount) { this.minOrderAmount = minOrderAmount; }

    @Override
    public String toString() {
        return "Discount{" +
                "id=" + id +
                ", discountCode='" + discountCode + '\'' +
                ", discountPercentage=" + discountPercentage +
                ", discountAmount=" + discountAmount +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", isActive=" + isActive +
                ", minOrderAmount=" + minOrderAmount +
                '}';
    }
}
