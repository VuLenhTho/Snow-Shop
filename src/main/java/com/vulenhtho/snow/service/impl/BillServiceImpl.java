package com.vulenhtho.snow.service.impl;

import com.vulenhtho.snow.config.APIConstant;
import com.vulenhtho.snow.config.Constant;
import com.vulenhtho.snow.dto.BillDTO;
import com.vulenhtho.snow.dto.enumeration.BillStatus;
import com.vulenhtho.snow.dto.enumeration.PaymentMethod;
import com.vulenhtho.snow.dto.request.PageBillsRequest;
import com.vulenhtho.snow.dto.request.ReportByMonthAndYearDTO;
import com.vulenhtho.snow.dto.response.BillFilterResponse;
import com.vulenhtho.snow.service.BillService;
import com.vulenhtho.snow.service.SecurityService;
import com.vulenhtho.snow.util.CommonUtils;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class BillServiceImpl implements BillService {

    private final RestTemplate restTemplate;

    private final SecurityService securityService;


    public BillServiceImpl(RestTemplate restTemplate, SecurityService securityService) {
        this.restTemplate = restTemplate;
        this.securityService = securityService;
    }

    @Override
    public ModelAndView update(Long id) {
        ModelAndView modelAndView = new ModelAndView("/admin/bill/bill-update");
        BillDTO bill = restTemplate.exchange(APIConstant.ADMIN_URI + "/bill?id=" + id.toString(),
                HttpMethod.GET,
                new HttpEntity<BillDTO>(securityService.getHeadersWithToken()), BillDTO.class).getBody();

        bill.setVnFinalPayMoney(CommonUtils.convertToVnCurrency(bill.getFinalPayMoney()));
        String createdDate = bill.getCreatedDate().substring(0, 10) + " " + bill.getCreatedDate().substring(11, 19);
        String modifiedDate = bill.getLastModifiedDate().substring(0, 10) + " " + bill.getLastModifiedDate().substring(11, 19);
        bill.setCreatedDate(createdDate);
        bill.setLastModifiedDate(modifiedDate);
        bill.setVnStatus(mapBillStatus(bill.getStatus()));
        bill.getItemDTOS().forEach(itemDTO -> {
            itemDTO.setVnPrice(CommonUtils.convertToVnCurrency(itemDTO.getPrice()));
            itemDTO.setVnTotalPrice(CommonUtils.convertToVnCurrency(itemDTO.getPrice() * itemDTO.getQuantity()));
        });
        modelAndView.addObject("bill", bill);
        if (PaymentMethod.PAY_BY_TRANSFER.equals(bill.getPaymentMethod()) && bill.getPaymentInfo() != null) {
            List<String> paymentInfo = Arrays.stream(bill.getPaymentInfo().split(",")).collect(Collectors.toList());
            modelAndView.addObject("accName", paymentInfo.get(0));
            modelAndView.addObject("accNumber", paymentInfo.get(1));
            modelAndView.addObject("tradingCode", paymentInfo.get(2));
        }
        modelAndView.addObject("token", securityService.getToken());
        return modelAndView;
    }


    @Override
    public String deletes(HttpServletRequest request) {
        String idString = request.getParameter("billIds");
        if (StringUtils.isEmpty(idString)) {
            return Constant.CRUD_RESULT.NOT_FOUND;
        }
        List<Long> billIds = Arrays.stream(idString.split(",")).map(Long::parseLong).collect(Collectors.toList());
        ResponseEntity<String> deletes = restTemplate.exchange(APIConstant.ADMIN_URI + "/bills", HttpMethod.DELETE
                , new HttpEntity<>(billIds, securityService.getHeadersWithToken()), new ParameterizedTypeReference<String>() {
                });
        if (HttpStatus.OK.equals(deletes.getStatusCode())) {
            return Constant.CRUD_RESULT.SUCCESS;
        } else {
            return Constant.CRUD_RESULT.ERROR;
        }
    }

    @Override
    public ModelAndView getListBill(BillFilterResponse billFilterResponse) {
        ModelAndView mav = new ModelAndView("admin/bill/bill-list");
        String url = APIConstant.ADMIN_URI + "/bills?page=" + (billFilterResponse.getPage() - 1) + "&size=" + billFilterResponse.getSize();

        if (!"all".equals(billFilterResponse.getPaymentMethod())) {
            url += "&paymentMethod=" + billFilterResponse.getPaymentMethod();
        }
        if (!"all".equals(billFilterResponse.getStatus())) {
            url += "&status=" + billFilterResponse.getStatus();
        }
        if (!"all".equals(billFilterResponse.getSort())) {
            url += "&sort=" + billFilterResponse.getSort();
        }

        if (!StringUtils.isEmpty(billFilterResponse.getSearch())) url += "&search=" + billFilterResponse.getSearch();

        PageBillsRequest bills = restTemplate.exchange(url,
                HttpMethod.GET,
                new HttpEntity<PageBillsRequest>(securityService.getHeadersWithToken()), PageBillsRequest.class).getBody();

        bills.getBillDTOS().forEach(bill -> {
            bill.setVnFinalPayMoney(CommonUtils.convertToVnCurrency(bill.getFinalPayMoney()));
            bill.setCreatedDate(bill.getCreatedDate().substring(0, 10));
        });

        mav.addObject("data", bills);
        mav.addObject("filter", billFilterResponse);
        return mav;
    }

    private String mapBillStatus(BillStatus statusCode) {
        switch (statusCode) {
            case INIT:
                return "Đơn mới";
            case CHECKING:
                return "Đang kiểm tra";
            case CONFIRMED:
                return "Đã xác nhận";
            case RETURNED:
                return "Bị trả lại";
            case SHIPPING:
                return "Đang vận chuyển";
            case FINISH:
                return "Hoàn thành";

            default:
                return null;
        }
    }

    @Override
    public ModelAndView getReportByMonthAndYear(Integer month, Integer year) {
        ModelAndView modelAndView = new ModelAndView("/admin/report/report-by-month-and-year");
        ReportByMonthAndYearDTO reportByMonthAndYearDTO = restTemplate.exchange(APIConstant.ADMIN_URI + "/bill/reportByMonthAndYear?month=" + month + "&year=" + year,
                HttpMethod.GET, new HttpEntity<ReportByMonthAndYearDTO>(securityService.getHeadersWithToken()), ReportByMonthAndYearDTO.class).getBody();

        reportByMonthAndYearDTO.setVnImportMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getImportMoney()));
        reportByMonthAndYearDTO.setVnInterestMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getInterestMoney()));
        reportByMonthAndYearDTO.setVnMoneyFromSale(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getMoneyFromSale()));
        modelAndView.addObject("reportData", reportByMonthAndYearDTO);

        return modelAndView;
    }

    @Override
    public ModelAndView getReportByYear(Integer year) {
        ModelAndView modelAndView = new ModelAndView("/admin/report/report-by-year");
        ReportByMonthAndYearDTO reportByMonthAndYearDTO = restTemplate.exchange(APIConstant.ADMIN_URI + "/bill/reportByYear?year=" + year,
                HttpMethod.GET, new HttpEntity<ReportByMonthAndYearDTO>(securityService.getHeadersWithToken()), ReportByMonthAndYearDTO.class).getBody();

        reportByMonthAndYearDTO.setVnImportMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getImportMoney()));
        reportByMonthAndYearDTO.setVnInterestMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getInterestMoney()));
        reportByMonthAndYearDTO.setVnMoneyFromSale(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getMoneyFromSale()));
        modelAndView.addObject("reportData", reportByMonthAndYearDTO);

        Map<Integer, Long> interestPerMonth = reportByMonthAndYearDTO.getInterestPerMonth();
        Map<Integer, Long> importPerMonth = reportByMonthAndYearDTO.getImportPerMonth();
        Map<Integer, Long> moneyFromSalePerMonth = reportByMonthAndYearDTO.getMoneyFromSalePerMonth();

        List<Long> interest1To7 = new ArrayList<>();
        List<Long> importMoney1To7 = new ArrayList<>();
        List<Long> totalSale1To7 = new ArrayList<>();
        for (int i = 1; i < 8; i++) {
            interest1To7.add(interestPerMonth.get(i));
            importMoney1To7.add(importPerMonth.get(i));
            totalSale1To7.add(moneyFromSalePerMonth.get(i));
        }
        List<Long> interest7To12 = new ArrayList<>();
        List<Long> importMoney7To12 = new ArrayList<>();
        List<Long> totalSale7To12 = new ArrayList<>();
        for (int i = 7; i < 13; i++) {
            interest7To12.add(interestPerMonth.get(i));
            importMoney7To12.add(importPerMonth.get(i));
            totalSale7To12.add(moneyFromSalePerMonth.get(i));
        }
        modelAndView.addObject("interest1To7", interest1To7);
        modelAndView.addObject("importMoney1To7", importMoney1To7);
        modelAndView.addObject("totalSale1To7", totalSale1To7);

        modelAndView.addObject("interest7To12", interest7To12);
        modelAndView.addObject("importMoney7To12", importMoney7To12);
        modelAndView.addObject("totalSale7To12", totalSale7To12);
        return modelAndView;

    }

    @Override
    public ModelAndView getReportByRangeDate(Long startTime, Long endTime, String dateValue) {
        ModelAndView modelAndView = new ModelAndView("/admin/report/report-by-range-date");
        ReportByMonthAndYearDTO reportByMonthAndYearDTO = restTemplate.exchange(APIConstant.ADMIN_URI
                        + "/bill/reportByRangeDate?startTime=" + startTime + "&endTime=" + endTime,
                HttpMethod.GET, new HttpEntity<ReportByMonthAndYearDTO>(securityService.getHeadersWithToken()), ReportByMonthAndYearDTO.class).getBody();

        reportByMonthAndYearDTO.setVnImportMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getImportMoney()));
        reportByMonthAndYearDTO.setVnInterestMoney(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getInterestMoney()));
        reportByMonthAndYearDTO.setVnMoneyFromSale(CommonUtils.convertToVnCurrency(reportByMonthAndYearDTO.getMoneyFromSale()));
        modelAndView.addObject("reportData", reportByMonthAndYearDTO);
        modelAndView.addObject("dateValue", dateValue);
        modelAndView.addObject("totalProduct", reportByMonthAndYearDTO.getTotalProduct().size());

        Long tongQuanJeans = reportByMonthAndYearDTO.getTotalProduct()
                .stream()
                .filter(productDTO -> productDTO.getSubCategoryDTO().getId().equals(3L)).count();
        modelAndView.addObject("tongQuanJeans", tongQuanJeans);

        Long tongAoPhong = reportByMonthAndYearDTO.getTotalProduct()
                .stream()
                .filter(productDTO -> productDTO.getSubCategoryDTO().getId().equals(1L)).count();
        modelAndView.addObject("tongAoPhong", tongAoPhong);

        Long tongQuanBaggy = reportByMonthAndYearDTO.getTotalProduct()
                .stream()
                .filter(productDTO -> productDTO.getSubCategoryDTO().getId().equals(9L)).count();
        modelAndView.addObject("tongQuanBaggy", tongQuanBaggy);

        Long tongVayLienThan = reportByMonthAndYearDTO.getTotalProduct()
                .stream()
                .filter(productDTO -> productDTO.getSubCategoryDTO().getId().equals(5L)).count();
        modelAndView.addObject("tongVayLienThan", tongVayLienThan);

        Long tongChanVay = reportByMonthAndYearDTO.getTotalProduct()
                .stream()
                .filter(productDTO -> productDTO.getSubCategoryDTO().getId().equals(2L)).count();
        modelAndView.addObject("tongChanVay", tongChanVay);
        return modelAndView;
    }
}
