package Models.Supplier;

public class SupplierDetail {
    public int idSupplier;
    public String nameSupplier;

    public int getId() {
        return idSupplier;
    }

    public String getName() {
        return nameSupplier;
    }

    public SupplierDetail(int idSupplier, String nameSupplier) {
        this.idSupplier = idSupplier;
        this.nameSupplier = nameSupplier;
    }
}
