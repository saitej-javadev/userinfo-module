package com.saitej.model;

public class User {
	
	private Long id;
	private String name;
	private String email;
	private String password;
	private String role;
	private String status;
	private String login_date;
	private String created_date;
	private String updated_date;
	
	public User() {
	}
	
	
	
	
	public User(String name, String email, String password, String role, String status) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.status = status;
	}




	public User(Long id, String name, String email, String password, String role, String status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.status = status;
	}

	public User(Long id, String name, String email, String password, String role, String status, String login_date, String created_date, String updated_date) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.status = status;
		this.login_date = login_date;
		this.created_date = created_date;
		this.updated_date = updated_date;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}

	public String getLogin_date() {
		return login_date;
	}

	public void setLogin_date(String login_date) {
		this.login_date = login_date;
	}
}
