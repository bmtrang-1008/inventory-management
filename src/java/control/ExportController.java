/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.ExportDAO;
import dal.RiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Export;
import model.ExportBill;
import model.Rice;

/**
 *
 * @author Trangbmhe150464
 */
public class ExportController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        int eid;
        HttpSession session = request.getSession();
        String button = (String) session.getAttribute("saveE");
        if(button == null) button = "false";
        
        if (button.equalsIgnoreCase("true")) {
            int a = (int) session.getAttribute("eid");
            eid = a;
            ExportDAO idb = new ExportDAO();
            ArrayList<ExportBill> eBill = idb.getExportBill(eid);

            request.setAttribute("ebill", eBill);
            request.setAttribute("eid", eid);
        } else {
            session.removeAttribute("eid");
        }
        
        RiceDAO db = new RiceDAO();
        ArrayList<Rice> rice = db.getAllRice();
        
        request.setAttribute("rice", rice);
        request.getRequestDispatcher("view/insertExportRice.jsp").forward(request, response);
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
        String r_quantity = request.getParameter("quantity");
        if(r_quantity == null || r_quantity.equals("")){
            r_quantity = "0";
        }
        int ID = Integer.parseInt(request.getParameter("eid"));
        String riceid = request.getParameter("ricename");
        int quantity = Integer.parseInt(r_quantity);
        String unitprice = request.getParameter("unitprice");
        String button = request.getParameter("insert");
        
        if (button.equalsIgnoreCase("Nhập")){
            request.getSession().setAttribute("saveE","true");
        } else {
            request.getSession().setAttribute("saveE","false");
        }
        request.getSession().setAttribute("eid",ID);
        
        ExportDAO db = new ExportDAO();
        
        if(quantity != 0 && !unitprice.equalsIgnoreCase("")){
            Export e = new Export();
            e.setQuantity(0);
            e.setId(ID);
            e.setRiceid(riceid);
            e.setUnitprice(unitprice);
            ArrayList<ExportBill> eBill = db.getExportBill(ID);
            for(ExportBill eb : eBill){
                if(eb.getRiceid().equalsIgnoreCase(riceid)){
                    e.setQuantity(quantity + eb.getQuantity());
                    db.updateExport(e);
                    break;
                }
            }
            if(e.getQuantity() == 0){
                e.setQuantity(quantity);
                db.insertExport(e);
            }
        }
        
        
        response.sendRedirect("export");
        
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
