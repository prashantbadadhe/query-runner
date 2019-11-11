package com.njit.dmsd.service;

import java.util.List;

import com.njit.dmsd.dto.UserDto;

/**
 * Created by ashish on 13/5/17.
 */
public interface UserService {
    UserDto getUserById(Integer userId);
    void saveUser(UserDto userDto);
    List<UserDto> getAllUsers();
}
