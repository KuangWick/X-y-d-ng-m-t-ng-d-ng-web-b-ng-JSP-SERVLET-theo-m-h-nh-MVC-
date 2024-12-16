package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Student;
import model.dao.StudentDAO;

@WebServlet("/student-add-handler")
public class StudentAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        String fullName = request.getParameter("full_name");
        String gender = request.getParameter("gender");
        String department = request.getParameter("department");

        // Tạo đối tượng Student
        Student student = new Student(studentId, fullName, gender, department);

        // Gọi DAO để thêm sinh viên vào DB
        StudentDAO studentDAO = new StudentDAO();
        boolean success = studentDAO.addStudent(student);

        // Redirect kèm thông báo
        if (success) {
            response.sendRedirect("student-list?success=added");
        } else {
            response.sendRedirect("student-list?error=failed");
        }
    }
}

