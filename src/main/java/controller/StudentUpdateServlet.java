package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Student;
import model.dao.StudentDAO;

@WebServlet("/student-update")
public class StudentUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        String fullName = request.getParameter("full_name");
        String gender = request.getParameter("gender");
        String department = request.getParameter("department");

        Student student = new Student(studentId, fullName, gender, department);
        StudentDAO studentDAO = new StudentDAO();

        boolean result = studentDAO.updateStudent(student);

        if (result) {
            response.sendRedirect("student-list?message=success");
        } else {
            request.setAttribute("error", "Cập nhật không thành công");
            request.getRequestDispatcher("student_edit.jsp").forward(request, response);
        }
    }
}

