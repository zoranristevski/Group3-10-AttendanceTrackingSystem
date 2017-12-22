package com.example.guestbook;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;


@Entity
public class Group {
	@Id public String name;
	public Group(){

	}
	public Group(String name){
	    this();
	    this.name = name;
	}
}
