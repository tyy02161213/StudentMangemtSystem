package Dao;

import pojo.Student;

import java.util.List;

public interface StudentDao {
    void add(Student student);
    void delete(int id);
    int getTotal();
    void update(Student student);
    Student get(int id);
    List<Student> list();
    List<Student> list(int start, int count);

}
