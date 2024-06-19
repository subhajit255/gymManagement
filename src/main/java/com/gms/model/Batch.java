package com.gms.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class Batch {
	@Id
	private int id;
	private String name;
	
	public Batch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Batch(String name) {
		super();
		this.name = name;
	}
	public int getId() {
		return id;
	}
	@Override
	public String toString() {
		return "Batch [name=" + name + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
