package com.codesquad.sidedish.category.domain;

import org.springframework.data.annotation.Id;

public class SidedishItem {
    @Id
    private Long id;

    private String itemName;
    private String itemDescription;
    private int itemSalePrice;
    private int itemNormalPrice;
    private int itemQuantity;
    private int itemPointRate;
    private String itemDeliveryInfo;
    private String itemDeliveryFee;

    public SidedishItem(String itemName, String itemDescription, int itemSalePrice, int itemNormalPrice, int itemQuantity, int itemPointRate, String itemDeliveryInfo, String itemDeliveryFee) {
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.itemSalePrice = itemSalePrice;
        this.itemNormalPrice = itemNormalPrice;
        this.itemQuantity = itemQuantity;
        this.itemPointRate = itemPointRate;
        this.itemDeliveryInfo = itemDeliveryInfo;
        this.itemDeliveryFee = itemDeliveryFee;
    }

    protected SidedishItem() {
    }

    public Long getId() {
        return id;
    }

    public String getItemName() {
        return itemName;
    }

    public String getItemDescription() {
        return itemDescription;
    }

    public int getItemSalePrice() {
        return itemSalePrice;
    }

    public int getItemNormalPrice() {
        return itemNormalPrice;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }

    public int getPointRate() {
        return itemPointRate;
    }

    public String getItemDeliveryInfo() {
        return itemDeliveryInfo;
    }

    public String getItemDeliveryFee() {
        return itemDeliveryFee;
    }

    @Override
    public String toString() {
        return "SidedishItem{" +
                "id=" + id +
                ", itemName='" + itemName + '\'' +
                ", itemDescription='" + itemDescription + '\'' +
                ", itemSalePrice=" + itemSalePrice +
                ", itemNormalPrice=" + itemNormalPrice +
                ", itemQuantity=" + itemQuantity +
                ", pointRate=" + itemPointRate +
                ", itemDeliveryInfo='" + itemDeliveryInfo + '\'' +
                ", itemDeliveryFee='" + itemDeliveryFee + '\'' +
                '}';
    }
}