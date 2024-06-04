package com.rogue.rogueblogserver.service;

import com.rogue.rogueblogserver.dto.UserSignUpDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rogue.rogueblogserver.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void signUp(UserSignUpDTO userSignUpDTO) {

    }
}