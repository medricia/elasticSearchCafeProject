package com.projcafe.cafe.elastic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.projcafe.cafe.elastic.configuration.document.Person;
import com.projcafe.cafe.elastic.service.PersonService;

@RestController
@RequestMapping("/api/person")
public class PersonController {
	private final PersonService service;
	
	@Autowired
	public PersonController(PersonService service) {
		this.service = service;
	}
	
	@GetMapping("/person")
	public String saveperson(@RequestParam String name,@RequestParam String Id) {
		Person person = new Person();
		person.setName(name);
		person.setId(Id);
		service.save(person);
		return "Received name: " + name;
	}
	
	@GetMapping("/getname")
	public Person getPerson(@RequestParam String Id) {
		Person person = new Person();
		person = service.findById(Id);
		
		return person;
	}
	
	@GetMapping("/findall")
	public Iterable<Person> getPerson() {
		Iterable<Person> person;
		person = service.findAll();
		
		return person;
	}
	
	@GetMapping("/{id}")
	public Person findById(@PathVariable final String id) {
		return service.findById(id);
	}
	
}
