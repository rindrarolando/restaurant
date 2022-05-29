/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Shelby
 */
public class Plat {
    
//    public ArrayList<Menu> getUniqueMenu(int idProduit)throws Exception{
//        Connection c = new Connect().getConnection();
//        try{
//            ArrayList<Menu> lt= new ArrayList();
//            String req="select * from menu where idProduit='"+idProduit+"'";
//            Statement stmt = c.createStatement();
//            ResultSet res= stmt.executeQuery(req);
//            while(res.next()){
//                Menu m=new Menu(res.getInt(1),res.getString(2),res.getInt(3),res.getInt(4));
//                lt.add(m);
//            }
//            return lt;
//        }catch(Exception e){
//            return null;
//        }finally{
//            c.close();
//        }
//    }
}
