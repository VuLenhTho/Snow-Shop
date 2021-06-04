package com.vulenhtho.snow.service;

import com.vulenhtho.snow.dto.response.BillFilterResponse;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public interface BillService {

    ModelAndView getListBill(BillFilterResponse billFilterResponse);

    ModelAndView update(Long id);

    String deletes(HttpServletRequest request);

    ModelAndView getReportByMonthAndYear(Integer month, Integer year);

    ModelAndView getReportByYear(Integer year);

}
