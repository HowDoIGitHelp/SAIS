/*
 * To change this license header, choose License Headers in Project Properties. 
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package SAIS;

import java.awt.Point;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rub account
 */
public class Schedule {
    public List<Point> scheduleSlot(String start, String end,String day){
        double sTime=Double.valueOf(start.substring(0,2))+(start.substring(2,4).equals("30")?0.5:0);
        double eTime=Double.valueOf(end.substring(0,2))+(end.substring(2,4).equals("30")?0.5:0);
        List<Point> slotList=new ArrayList();
        for(int i=0;i<day.length();i++){
            if(day.charAt(i)=='1'){
                for(double j=sTime;j<eTime;j+=0.5){
                    slotList.add((new Point(i,(int)(j*2-12))));
                }
            }
        }
        return slotList;
    }
    public static void main(String[] args) {
        Schedule s=new Schedule();
        System.out.println(schedulizeDay("0100100")+" "+
        schedulizeTime("9","10.5"));
    }
    public static String schedulizeDay(String s){
        String t="";
        if(s.charAt(0)=='1')
            t+="S";
        if(s.charAt(1)=='1')
            t+="M";
        if(s.charAt(2)=='1')
            t+="T";
        if(s.charAt(3)=='1')
            t+="W";
        if(s.charAt(4)=='1')
            t+="Th";
        if(s.charAt(5)=='1')
            t+="F";
        if(s.charAt(6)=='1')
            t+="S";
        return t;
    }
    public static String schedulizeTime(String start,String end){
        double s=Double.valueOf(start);
        double e=Double.valueOf(end);
        String r="";
        if(Math.ceil(s)-Math.floor(s)==0.d)
            r+=String.valueOf((int)Math.floor(s))+":00";
        else
            r+=String.valueOf((int)Math.floor(s)+":30");
        r+="-";
        if(Math.ceil(e)-Math.floor(e)==0.d)
            r+=String.valueOf((int)Math.floor(e))+":00";
        else
            r+=String.valueOf((int)Math.floor(e)+":30");
        return r;
    }
}
