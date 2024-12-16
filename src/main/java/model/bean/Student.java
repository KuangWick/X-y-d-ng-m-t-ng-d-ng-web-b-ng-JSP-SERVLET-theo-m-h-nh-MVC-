package model.bean;

public class Student {
    private String studentId;
    private String fullName;
    private String gender;
    private String department;

    public Student() {}

    public Student(String studentId, String fullName, String gender, String department) {
        this.studentId = studentId;
        this.fullName = fullName;
        this.gender = gender;
        this.department = department;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
