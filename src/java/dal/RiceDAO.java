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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Inventory;
import model.Rice;

/**
 *
 * @author Trangbmhe150464
 */
public class RiceDAO extends DBContext{
    
    public ArrayList<Rice> getAllRice(){
        ArrayList<Rice> rice = new ArrayList<>();
        try {
            String sql = "SELECT rID, ID, Name, [Net weight] FROM\n" +
                        "(SELECT ROW_NUMBER() OVER (ORDER BY id ASC) as rID, ID, Name, [Net weight]\n" +
                        "FROM Rice) as list";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Rice r = new Rice();
                r.setRid(rs.getInt("rID"));
                r.setId(rs.getInt("ID"));
                r.setName(rs.getNString("Name"));
                r.setWeight(rs.getFloat("Net weight"));
                rice.add(r);
            }
        } catch (Exception e) {
            
        }
        return rice;
    }
    
    public ArrayList<Inventory> getInventory(){
        ArrayList<Inventory> inventory = new ArrayList<>();
        try {
            String sql = "select i.ID, i.Name, Bought, Sold, (Bought - Sold) as Inventory\n" +
                        "from\n" +
                        "( select ri.ID, ri.Name, isnull(sum(i.quantity), 0) as Bought\n" +
                        "from rice ri left join ImportRice i on ri.id = i.RiceID\n" +
                        "group by ri.ID, ri.Name\n" +
                        ") as i\n" +
                        "left join \n" +
                        "( select r.ID, r.Name, isnull(sum(e.quantity),0) as Sold\n" +
                        "from (rice r left join ExportRice e on e.RiceID = r.ID) \n" +
                        "group by r.ID, r.Name\n" +
                        ") as e\n" +
                        "on i.ID = e.ID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Inventory i = new Inventory();
                i.setId(rs.getInt("ID"));
                i.setName(rs.getNString("Name"));
                i.setBought(rs.getInt("Bought"));
                i.setSold(rs.getInt("Sold"));
                i.setInventory(rs.getInt("Inventory"));
                inventory.add(i);
            }
        } catch (Exception e) {
            
        }
        
        return inventory;
    }
    
    public void insertRice(Rice r){
        try {
            String sql = "INSERT INTO [Rice]\n" +
                        "           ([Name]\n" +
                        "           ,[Net weight])\n" +
                        "     VALUES\n" +
                        "           (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, r.getName());
            ps.setFloat(2, r.getWeight());
            ps.executeUpdate();
            
        } catch (Exception e) {

        }
    }
    
    public void deleteRice(int id){
        try {
            String sql = "DELETE FROM [Rice]\n" +
                        "WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    public ArrayList<Rice> getRicePaging(int pageindex, int pagesize){
        ArrayList<Rice> rice = new ArrayList<>();
        try {
            String sql = "SELECT rID, ID, Name, [Net weight] FROM\n" +
                        "(SELECT ROW_NUMBER() OVER (ORDER BY id ASC) as rID, ID, Name, [Net weight]\n" +
                        "FROM Rice) as list\n" +
                        "WHERE rid >= (? - 1)*? + 1\n" +
                        "AND rid <= ? * ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pageindex);
            ps.setInt(2, pagesize);
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Rice r = new Rice();
                r.setRid(rs.getInt("rID"));
                r.setId(rs.getInt("ID"));
                r.setName(rs.getNString("Name"));
                r.setWeight(rs.getFloat("Net weight"));
                rice.add(r);
            }
        } catch (Exception e) {
            
        }
        return rice;
    }
    
    public int count()
    {
        try {
            String sql = "SELECT COUNT(*) as total FROM Rice";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
               return rs.getInt("total");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(RiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
}
