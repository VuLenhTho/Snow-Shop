package com.vulenhtho.snow.service;

import com.vulenhtho.snow.dto.response.ChangeUserAndResult;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
    ChangeUserAndResult updateByAdmin(HttpServletRequest request);

    ChangeUserAndResult createByAdmin(HttpServletRequest request);

    String deletesByAdmin(HttpServletRequest request);

    boolean isLogged();

    boolean isAdmin();
}
