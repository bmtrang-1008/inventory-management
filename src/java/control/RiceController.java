/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.RiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Rice;

/**
 *
 * @author Trangbmhe150464
 */
public class RiceController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        
        String r_pagesize = getServletContext().getInitParameter("pagesize");
        int pagesize = Integer.parseInt(r_pagesize);
        String r_pageindex = request.getParameter("page");
        
        if(r_pageindex == null)
            r_pageindex = "1";//validation
        int pageindex = Integer.parseInt(r_pageindex);
        
        RiceDAO db = new RiceDAO();
        int count = db.count();
        
        int totalpage = (count%pagesize ==0)
                ?count/pagesize
                :count/pagesize + 1;
        
        ArrayList<Rice> rice = db.getRicePaging(pageindex, pagesize);
        
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("rice", rice);
        request.getRequestDispatcher("view/insertRice.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        Float weight = Float.parseFloat(request.getParameter("weight"));
        
        RiceDAO db = new RiceDAO();
        Rice r = new Rice();
        r.setName(name);
        r.setWeight(weight);
        db.insertRice(r);
        
        response.sendRedirect("edit");
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
