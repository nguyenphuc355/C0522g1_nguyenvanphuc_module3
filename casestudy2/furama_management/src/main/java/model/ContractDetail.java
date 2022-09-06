package model;

public class ContractDetail {
    private int id;
    private int quantity;
    private int contractId;
    private int attachFacilityId;

    public ContractDetail() {
    }

    public ContractDetail(int id, int quantity, int contractId, int attachFacilityId) {
        this.id = id;
        this.quantity = quantity;
        this.contractId = contractId;
        this.attachFacilityId = attachFacilityId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getAttachFacilityId() {
        return attachFacilityId;
    }

    public void setAttachFacilityId(int attachFacilityId) {
        this.attachFacilityId = attachFacilityId;
    }
}
