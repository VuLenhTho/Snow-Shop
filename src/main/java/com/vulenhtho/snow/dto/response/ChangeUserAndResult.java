package com.vulenhtho.snow.dto.response;

import com.vulenhtho.snow.dto.UserDTO;
import lombok.Data;

@Data
public class ChangeUserAndResult {
    private UserDTO userDTO;

    private String result;
}
