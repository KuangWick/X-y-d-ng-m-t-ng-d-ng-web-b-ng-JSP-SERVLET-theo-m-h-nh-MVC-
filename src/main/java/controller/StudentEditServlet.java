package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import model.bean.Student;
import model.dao.StudentDAO;

@WebServlet("/student-edit")
public class StudentEditServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        StudentDAO studentDAO = new StudentDAO();

        List<Student> students = studentDAO.getStudentById(studentId);
        if (!students.isEmpty()) {
            request.setAttribute("student", students.get(0));
            request.getRequestDispatcher("student_edit.jsp").forward(request, response);
        } else {
            response.sendRedirect("student-list?error=notfound");
        }
    }
}