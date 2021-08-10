/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.ImportDAO;
import dal.RiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Import;
import model.ImportBill;
import model.Rice;

/**
 *
 * @author Trangbmhe150464
 */
public class ImportController extends HttpServlet {

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
        
        int iid;
        HttpSession session = request.getSession();
        String button = (String) session.getAttribute("saveI");
        if(button == null) button = "false";
        
        if (button.equalsIgnoreCase("true")) {
            int a = (int) session.getAttribute("iid");
            iid = a;
            
            ImportDAO idb = new ImportDAO();
            ArrayList<ImportBill> iBill = idb.getImportBill(iid);
            request.setAttribute("iid", iid);
            request.setAttribute("ibill", iBill);
        } else {
            session.removeAttribute("iid");
        }
        
        RiceDAO db = new RiceDAO();
        ArrayList<Rice> rice = db.getAllRice();
        
        request.setAttribute("rice", rice);
        request.getRequestDispatcher("view/insertImportRice.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
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
        int ID = Integer.parseInt(request.getParameter("iid"));
        String riceid = request.getParameter("ricename");
        int quantity = Integer.parseInt(r_quantity);
        String unitprice = request.getParameter("unitprice");
        String button = request.getParameter("insert");
        
        if (button.equalsIgnoreCase("Nhập")){
            request.getSession().setAttribute("saveI","true");
        } else {
            request.getSession().setAttribute("saveI","false");
        }
        request.getSession().setAttribute("iid",ID);
        
        ImportDAO db = new ImportDAO();
        
        if(quantity != 0 && !unitprice.equalsIgnoreCase("")){
            Import i = new Import();
            i.setQuantity(0);
            i.setId(ID);
            i.setRiceid(riceid);
            i.setUnitprice(unitprice);
            ArrayList<ImportBill> iBill = db.getImportBill(ID);
            for(ImportBill ib : iBill){
                if(ib.getRiceid().equalsIgnoreCase(riceid)){
                    i.setQuantity(quantity + ib.getQuantity());
                    db.updateImport(i);
                    break;
                }
            }
            if(i.getQuantity() == 0){
                i.setQuantity(quantity);
                db.insertImport(i);
            }
        }
                
        response.sendRedirect("import");
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
