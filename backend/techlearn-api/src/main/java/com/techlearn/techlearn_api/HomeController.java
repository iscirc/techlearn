
package com.techlearn.techlearn_api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String inicio() {
        return "TechLearn API funcionando!";
    }
}
