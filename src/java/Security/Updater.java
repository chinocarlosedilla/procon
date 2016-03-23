/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Security;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chino
 */
public class Updater extends HttpServlet {

    private int userID;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<meta http-equiv=\"Refresh\" content=\"5;url=mainPage.jsp?myID="+userID+"\">");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Updater</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>User Details updated, redirecting to mainpage.</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        System.out.println("Debug:: uID=" + request.getParameter("url_param"));
        
        int uID = Integer.parseInt(request.getParameter("url_param"));
        String uPass = request.getParameter("f_usr_pass");
        String uFName = request.getParameter("f_usr_firstname");
        String uLName = request.getParameter("f_usr_lastname");
        String uProfs = request.getParameter("f_usr_profession");
        String uGender = request.getParameter("f_usr_sex");
        
        
        userID = uID;
        
        if(Update.updateRecord(uID, uPass, uFName, uLName, uProfs, uGender))
        {
            processRequest(request, response);
            /*RequestDispatcher rs = request.getRequestDispatcher("mainPage.jsp");
            rs.forward(request, response);*/
        }
        else
        {
           //out.println("Username or Password incorrect");
           RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
           rs.include(request, response);
        }
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
