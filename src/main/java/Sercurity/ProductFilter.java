package Sercurity;

public class ProductFilter {
    private String searchQuery;
    private String category;
    private Double minPrice;
    private Double maxPrice;
    private String sortBy;
    private String sortOrder;

    // Constructors
    public ProductFilter() {}

    // Getters and Setters
    public String getSearchQuery() { return searchQuery; }
    public void setSearchQuery(String searchQuery) { this.searchQuery = searchQuery; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public Double getMinPrice() { return minPrice; }
    public void setMinPrice(Double minPrice) { this.minPrice = minPrice; }

    public Double getMaxPrice() { return maxPrice; }
    public void setMaxPrice(Double maxPrice) { this.maxPrice = maxPrice; }

    public String getSortBy() { return sortBy; }
    public void setSortBy(String sortBy) { this.sortBy = sortBy; }

    public String getSortOrder() { return sortOrder; }
    public void setSortOrder(String sortOrder) { this.sortOrder = sortOrder; }
}
