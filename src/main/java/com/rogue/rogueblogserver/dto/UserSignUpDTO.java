package com.rogue.rogueblogserver.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserSignUpDTO {
    private String username;
    private String password;
    private String email;
}
