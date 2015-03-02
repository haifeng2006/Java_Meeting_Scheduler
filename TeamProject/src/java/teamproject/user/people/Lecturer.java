package teamproject.user.people;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import teamproject.meeting.Meeting;
import teamproject.sql.SqlHandler;
import teamproject.system.Bugzilla;
import teamproject.system.SystemSetting;

public class Lecturer extends Staff {
        private static boolean createdModule = false;
        private static boolean deleteModule = false;
        private static boolean editModule = false;

	/**
	 * 
	 * @param meeting
	 */
	public boolean scheduleMeeting(Meeting meeting)
	{
		// TODO - implement Lecturer.scheduleMeeting
		throw new UnsupportedOperationException();
	}

        
	/**
	 * 
	 * @param meeting
	 */
	public boolean scheduleLab(Meeting meeting)
	{
		// TODO - implement Lecturer.scheduleLab
		throw new UnsupportedOperationException();
	}
        
        
        public boolean CreateModule(int module_id, int credit, String title, String code, String description, int year )
	{
            try{
                SystemSetting.initSystemSetting();
                SqlHandler sqlHandler = new SqlHandler();
                String query3 = "INSERT INTO Module(module_id, credit, title, code, description, year)"  
                              + "VALUES(" + module_id + "," + credit + ",'" + title + "'," + code 
                              +   ",'" + description + "'," + year + ");";
                sqlHandler.runStatement(query3);
                
                createdModule = true;
                
            }catch(SQLException ex) {
                Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
                Bugzilla.reportBug("Issue with creating module by the lecturer.");
            }
         return createdModule;
	}
        
        
        public boolean DeleteModule(String code)
	{
            try{
                SystemSetting.initSystemSetting();                             
                SqlHandler sqlHandler = new SqlHandler();               
                
                String query = "DELETE FROM Module WHERE code = '" + code + "';";
                sqlHandler.runStatement(query);
            
                deleteModule = true;
                
            }catch(SQLException ex) {
                Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
                Bugzilla.reportBug("Issue with deleting module by a lecturer");
            }
         return deleteModule;
	}
        
        public boolean EditModule(int module_id, int credit, String title, String code, String description, int year )
	{
            try{
                SystemSetting.initSystemSetting();                             
                SqlHandler sqlHandler = new SqlHandler();               
                
                String query = "UPDATE Module" +
                               "SET module_id=" + module_id +
                               ", credit = " + credit + 
                               ", title = '" + title + "'" +
                               ", description = '" + description + "'" +
                               ", year = " + year +
                               "WHERE code = ' " + code;
                sqlHandler.runStatement(query);
            
                editModule = true;
                
            }catch(SQLException ex) {
                Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
                Bugzilla.reportBug("Issue with editing module by a lecturer");
            }
         return editModule;
	}

}