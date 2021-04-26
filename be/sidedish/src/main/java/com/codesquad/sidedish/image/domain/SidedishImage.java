package com.codesquad.sidedish.image.domain;

import org.springframework.data.annotation.Id;

public class SidedishImage {
    @Id
    private Long id;

    private String imageUrl;

    protected SidedishImage() {
    }

    public SidedishImage(String imageUrl) {
        this.imageUrl = imageUrl;
    }


    public Long getId() {
        return id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    @Override
    public String toString() {
        return "SidedishImage{" +
                "id=" + id +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}
