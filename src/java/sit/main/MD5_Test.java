/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.main;

import java.util.Calendar;
import java.util.Date;
import sit.javaModel.MD5;
import sit.javaModel.TimeAgo;

/**
 *
 * @author Firsty
 */
public class MD5_Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        TimeAgo time = new TimeAgo();
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, -1);
        System.out.println("current date: " + date);
        System.out.println("cal getTime: " + cal.getTime());
        System.out.println("date compare to" + Math.abs(cal.getTimeInMillis() - date.getTime()));
        System.out.println("time.compareToDuration(date, cal.getTime()) " + time.compareToDuration(date, cal.getTime()));
        
    }
}