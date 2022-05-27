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
public class Menu {
    
    int idProduit;
    String designation;
    int prix;
    int idcategorie;

    public Menu(int idProduit, String designation, int prix, int idcategorie) {
        this.idProduit = idProduit;
        this.designation = designation;
        this.prix = prix;
        this.idcategorie = idcategorie;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public int getIdcategorie() {
        return idcategorie;
    }

    public void setIdcategorie(int idcategorie) {
        this.idcategorie = idcategorie;
    }
    
    public ArrayList<Menu> getMenu()throws Exception{
        Connection c = new Connect().getConnection();
        try{
        ArrayList<Menu> lt= new ArrayList();
        String req="select * from menu";
        Statement stmt = c.createStatement();
        ResultSet res= stmt.executeQuery(req);
        while(res.next()){
            Menu m=new Menu(res.getInt(1),res.getString(2),res.getInt(3),res.getInt(4));
            lt.add(m);
        }
        return lt;
        }catch(Exception e){
            return null;
        }finally{
            c.close();
        }
    }
    
    public ArrayList<Menu> getMenuSelonCategorie(int idCategorie)throws Exception{
        Connection c = new Connect().getConnection();
        try{
        ArrayList<Menu> lt= new ArrayList();
        String req="select * from menu where idcategorie='"+idCategorie+"' ";
        Statement stmt = c.createStatement();
        ResultSet res= stmt.executeQuery(req);
        while(res.next()){
            Menu m=new Menu(res.getInt(1),res.getString(2),res.getInt(3),res.getInt(4));
            lt.add(m);
        }
        return lt;
        }catch(Exception e){
            return null;
        }finally{
            c.close();
        }
    }
    
     public ArrayList<Menu> getUniqueMenu(int idProduit)throws Exception{
        Connection c = new Connect().getConnection();
        try{
            ArrayList<Menu> lt= new ArrayList();
            String req="select * from menu where idProduit='"+idProduit+"'";
            Statement stmt = c.createStatement();
            ResultSet res= stmt.executeQuery(req);
            while(res.next()){
                Menu m=new Menu(res.getInt(1),res.getString(2),res.getInt(3),res.getInt(4));
                lt.add(m);
            }
            return lt;
        }catch(Exception e){
            return null;
        }finally{
            c.close();
        }
    }
    
    
    
}
