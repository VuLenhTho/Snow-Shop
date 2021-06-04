package com.vulenhtho.snow.dto.request;

import com.vulenhtho.snow.dto.enumeration.BillStatus;
import com.vulenhtho.snow.dto.enumeration.PaymentMethod;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShortInfoBillDTO {

    private Long id;

    private String receiver;

    private String phone;

    private String createdDate;

    private Long finalPayMoney;

    private String vnFinalPayMoney;

    private PaymentMethod paymentMethod;

    private BillStatus status;
}
