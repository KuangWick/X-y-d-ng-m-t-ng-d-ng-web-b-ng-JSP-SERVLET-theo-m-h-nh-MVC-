package model.dao;

import model.bean.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	private Connection getConnection() throws SQLException {
	    String jdbcURL = "jdbc:mysql://localhost:3306/TestCNW";
	    String jdbcUsername = "root";
	    String jdbcPassword = ""; // Đổi thành mật khẩu của bạn
	    return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	}


    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Student student = new Student(
                        rs.getString("student_id"),
                        rs.getString("full_name"),
                        rs.getString("gender"),
                        rs.getString("department")
                );
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public List<Student> getStudentsByDepartment(String department) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students WHERE department = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, department);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Student student = new Student(
                            rs.getString("student_id"),
                            rs.getString("full_name"),
                            rs.getString("gender"),
                            rs.getString("department")
                    );
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
    public List<Student> getStudentById(String studentId) {
    	List<Student> students = new ArrayList<>();
        // Tương tự như các phương thức khác, sử dụng PreparedStatement để truy vấn
        String sql = "SELECT * FROM students WHERE student_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, studentId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Student student = new Student(
                            rs.getString("student_id"),
                            rs.getString("full_name"),
                            rs.getString("gender"),
                            rs.getString("department")
                    );
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students; // Trả về null nếu không tìm thấy sinh viên
    }
    public boolean updateStudent(Student student) {
        String sql = "UPDATE students SET full_name = ?, gender = ?, department = ? WHERE student_id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            // Thiết lập các tham số cho PreparedStatement
            statement.setString(1, student.getFullName());
            statement.setString(2, student.getGender());
            statement.setString(3, student.getDepartment());
            statement.setString(4, student.getStudentId());
            
            // Thực thi câu lệnh SQL và kiểm tra kết quả
            return statement.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi log lỗi (nếu cần)
            return false;
        }
    }
    public boolean deleteStudent(String studentId) {
        String sql = "DELETE FROM students WHERE student_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, studentId);
            return pstmt.executeUpdate() > 0; // Trả về true nếu xóa thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addStudent(Student student) {
        String sql = "INSERT INTO students (student_id, full_name, gender, department) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); 
        		PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, student.getStudentId());
            ps.setString(2, student.getFullName());
            ps.setString(3, student.getGender());
            ps.setString(4, student.getDepartment());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu thêm thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        }
    }


}

