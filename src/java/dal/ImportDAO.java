/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Import;
import model.ImportBill;
import model.Rice;

/**
 *
 * @author Trangbmhe150464
 */
public class ImportDAO extends DBContext{
    
    public void insertImport(Import i){
        try {
            String sql = "INSERT INTO [ImportRice]\n" +
                        "           ([ID]\n" +
                        "           ,[RiceID]\n" +
                        "           ,[Quantity]\n" +
                        "           ,[Unit price]\n" +
                        "           ,[Date])\n" +
                        "     VALUES\n" +
                        "           (?, ?, ?, ?, GETDATE())";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, i.getId());
            ps.setString(2, i.getRiceid());
            ps.setInt(3, i.getQuantity());
            ps.setString(4, i.getUnitprice());
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    public void updateImport(Import i){
        try {
            String sql = "UPDATE [ImportRice]\n" +
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
    
    public ArrayList<ImportBill> getImportBill(int rid){
        ArrayList<ImportBill> rice = new ArrayList<>();
        try {
            String sql = "select i.RiceID, r.Name, r.[Net weight], i.Quantity, i.[Unit price], (i.Quantity*i.[Unit price]) as TotalPrice, i.Date\n" +
                        "from ImportRice i left join Rice r on i.RiceID = r.ID\n" +
                        "where i.date = cast(getdate() as date) and i.id = ? order by i.RiceID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, rid);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                ImportBill ib = new ImportBill();
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
