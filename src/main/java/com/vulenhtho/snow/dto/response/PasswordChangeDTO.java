package com.vulenhtho.snow.dto.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PasswordChangeDTO {

    private String currentPassword;

    private String newPassword;
}
