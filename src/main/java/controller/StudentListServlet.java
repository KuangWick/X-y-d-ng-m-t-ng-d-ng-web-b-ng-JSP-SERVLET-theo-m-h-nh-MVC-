package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.Student;
import model.bean.StudentService;
import model.bean.User;
import model.dao.UserDAO;
import model.bo.DBConnection;



@WebServlet("/student-list")
public class StudentListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentService studentService;
    @Override
    public void init() throws ServletException {
        // Initialize the StudentService and UserDAO with database connections
        studentService = new StudentService(DBConnection.getConnection());
        new UserDAO(DBConnection.getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if the user is already authenticated
        User user = (User) (session != null ? session.getAttribute("user") : null);
        if (user == null) {
            // User is not authenticated; redirect to login page
            request.setAttribute("errorMessage", "Please log in to access the student list.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Get department filter (if provided)
        String department = request.getParameter("department");

        try {
            // Retrieve the list of students
            List<Student> studentList;
            if (department != null && !department.isEmpty()) {
                studentList = studentService.getStudentsByDepartment(department); // Filter by department
            } else {
                studentList = studentService.getAllStudents(); // Get all students
            }

            // Set student list in request attributes
            request.setAttribute("studentList", studentList);

            // Forward to the JSP to display the student list
            RequestDispatcher dispatcher = request.getRequestDispatcher("student_list.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Log and display error if something goes wrong
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving the student list.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");
      if (action != null && action.equals("edit")) {
        String studentId = request.getParameter("student_id");
        // Retrieve student details based on studentId
        Student student = (Student) studentService.getStudentById(studentId);

        if (student != null) {
          // Set student object in request attributes for edit page
          request.setAttribute("student", student);
          RequestDispatcher dispatcher = request.getRequestDispatcher("edit_student.jsp");
          dispatcher.forward(request, response);
        } else {
          // Handle error: student not found
          request.setAttribute("errorMessage", "Student not found.");
          RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
          dispatcher.forward(request, response);
        }
      } else {
        // Handle other POST requests (e.g., potential future functionality)
      }
    }
}
