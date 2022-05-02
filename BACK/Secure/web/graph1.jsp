<%@page import="ChartDirector.BarLayer"%>
<%@page import="ChartDirector.XYChart"%>
<%@page import="ChartDirector.Chart"%>
<%@page import="action.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dynamic Route Planning</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        <link href="css/style.css" rel="stylesheet">
        <script>
         
document.getElementById("mySelect").onchange = function(){
  
}
            
        </script>
    </head>
    <body>
        <div id="container" class="container">
            <div style="width: 1200px;margin: 30px;color: white">
                <center><h1>Enhanced Automated Planning and Routing System for Product Delivery</h1></center>
            </div>
            <div>
             <ul class="nav nav-justified">
                    <li class="active"><a href="uview.jsp">Home</a></li>
                    <li><a href="udetails.jsp">Profile</a></li>
                    <li><a href="cartdetails.jsp">Cart</a></li>
                    <li><a href="search.jsp">Product Search</a></li>
                      <li><a href="graph1.jsp">Graphs</a></li>
                            <li><a href="feed.jsp">Feedback</a></li>
                    <li><a href="index.jsp">Logout</a></li>
                </ul>
            </div><br />
             <%
          
            %>  
                
                <div  class="abstract" align="center">
                      <center><h1 style="color: white">Graphs</h1>  </center>
                    <%
                     
                        try {
                            int cnt=0,cnt2=0,cnt3=0;
                            Connection con = Database.getConnection();
                            Statement st = con.createStatement();
                            
                              
                            ResultSet r = st.executeQuery("select distinct(pitems) from product");
                            %>
                            <form method="get">
                                <select id="mySelect" name="values" style=" font-size: 14pt; color: #998877">
                                <%
                            while (r.next()) {
                                
                                %>
                                
                                      <option value=<%=r.getString(1) %>><%=r.getString(1)%></option>
 
                 
<%
                             }
               %>
                              </select>
                              <input type="submit" value="Generate graph" style=" font-size: 12pt"/>
                            </form>
                                      <%
 

                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("" + e.getMessage());
                        }
                      
                        //out.println(request.getQueryString());
                        String[] toks= new String[2];
                        if(request.getQueryString()!=null)
                        {
                        if(!request.getQueryString().contains("="))
                        {
                    %>  
                    <br/><br/>
                <%
                        }else
                        {
                                 try {
                            int cnt=0,cnt2=0,cnt3=0;
                            String[] newtar=new String[200];
                            Connection con = Database.getConnection();
                            toks=request.getQueryString().split("=");
                           // out.println(rr);
                            String[] fintar=new String[50];
                            int c=0;
                              int cc=0,cnt0=0;
                                Statement st = con.createStatement();
                               ResultSet rs7 = st.executeQuery("select distinct(optarget) from feed where feedback='"+toks[1]+"'");
                            while (rs7.next()) {fintar[cc]=rs7.getString(1);
                           // out.println(fintar[cc]);
                            cc++;
                           
                            }
                            int flg=0;
                            String str="";
                            for(int j=0;j<cc;j++){
                                Statement st2 = con.createStatement();
                               ResultSet rs72 = st2.executeQuery("select distinct(optarget) from blocklist where product='"+toks[1]+"'");
                            while (rs72.next()) {
                                flg=0;
                                if(rs72.getString(1).equalsIgnoreCase(fintar[j])){
                                flg=0;break;
                                }
                                else{
                                 
                                  flg=1;
                               str=rs72.getString(1);  
                                   break;
                                }
                             }
                            if(flg==1){ 
                                    fintar[cc]=str;
                                cc++;
                                flg=0;
                            break;
                            }
                            }
                            int ctot=cc+c;
                             String[] targt=new String[ctot];
                             double[] targc1=new  double[ctot];
                              double[] targc2=new  double[ctot];
                              double[] targc3=new  double[ctot];
                                Statement st2 = con.createStatement();
                            ResultSet rs1 = st2.executeQuery("select distinct(optarget) from feed where feedback='"+toks[1]+"'");
                          
                            while (rs1.next()) {
                          //  cnt1++;    
cnt=0;cnt2=0;cnt3=0;
          targt[cnt0]=rs1.getString(1);
      try{
            Statement st3 = con.createStatement();
                            ResultSet rs = st3.executeQuery("select * from feed where rating='Positive' and feedback='"+toks[1]+"' and optarget='"+targt[cnt0]+"'");
                            while (rs.next()) {
                            cnt++;    
         }
      }catch(Exception ex){out.println(" there"+ex);}    
       try{
               ResultSet rs2 = st.executeQuery("select * from blocklist where rating='Negative' and product='"+toks[1]+"' and optarget='"+targt[cnt0]+"'");
                            while (rs2.next()) {
                            cnt3++;    
         }
                            }catch(Exception ex){out.println(" there2"+ex);}  
       try{
             Statement st4 = con.createStatement();
       ResultSet rs3 = st4.executeQuery("select * from feed where rating='Neutral' and feedback='"+toks[1]+"' and optarget='"+targt[cnt0]+"'");
                            while (rs3.next()) {
                            cnt2++;    
         }
            }catch(Exception ex){out.println(" there3"+ex);} 
       
targc1[cnt0]=cnt;
targc2[cnt0]=cnt2;
targc3[cnt0]=cnt3;
    cnt0++;
                            }
                            int neg1=0,neg2=0;
                      for(int g=0;g<c;g++){ 
                          neg1=0;neg2=0;
                              try{
            Statement st3 = con.createStatement();
                            ResultSet rs = st3.executeQuery("select * from feed where rating='Positive' and feedback='"+toks[1]+"' and optarget='"+newtar[g]+"'");
                            while (rs.next()) {
                            neg1++;    
         }
      }catch(Exception ex){out.println(" there"+ex);}    
       try{
               ResultSet rs2 = st.executeQuery("select * from blocklist where rating='Negative' and product='"+toks[1]+"' and optarget='"+newtar[g]+"'");
                            while (rs2.next()) {
                            neg2++;    
         }
       }
                            catch(Exception ex){out.println(" there2"+ex);} 
       targt[cnt0]=newtar[g];
                      targc1[cnt0]=neg1;

targc3[cnt0]=neg2;
    cnt0++;
                      } 
// The data for the bar chart
double[] data0 = targc1;
double[] data1 = targc2;
double[] data2 = targc3;
String[] labels1 = targt;
// Create a XYChart object of size 540 x 375 pixels
XYChart c1 = new XYChart(1040, 375);
// Add a title to the chart using 18 pts Times Bold Italic font
c1.addTitle("Reviews on Product", "Times New Roman Bold Italic", 18);
// Set the plotarea at (50, 55) and of 440 x 280 pixels in size. Use a vertical
// gradient color from light blue (f9f9ff) to blue (6666ff) as background. Set border
// and grid lines to white (ffffff).
c1.setPlotArea(50, 55, 1000, 280, c1.linearGradientColor(0, 55, 0, 335, 0xf9f9ff,
    0x6666ff), -1, 0xffffff, 0xffffff);
// Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
// font, with transparent background.
c1.addLegend(50, 28, false, "Arial Bold", 10).setBackground(Chart.Transparent);
// Set the x axis labels
c1.xAxis().setLabels(labels1);

// Draw the ticks between label positions (instead of at label positions)
c1.xAxis().setTickOffset(0.5);

// Set axis label style to 8pts Arial Bold
c1.xAxis().setLabelStyle("Arial Bold", 8);
c1.yAxis().setLabelStyle("Arial Bold", 8);

// Set axis line width to 2 pixels
c1.xAxis().setWidth(2);
c1.yAxis().setWidth(2);

// Add axis title
c1.yAxis().setTitle("Number of Hits");

// Add a multi-bar layer with 3 data sets
BarLayer layer = c1.addBarLayer2(Chart.Side);
layer.addDataSet(data0,0x00ff00 , "Positive");
layer.addDataSet(data2,0xff0000 , "Negative");

// Set bar border to transparent. Use glass lighting effect with light direction from
// left.
layer.setBorderColor(Chart.Transparent, Chart.glassEffect(Chart.NormalGlare,
    Chart.Left));

// Configure the bars within a group to touch each others (no gap)
layer.setBarGap(0.2, Chart.TouchBar);

// Output the chart
String chart1URL1 = c1.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap11 = c1.getHTMLImageMap("", "",
    "title='{dataSetName}  {xLabel}: {value}'");
%>
<hr color="#000080">
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL1)%>'
    usemap="#map1" border="0">
<map name="map1"><%=imageMap11%></map>
<div style="font-size:14pt; font-family:verdana; font-weight:bold; color: lightgoldenrodyellow">
 Rating Graph for <%=toks[1]%>
</div>
    <hr color="#000080" style=" width: 1300px">

<%
     } catch (Exception e) {
                          
                            out.println("get lost " + e);
                        }
                        }} 
                    %>   
                   
                </div>  
        </div> <!-- /container -->
      
    </body>
</html>