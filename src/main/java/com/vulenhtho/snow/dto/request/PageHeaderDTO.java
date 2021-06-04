package com.vulenhtho.snow.dto.request;

import com.vulenhtho.snow.dto.CategoryDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class PageHeaderDTO {

    private List<CategoryDTO> categoryDTOS = new ArrayList<>();

    private List<String> discounts = new ArrayList<>();
}
