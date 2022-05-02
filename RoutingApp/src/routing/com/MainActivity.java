package routing.com;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import static android.content.ContentValues.TAG;
import android.content.Context;
import static android.content.Context.WIFI_SERVICE;
import android.content.Intent;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.DhcpInfo;
import android.net.Uri;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.os.StrictMode;
import android.text.format.Formatter;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MainActivity extends Activity
{
    /** Called when the activity is first created. */
  private static Socket socket;String dloc="",name="";
    private LocationManager locationManager;
	String longi="",lati="",ss="",cityn="",unm="",pass="";
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
      
        LocationManager locationManager = (LocationManager)
getSystemService(Context.LOCATION_SERVICE);
                                LocationListener locationListener = new MyLocationListener();
locationManager.requestLocationUpdates(
LocationManager.GPS_PROVIDER, 5, 1, locationListener);


    }
    public void loginbtnclck(View v) {
         EditText usern=(EditText) findViewById(R.id.uname);
         EditText passn=(EditText) findViewById(R.id.pwd);
        unm = usern.getText().toString();
         pass = passn.getText().toString();
         StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
         StrictMode.setThreadPolicy(policy); 
         try
         { 
            String host = "192.168.43.176";
            int port = 25001;
            InetAddress address = InetAddress.getByName(host);
            try{
            socket = new Socket(host, port);
            }catch(Exception ex){ final Dialog dialog = new Dialog(this);
             dialog.setContentView(R.layout.custom_dialog);
             dialog.setTitle(ex.toString());
             dialog.show();}
            OutputStream os = socket.getOutputStream();
            OutputStreamWriter osw = new OutputStreamWriter(os);
            BufferedWriter bw = new BufferedWriter(osw);
            @SuppressLint("WifiManagerLeak") final WifiManager manager = (WifiManager) super.getSystemService(WIFI_SERVICE);
            final DhcpInfo dhcp = manager.getDhcpInfo();
            final String address1 = Formatter.formatIpAddress(dhcp.gateway);
            System.out.println("ROUTER IP"+ address1);            
            @SuppressLint("WifiManagerLeak") WifiManager myWifiManager = (WifiManager) getSystemService(WIFI_SERVICE);
            WifiInfo myWifiInfo = myWifiManager.getConnectionInfo();
            int ipAddress = myWifiInfo.getIpAddress();
            System.out.println("WiFi address is " + android.text.format.Formatter.formatIpAddress(ipAddress));
            @SuppressLint("WifiManagerLeak") WifiManager wifiManager = (WifiManager) getSystemService(Context.WIFI_SERVICE);
            WifiInfo wInfo = wifiManager.getConnectionInfo();
            @SuppressLint("MissingPermission") String macAddress = wInfo.getMacAddress();
            String sendMessage = unm.concat("--").concat(pass).concat("--").concat(longi).concat("--").concat(lati).concat("--").concat(cityn).concat("\n");
            bw.write(sendMessage);
            bw.flush();
            System.out.println("Message sent to the server : "+sendMessage);
            String message="";
            InputStream is = socket.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);
            message = br.readLine();
            System.out.println("Message received from the server : " +message);
            if(message.equals("LOGIN DONE"))
            {this.setContentView(R.layout.userhome);}
            else{
              final Dialog dialog = new Dialog(this);
              dialog.setContentView(R.layout.custom_dialog);
              dialog.setTitle(message);
              dialog.show();
            } 
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
     finally
        {
            try
            {}
            catch(Exception e)
            { e.printStackTrace();}
        }
    }
    public void getmap(View v){
    try{
    String uri = "http://maps.google.com/maps?daddr="+dloc;
Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
intent.setPackage("com.google.android.apps.maps");
startActivity(intent);
    }catch(Exception ex){}
    }
    public void getdel(View v){
    this.setContentView(R.layout.getroute);
    }
    public void markdel(View v){
    this.setContentView(R.layout.delivered);
    }
    public void deliveredaction(View v){
    try{ String host = "192.168.43.176";
            int port = 25001;
            InetAddress address = InetAddress.getByName(host);
            try{
            socket = new Socket(host, port);
            }catch(Exception ex){final Dialog dialog = new Dialog(this);
             dialog.setContentView(R.layout.custom_dialog);
             dialog.setTitle(ex.toString());
             dialog.show();}
             OutputStream os = socket.getOutputStream();
             OutputStreamWriter osw = new OutputStreamWriter(os);
             BufferedWriter bw = new BufferedWriter(osw);
             //get 
             String sendMessage = "markdeliver--"+name+"--"+dloc+"--"+" "+"--"+" "+"--"+" "+"\n";
             bw.write(sendMessage);
             bw.flush();
             System.out.println("Message sent to the server : "+sendMessage);
             String message="";
             InputStream is = socket.getInputStream();
             InputStreamReader isr = new InputStreamReader(is);
             BufferedReader br = new BufferedReader(isr);
             message = br.readLine();
             System.out.println("Message received from the server : " +message);
             if(message.equals("marked"))
             {
             final Dialog dialog = new Dialog(this);
             dialog.setContentView(R.layout.custom_dialog);
             dialog.setTitle("Marked");
             dialog.show();
             }
    }
    catch(Exception ex){System.out.println(ex);}
    }
    public void getdelivbtn(View v){
    try
         { 
            String host = "192.168.43.176";
            int port = 25001;
            InetAddress address = InetAddress.getByName(host);
            try{
            socket = new Socket(host, port);
            }catch(Exception ex){ final Dialog dialog = new Dialog(this);
             dialog.setContentView(R.layout.custom_dialog);
             dialog.setTitle(ex.toString());
             dialog.show();}
            OutputStream os = socket.getOutputStream();
            OutputStreamWriter osw = new OutputStreamWriter(os);
            BufferedWriter bw = new BufferedWriter(osw);
            String sendMessage = "getpending "+unm.concat("\n");
            bw.write(sendMessage);
            bw.flush();
            System.out.println("Message sent to the server : "+sendMessage);
            String message="";
            InputStream is = socket.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);
            message = br.readLine();
            System.out.println("Message received from the server : " +message);
            if(!message.equals(""))
            {
                String[] tok=message.split("--");
                String name=tok[0];
                String pdtname=tok[1];
                String pitem=tok[2];
                String qty=tok[3];
                dloc=tok[4];
                Button p1=(Button)findViewById(R.id.viewo);
                p1.setText(name+", "+pdtname+", "+pitem+", "+qty);
            }
            else{
            final Dialog dialog = new Dialog(this);
             dialog.setContentView(R.layout.custom_dialog);
             dialog.setTitle("No Delivery Pending");
             dialog.show();    
            }
    }
    catch(Exception ex){System.out.println(ex);}
    
    }
    public void getdelivbtn2(View v){
    try
         { 
            String host = "192.168.43.176";
            int port = 25001;
            InetAddress address = InetAddress.getByName(host);
            try{
            socket = new Socket(host, port);
            }catch(Exception ex){ final Dialog dialog = new Dialog(this);
            dialog.setContentView(R.layout.custom_dialog);
            dialog.setTitle(ex.toString());
            dialog.show();}
            OutputStream os = socket.getOutputStream();
            OutputStreamWriter osw = new OutputStreamWriter(os);
            BufferedWriter bw = new BufferedWriter(osw);
            String sendMessage = "getpending "+unm.concat("\n");
            bw.write(sendMessage);
            bw.flush();
            System.out.println("Message sent to the server : "+sendMessage);
            String message="";
            InputStream is = socket.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);
            message = br.readLine();
            System.out.println("Message received from the server : " +message);
            
            if(!message.equals(""))
            {
                String[] tok=message.split("--");
                name=tok[0];
                String pdtname=tok[1];
                String pitem=tok[2];
                String qty=tok[3];
                dloc=tok[4];
                Button p1=(Button)findViewById(R.id.viewm);
                p1.setText(name+", "+pdtname+", "+pitem+", "+qty);
            }
            else{
            final Dialog dialog = new Dialog(this);
             dialog.setContentView(R.layout.custom_dialog);
             dialog.setTitle("No Delivery Pending");
             dialog.show();    
            }
    }
    catch(Exception ex){System.out.println(ex);}
    
    }
    private class MyLocationListener implements LocationListener {

    @Override
    public void onLocationChanged(Location loc) {
        try {
            //  editLocation.setText("");
            // pb.setVisibility(View.INVISIBLE);
//            Toast.makeText(
//                    getBaseContext(),
//                    "Location changed: Lat: " + loc.getLatitude() + " Lng: "
//                            + loc.getLongitude(), Toast.LENGTH_SHORT).show();
            String longitude = "Longitude: " + loc.getLongitude();
            Log.v(TAG, longitude);
            String latitude = "Latitude: " + loc.getLatitude();
            Log.v(TAG, latitude);
            Geocoder geocoder = new Geocoder(MainActivity.this, Locale.getDefault());
            List<Address> addresses = geocoder.getFromLocation(loc.getLatitude(), loc.getLongitude(), 1);
            String cityName = addresses.get(0).getAddressLine(0);
            String stateName = addresses.get(0).getAddressLine(1);
            String countryName = addresses.get(0).getAddressLine(2);
            longi=String.valueOf(loc.getLongitude());lati=String.valueOf(loc.getLatitude());
            /*------- To get city name from coordinates -------- */
//            String cityName = null;
//            Geocoder gcd = new Geocoder(getBaseContext(), Locale.getDefault());
//            List<Address> addresses;
//            try {
//                addresses = gcd.getFromLocation(loc.getLatitude(),
//                        loc.getLongitude(), 1);
//                if (addresses.size() > 0) {
//                    System.out.println(addresses.get(0).getLocality());
//                    cityName = addresses.get(0).getLocality();
//                }
//            }
//            catch (IOException e) {
//                e.printStackTrace();
//            }
            String s = longitude + "\n" + latitude + "\n\nMy Current City is: "
                    + cityName;
            // editLocation.setText(s);
            ss=s;
            longi=String.valueOf(loc.getLongitude());
            lati=String.valueOf(loc.getLatitude());cityn=cityName;
                  Toast.makeText(MainActivity.this, ss,Toast.LENGTH_SHORT).show();
        }
        catch (IOException ex) {
            Logger.getLogger(MainActivity.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void onProviderDisabled(String provider) {}

    @Override
    public void onProviderEnabled(String provider) {}

    @Override
    public void onStatusChanged(String provider, int status, Bundle extras) {}
}
}
