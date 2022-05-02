package gmap;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;

public class Gmap {
  public static void main(String[] args) throws IOException {
      URL url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json?origins="+args[0]);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      String line, outputString = "";
      BufferedReader reader = new BufferedReader(
      new InputStreamReader(conn.getInputStream()));
      int count=0;String dist="";String dur="";
      String op[]=new String[3];
      while ((line = reader.readLine()) != null && count<=1) {
         if(line.contains("text")){
       //   System.out.println(count+"."+line);
          String disto[]=line.split(":");
          dist=disto[1].substring(2, disto[1].lastIndexOf(",")-1);
      //    System.out.println(dist);
          op[count]=dist;
          count++;       
         }
      
      }
         for(int h=0;h<count;h++){
         System.out.println(op[h]);}
    //  DistancePojo capRes = new Gson().fromJson(outputString, DistancePojo.class);
    //  System.out.println(capRes);
  }
}