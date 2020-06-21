package Servlet;

import Dao.Impl.StudentDaoImpl;
import pojo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editStudent")
public class EditServlet extends HttpServlet {

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        Student student = new StudentDaoImpl().get(id);

        req.setAttribute("student", student);

        req.getRequestDispatcher("/editStudent.jsp").forward(req, resp);
    }
}