package com.gms.model;
import com.gms.model.Batch;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
public class Participant {
	@Id
	private int id;
	private String name;
	private int type;
	private String email;
	private long phone;
	private int age;
	private String password;
	@OneToOne
//	@JoinColumn(name = "batch_id", referencedColumnName = "id")
	private Batch batch;

	public Participant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Participant(Batch batch, String name, int type, String email, long phone, int age, String password) {
		super();
		this.name = name;
		this.type = type;
		this.email = email;
		this.phone = phone;
		this.age = age;
		this.password = password;
		this.batch = batch;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Participant [name=" + name + ", type=" + type + ", email=" + email + ", phone=" + phone + ", age=" + age
				+ ", password=" + password + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Batch getBatch() {
		return batch;
	}

	public void setBatch(Batch batch) {
		this.batch = batch;
	}
	
}
