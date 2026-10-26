package com.techlearn.techlearn_api;

import org.springframework.http.HttpStatus;

public class ChatbotException extends RuntimeException {

    private final HttpStatus status;

    public ChatbotException(HttpStatus status, String mensagem) {
        super(mensagem);
        this.status = status;
    }

    public HttpStatus getStatus() {
        return status;
    }
}