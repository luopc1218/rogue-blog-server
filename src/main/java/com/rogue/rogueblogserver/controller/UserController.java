package com.rogue.rogueblogserver.controller;

import com.rogue.rogueblogserver.dto.UserSignUpDTO;
import com.rogue.rogueblogserver.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.rogue.rogueblogserver.dto.ApiResponse;


@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public ApiResponse signUp(@RequestBody UserSignUpDTO userSignUpDTO) {
        try {
            userService.signUp(userSignUpDTO);
            return ApiResponse.success();
        } catch (Exception e) {
            return ApiResponse.error(e.getMessage());
        }
    }
}
