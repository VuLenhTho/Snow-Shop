package com.vulenhtho.snow.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DiscountDTO {
    private Long id;

    private String name;

    private Long percent;

    private Long amount;

    private String content;

    private String startDate;

    private String endDate;

    private Boolean isForProduct;
}
