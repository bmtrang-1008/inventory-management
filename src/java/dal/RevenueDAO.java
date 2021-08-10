/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.ExportPrice;
import model.ImportPrice;

/**
 *
 * @author Trangbmhe150464
 */
public class RevenueDAO extends DBContext{
    public int importTotalPrice(){
        try {
            String sql = "select sum(ImportPrice) as ImportTotalPrice\n" +
                        "from (\n" +
                        "select i.id, sum((i.[Unit price]*i.Quantity)) as ImportPrice, i.Date\n" +
                        "from ImportRice i\n" +
                        "where date like '%'+ CAST(MONTH(GETDATE()) as varchar(2)) +'-%'\n" +
                        "group by i.id, i.Date\n" +
                        ") as importTotal";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
               return rs.getInt("ImportTotalPrice");
            }
        } catch (Exception e) {
            
        }
        return -1;
    }
    
    public int exportTotalPrice(){
        try {
            String sql = "select sum(ExportPrice) as ExportTotalPrice\n" +
                        "from (\n" +
                        "select i.id, sum((i.[Unit price]*i.Quantity)) as ExportPrice, i.Date\n" +
                        "from ExportRice i\n" +
                        "where date like '%'+ CAST(MONTH(GETDATE()) as varchar(2)) +'-%'\n" +
                        "group by i.id, i.Date\n" +
                        ") as exportTotal";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
               return rs.getInt("ExportTotalPrice");
            }
        } catch (Exception e) {
            
        }
        return -1;
    }
    
    public ArrayList<ImportPrice> getImportPrice(){
        ArrayList<ImportPrice> ip = new ArrayList<>();
        try {
            String sql = "select i.id, sum((i.[Unit price]*i.Quantity)) as ImportPrice, i.date\n" +
                        "from ImportRice i\n" +
                        "where date like '%'+ CAST(MONTH(GETDATE()) as varchar(2)) +'-%'\n" +
                        "group by i.id, i.Date";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                ImportPrice i = new ImportPrice();
                i.setId(rs.getInt("id"));
                i.setPrice(rs.getInt("ImportPrice"));
                i.setDate(rs.getDate("Date"));
                ip.add(i);
            }
            
        } catch (Exception e) {
            
        }
        return ip;
    }
    
    public ArrayList<ExportPrice> getExportPrice(){
        ArrayList<ExportPrice> ep = new ArrayList<>();
        try {
            String sql = "select i.id, sum((i.[Unit price]*i.Quantity)) as ExportPrice, i.date\n" +
                        "from ExportRice i\n" +
                        "where date like '%'+ CAST(MONTH(GETDATE()) as varchar(2)) +'-%'\n" +
                        "group by i.id, i.Date";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                ExportPrice e = new ExportPrice();
                e.setId(rs.getInt("id"));
                e.setPrice(rs.getInt("ExportPrice"));
                e.setDate(rs.getDate("Date"));
                ep.add(e);
            }
            
        } catch (Exception e) {
            
        }
        return ep;
    }
}
