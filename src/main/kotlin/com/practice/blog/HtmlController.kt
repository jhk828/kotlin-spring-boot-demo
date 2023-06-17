package com.practice.blog

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.GetMapping

@Controller
class HtmlController {

    @GetMapping("/")
    fun blog(model: Model): String {
        println("hello!!")
        model["title"] = "Blog"
//        model.addAttribute("title", "Blog")
        return "blog"
    }

}