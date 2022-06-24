/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author arrag
 */
public class TableListDTO {
    
    String table_name,table_desc,table_id,date_accessed,time_accessed;

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

    public void setTable_desc(String table_desc) {
        this.table_desc = table_desc;
    }

    public void setTable_id(String table_id) {
        this.table_id = table_id;
    }

    public void setDate_accessed(String date_accessed) {
        this.date_accessed = date_accessed;
    }

    public void setTime_accessed(String time_accessed) {
        this.time_accessed = time_accessed;
    }

    public String getTable_name() {
        return table_name;
    }

    public String getTable_desc() {
        return table_desc;
    }

    public String getTable_id() {
        return table_id;
    }

    public String getDate_accessed() {
        return date_accessed;
    }

    public String getTime_accessed() {
        return time_accessed;
    }
    
    
    
}
