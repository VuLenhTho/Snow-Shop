package com.vulenhtho.snow.dto.request;

import com.vulenhtho.snow.dto.ProductDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReportByMonthAndYearDTO {

    private Integer year;

    private Integer month;

    private Long importMoney;

    private Long interestMoney;

    private Long moneyFromSale;

    private String vnImportMoney;

    private String vnInterestMoney;

    private String vnMoneyFromSale;

    private List<ProductInfoToReportDTO> bestsellerProduct = new ArrayList<>();

    private List<ProductInfoToReportDTO> badSellerProduct = new ArrayList<>();

    private List<ProductDTO> totalProduct = new ArrayList<>();

    private Map<Integer, Long> interestPerMonth = new HashMap<>();

    private Map<Integer, Long> importPerMonth = new HashMap<>();

    private Map<Integer, Long> moneyFromSalePerMonth = new HashMap<>();
}
