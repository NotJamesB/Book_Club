package com.codingdojo.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class LoginController {
    
    // Add once service is implemented:
     @Autowired
     private UserService userServ;
     
     @Autowired
     private BookService bServ;
    
    @GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	User user = userServ.register(newUser, result);
    	
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
         User user = userServ.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
    	if(session.getAttribute("userId")==null)
    	{
    		return "redirect:/logout";
    		}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.findById(userId));
    	model.addAttribute("books", bServ.allBooks());
    	return "home.jsp";
    	}
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.setAttribute("userId", null);
   return "redirect:/";
    }
    
    @GetMapping("/createBook")
	public String createBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		User user = userServ.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "newBook.jsp";
		
	}
    @PostMapping("/book/create")
    public String newBook(@Valid @ModelAttribute("book")Book book, BindingResult result) {
    	if(result.hasErrors()) {
    		return "redirect:/createBook";
    	}
    	bServ.create(book);
    	return "redirect:/home";
    }
    @GetMapping("/book/{id}")
    public String showBook(@PathVariable("id")Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId")==null)
    	{
    		return "redirect:/logout";
    		}
    	Book book = bServ.findById(id);
    	model.addAttribute("book", book);
    	model.addAttribute("user", userServ.findById((Long)session.getAttribute("userId")));
    	return "showBook.jsp";
    }
    	
    }
    
