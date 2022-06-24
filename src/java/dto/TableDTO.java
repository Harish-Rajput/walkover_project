/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;

/**
 *
 * @author arrag
 */
public class TableDTO {
    
    String query,table_id,primary_key,table_name,table_desc,username;
    
    ArrayList<ArrayList<String>> tlist = new ArrayList<>();

    public void setTlist(ArrayList<ArrayList<String>> tlist) {
        this.tlist = tlist;
    }

    public ArrayList<ArrayList<String>> getTlist() {
        return tlist;
    }
    

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

    public void setTable_desc(String table_desc) {
        this.table_desc = table_desc;
    }

    public String getTable_name() {
        return table_name;
    }

    public String getTable_desc() {
        return table_desc;
    }

    public String getPrimary_key() {
        return primary_key;
    }

    public void setPrimary_key(String primary_key) {
        this.primary_key = primary_key;
    }
    
    ArrayList<String> col_name = new ArrayList<>();
    ArrayList<String> col_type = new ArrayList<>();

    public ArrayList<String> getCol_name() {
        return col_name;
    }

    public ArrayList<String> getCol_type() {
        return col_type;
    }

    public void setCol_name(ArrayList<String> col_name) {
        this.col_name = col_name;
    }

    public void setCol_type(ArrayList<String> col_type) {
        this.col_type = col_type;
    }

    public String getQuery() {
        return query;
    }

    public String getTable_id() {
        return table_id;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public void setTable_id(String table_id) {
        this.table_id = table_id;
    }
}
