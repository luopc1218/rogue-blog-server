package com.rogue.rogueblogserver.dto;

import lombok.Data;

/**
 * API响应
 *
 * @param <T> 响应数据类型
 */
@Data
public class ApiResponse<T> {
    private int code;

    private String message;

    private T data;

    public ApiResponse(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ApiResponse(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public ApiResponse(int code, T data) {
        this.code = code;
        this.data = data;
    }

    public static <T> ApiResponse<T> success(String message) {
        return new ApiResponse<>(ApiResponseCode.SUCCESS, message);
    }


    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(ApiResponseCode.SUCCESS, data);
    }

    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(ApiResponseCode.SUCCESS, message, data);
    }

    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(ApiResponseCode.ERROR, message, null);
    }

    public static ApiResponse success() {
        return new ApiResponse(ApiResponseCode.SUCCESS, null);
    }
}
