package com.vulenhtho.snow.controller.admin;

import com.vulenhtho.snow.service.BillService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalUnit;
import java.util.Calendar;

@Controller
@RequestMapping("/admin")
public class ReportController {

    private final BillService billService;

    public ReportController(BillService billService) {
        this.billService = billService;
    }

    @GetMapping("/reportByMonthAndYear")
    public ModelAndView getReportByMonthAndYear(@RequestParam(required = false) Integer month, @RequestParam(required = false) Integer year) {
        if (month == null || year == null) {
            Calendar calendar = Calendar.getInstance();
            year = calendar.get(Calendar.YEAR);
            month = calendar.get(Calendar.MONTH) + 1;
        }
        return billService.getReportByMonthAndYear(month, year);
    }

    @GetMapping("/reportByYear")
    public ModelAndView getReportByYear(@RequestParam(required = false) Integer year) {
        if (year == null) {
            Calendar calendar = Calendar.getInstance();
            year = calendar.get(Calendar.YEAR);
        }
        return billService.getReportByYear(year);
    }

    @GetMapping("/reportByRangeDate")
    public ModelAndView getReportByYear(@RequestParam(required = false) String daterange) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        if (StringUtils.hasText(daterange)){
            String startDate = daterange.substring(0,10);
            String endDate = daterange.substring(13,23);

            LocalDate start = LocalDate.parse(startDate, formatter);
            LocalDate end = LocalDate.parse(endDate, formatter);
            Long milliStart = start.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
            Long milliEnd = end.atTime(23,59,59).atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
            return billService.getReportByRangeDate(milliStart, milliEnd, daterange);

        } else {
            Long milliStart = LocalDate.now().minusMonths(1)
                    .atTime(LocalTime.MIN).atZone(ZoneOffset.systemDefault()).toInstant().toEpochMilli();
            Long milliEnd = Instant.now().toEpochMilli();
            String dateValue = LocalDate.now().minusMonths(1).format(formatter) + " - " + LocalDate.now().format(formatter);
            return billService.getReportByRangeDate(milliStart, milliEnd, dateValue);
        }


    }
}
