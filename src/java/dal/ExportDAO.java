/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Export;
import model.Export;
import model.ExportBill;

/**
 *
 * @author Trangbmhe150464
 */
public class ExportDAO extends DBContext{
    public void insertExport(Export ex){
        try {
            String sql = "INSERT INTO [ExportRice]\n" +
                        "           ([ID]\n" +
                        "           ,[RiceID]\n" +
                        "           ,[Quantity]\n" +
                        "           ,[Unit price]\n" +
                        "           ,[Date])\n" +
                        "     VALUES\n" +
                        "           (?, ?, ?, ?, GETDATE())";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ex.getId());
            ps.setString(2, ex.getRiceid());
            ps.setInt(3, ex.getQuantity());
            ps.setString(4, ex.getUnitprice());
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void updateExport(Export i){
        try {
            String sql = "UPDATE [ExportRice]\n" +
                        "   SET [Quantity] = ?\n" +
                        " WHERE RiceID = ? and id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, i.getQuantity());
            ps.setString(2, i.getRiceid());
            ps.setInt(3, i.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    public ArrayList<ExportBill> getExportBill(int rid){
        ArrayList<ExportBill> rice = new ArrayList<>();
        try {
            String sql = "select i.RiceID, r.Name, r.[Net weight], i.Quantity, i.[Unit price], (i.Quantity*i.[Unit price]) as TotalPrice, i.Date\n" +
                        "from ExportRice i left join Rice r on i.RiceID = r.ID\n" +
                        "where i.date = cast(getdate() as date) and i.id = ? order by i.RiceID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rid);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                ExportBill ib = new ExportBill();
                ib.setRiceid(rs.getString("RiceID"));
                ib.setName(rs.getNString("Name"));
                ib.setWeight(rs.getFloat("Net weight"));
                ib.setQuantity(rs.getInt("Quantity"));
                ib.setUnitprice(rs.getInt("Unit price"));
                ib.setPrice(rs.getInt("TotalPrice"));
                ib.setDate(rs.getDate("Date"));
                rice.add(ib);
            }
        } catch (Exception e) {
            
        }
        return rice;
    }
}
