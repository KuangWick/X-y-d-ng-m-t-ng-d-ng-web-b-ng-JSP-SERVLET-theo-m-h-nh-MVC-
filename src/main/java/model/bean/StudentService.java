package model.bean;


import model.dao.StudentDAO;

import java.sql.Connection;

import java.util.List;

public class StudentService {
    private StudentDAO studentDAO;

    public StudentService(Connection connection) {
        studentDAO = new StudentDAO(); // Khởi tạo DAO để truy vấn cơ sở dữ liệu
    }

    // Lấy danh sách tất cả sinh viên
    public List<Student> getAllStudents() {
        return studentDAO.getAllStudents(); // Gọi phương thức getAllStudents() từ DAO
    }

    // Lấy danh sách sinh viên theo khoa
    public List<Student> getStudentsByDepartment(String department) {
        return studentDAO.getStudentsByDepartment(department); // Gọi phương thức getStudentsByDepartment() từ DAO
    }
    public List<Student> getStudentById(String studentId) {
		return studentDAO.getStudentById(studentId);
    	
    }
 // Cập nhật thông tin sinh viên
    public boolean updateStudent(Student student) {
        return studentDAO.updateStudent(student); // Gọi phương thức updateStudent() từ DAO
    }

}
