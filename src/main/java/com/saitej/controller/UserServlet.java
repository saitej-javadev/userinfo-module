package com.saitej.controller;

import com.saitej.dao.UserDao;
import com.saitej.model.User;
import com.saitej.util.DownloadUtil;
import com.saitej.util.UploadUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class UserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        System.out.println("Servlet Path: " + request.getServletPath());
        System.out.println("RequestURI: " + request.getRequestURI());
        System.out.println("Context Path: " + request.getContextPath());

        try {
            switch (action) {
                case "/register":
                    registerUser(request, response);
                    break;
                case "/dologin":
                    loginUser(request, response);
                    break;
                case "/list":
                    listUser(request, response);
                    break;
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertUser(request, response);
                    break;
                case "/delete":
                    deleteUser(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateUser(request, response);
                    break;
                case "/download":
                    downloadUserList(request, response);
                    break;
                case "/upload":
                    upload(request, response);
                    break;
                case "/logout":
                    logoutUser(request, response);
                    break;
                default:
                    showLoginForm(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UserServlet.upload");
        UploadUtil.uploadFile(request);
        response.sendRedirect("list");
    }


    private void downloadUserList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("UserServlet.downloadUserList");
        HSSFWorkbook workbook= DownloadUtil.generateDownloadTasksExcel(request);
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition","attachment; filename=USERS-LIST.xls");
        workbook.write(response.getOutputStream());

    }



    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = null;
        User user = new User();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));

        System.out.println("User: " + user);

        int rowCount = userDao.registerUser(user);
        dispatcher = request.getRequestDispatcher("registration-form.jsp");
        if (rowCount > 0) {
            request.setAttribute("status", "Record inserted successfully..");
            request.setAttribute("isRegistrationSuccess", true);
        } else {
            request.setAttribute("failed", "insert operation failed!!!");
        }
        dispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        if (sessionUser(request)) {
            RequestDispatcher dispatcher = null;
            HttpSession session = request.getSession();
            if (session.getAttribute("urole").equals("Administrator")) {
                List<User> listUser = userDao.selectAllUsers();
                request.setAttribute("listUser", listUser);
                dispatcher = request.getRequestDispatcher("user-admin.jsp");
            } else {
                User user = userDao.selectUser((String) session.getAttribute("uemail"),
                        (String) session.getAttribute("urole"));
                request.setAttribute("user", user);
                dispatcher = request.getRequestDispatcher("user-nonadmin.jsp");
            }
            dispatcher.forward(request, response);
        } else
            response.sendRedirect("login");
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (sessionUser(request)) {
            response.sendRedirect("list");
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("user-login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userDao.loginUser(email, password);

        if (sessionUser(request)) {
            response.sendRedirect("list");
        } else if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("uemail", user.getEmail());
            session.setAttribute("urole", user.getRole());
            response.sendRedirect("list");
        } else {
            request.setAttribute("isLoginFailed", true);
            request.getRequestDispatcher("user-login.jsp").forward(request, response);
            // response.sendRedirect("login");
        }
    }

    private boolean sessionUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String uemail = (String) session.getAttribute("uemail");
        String urole = (String) session.getAttribute("urole");
        if (uemail == null || urole == null)
            return false;
        return true;
    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("uemail", null);
        session.setAttribute("urole", null);
        request.setAttribute("isLogoutSuccess", true);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-login.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        User existingUser = userDao.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String status = request.getParameter("status");
        User newUser = new User(name, email, password, role, status);
        userDao.insertUser(newUser);
        response.sendRedirect("list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String status = request.getParameter("status");

        User user = new User(id, name, email, password, role, status);
        userDao.updateUser(user);
        response.sendRedirect("list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        userDao.deleteUser(id);
        response.sendRedirect("list");

    }

}
