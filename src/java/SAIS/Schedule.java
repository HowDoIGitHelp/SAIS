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
        List<Point> l=s.scheduleSlot("0730","0900","0100100");
        for(Point p:l)
            System.out.println(p.x+" "+p.y);
    }
    
}
