package com.techlearn.techlearn_api;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

@Service
public class SessaoService {

    private final Map<String, Long> sessoes = new ConcurrentHashMap<>();

    public String criar(Long usuarioId) {
        String token = UUID.randomUUID().toString();
        sessoes.put(token, usuarioId);
        return token;
    }

    public Long buscarUsuarioId(String token) {
        if (token == null) {
            return null;
        }
        return sessoes.get(token);
    }

    public void remover(String token) {
        if (token != null) {
            sessoes.remove(token);
        }
    }
}