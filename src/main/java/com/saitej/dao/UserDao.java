package com.saitej.dao;

import com.saitej.model.User;
import com.saitej.util.DBUtil;
import com.saitej.util.DateUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
	private static final String INSERT_USERS_SQL = "INSERT INTO users"
			+ "  (name, email, password, role, status,created_date) VALUES " + " (?, ?, ?, ?, ?,?);";
	private static final String REGISTER_USER =  "INSERT INTO users(name, email, password, role, status,created_date)VALUES(?, ?, ?, ?, ?,?)";
	private static final String LOGIN_USER = "SELECT * FROM USERS WHERE EMAIL =? AND PASSWORD =? AND STATUS =?";
	private static final String SELECT_ALL_USERS = "SELECT * FROM USERS";
	private static final String SELECT_USER_BY_ID = "SELECT ID,NAME,EMAIL,PASSWORD,ROLE,STATUS FROM USERS WHERE ID =?";
	private static final String SELECT_USER_BY_EMAIL_ROLE = "SELECT ID,NAME,EMAIL,PASSWORD,ROLE,STATUS FROM USERS WHERE EMAIL =? AND ROLE =?";
	private static final String DELETE_USERS_SQL = "DELETE FROM USERS WHERE ID = ?;";
	private static final String UPDATE_USERS_SQL = "UPDATE USERS SET NAME = ?,EMAIL= ?, PASSWORD= ?, ROLE= ?, STATUS =?,UPDATED_DATE=? WHERE ID = ?;";

	public User loginUser(String email, String password) {
		User user = null;
		/* try with resource */

		try (
				/* create connection */
				Connection con = DBUtil.getConnection();
				/* create statement */
				PreparedStatement ps = con.prepareStatement(LOGIN_USER);) {
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, "Active");
			/* execute query and collect results */
			ResultSet rs = ps.executeQuery();
			/* process the results */
			while (rs.next()) {
				Long id = rs.getLong("id");
				String name = rs.getString("name");
				String emailFrmDB = rs.getString("email");
				String passwordFrmDB = rs.getString("password");
				String role = rs.getString("role");
				String status = rs.getString("status");
				user = new User(id, name, emailFrmDB, passwordFrmDB, role, status);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;

	}

	public void insertUser(User user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getRole());
			preparedStatement.setString(5, user.getStatus());
			preparedStatement.setString(6, DateUtil.format(LocalDateTime.now()));
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public List<User> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<User> users = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = DBUtil.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				Long id = rs.getLong("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String role = rs.getString("role");
				String status = rs.getString("status");
				users.add(new User(id, name, email, password, role, status));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	public User selectUser(Long id) {
		User user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = DBUtil.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setLong(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String role = rs.getString("role");
				String status = rs.getString("status");
				user = new User(id, name, email, password, role, status);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public User selectUser(String email, String role) {
		User user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = DBUtil.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL_ROLE);) {
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, role);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				Long id = rs.getLong("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String status = rs.getString("status");
				user = new User(id, name, email, password, role, status);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean 	updateUser(User user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getRole());
			statement.setString(5, user.getStatus());
			statement.setString(6, DateUtil.format(LocalDateTime.now()));
			statement.setLong(7, user.getId());


			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

	public int registerUser(User user) {
		System.out.println("UserDao.registerUser");
		int count = 0;
		Connection con = DBUtil.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(REGISTER_USER);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4,"General User");
			ps.setString(5,"Active");
			ps.setString(6, DateUtil.format(LocalDateTime.now()));
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
