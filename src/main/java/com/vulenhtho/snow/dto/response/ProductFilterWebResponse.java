package com.vulenhtho.snow.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductFilterWebResponse {

    private String search;

    private String sort;

    private String subCategoryId;
}
