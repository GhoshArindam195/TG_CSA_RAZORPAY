package com.learn.csa.course_selling_app.servlets;

import com.learn.csa.course_selling_app.dao.AnnouncementDAO;
import com.learn.csa.course_selling_app.entity.Announcement;
import com.learn.csa.course_selling_app.helper.Utilities;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
@WebServlet(name = "announcementServlet", urlPatterns = {"/announcementServlet"})
public class AnnouncementServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String task = request.getParameter("task");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String link_a_course = request.getParameter("link_a_course");
            String link_course_id = request.getParameter("link_course_id");

            Part part = request.getPart("announcemnt_pic");
            String pic_name = part.getSubmittedFileName();
            
            String path = "D:\\jsp_servlet_projects\\course_selling_app\\src\\main\\webapp\\carausal_pics"+File.separator+pic_name;

            if (task.trim().equals("add")) {
                
                Announcement announcement = new Announcement(start_date, end_date, null, pic_name);
                if(link_a_course != null)
                    announcement = new Announcement(start_date, end_date, Integer.valueOf(link_course_id), pic_name);
                
                if(AnnouncementDAO.saveAnnouncement(announcement))
                {
                    if(Utilities.saveFile(part.getInputStream(), path)){
                    //File Got save into the "carausal_pics" folder
                    response.sendRedirect("admin.jsp");
                }
                else
                {
//                    File couldn't save into the "course_pics" folder
                }
                }
                else
                {
                    
                }
                

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
