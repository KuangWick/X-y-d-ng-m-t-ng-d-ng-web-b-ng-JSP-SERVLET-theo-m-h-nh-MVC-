package controller;

import model.dao.StudentDAO;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/student-delete-handler")
public class StudentDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("student_id");

        if (studentId != null) {
            boolean result = studentDAO.deleteStudent(studentId);
            if (result) {
                response.sendRedirect("student-list?success=deleted");
            } else {
                response.sendRedirect("student-list?error=notfound");
            }
        } else {
            response.sendRedirect("student-list?error=invalid");
        }
    }
}
