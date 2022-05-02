<%@page import="ChartDirector.*" %>
<%
// The data for the bar chart
double[] data = {85, 156, 179.5, 211, 123};

// The labels for the bar chart
String[] labels = {"Mon", "Tue", "Wed", "Thu", "Fri"};

// The colors for the bar chart
int[] colors = {0xb8bc9c, 0xa0bdc4, 0x999966, 0x333366, 0xc3c3e6};

// Create a XYChart object of size 300 x 220 pixels. Use golden background color. Use
// a 2 pixel 3D border.
XYChart c = new XYChart(300, 220, Chart.goldColor(), -1, 2);

// Add a title box using 10 point Arial Bold font. Set the background color to
// metallic blue (9999FF) Use a 1 pixel 3D border.
c.addTitle("Daily Network Load", "Arial Bold", 10).setBackground(Chart.metalColor(
    0x9999ff), -1, 1);

// Set the plotarea at (40, 40) and of 240 x 150 pixels in size
c.setPlotArea(40, 40, 240, 150);

// Add a multi-color bar chart layer using the given data and colors. Use a 1 pixel
// 3D border for the bars.
c.addBarLayer3(data, colors).setBorderColor(-1, 1);

// Set the labels on the x axis.
c.xAxis().setLabels(labels);

// Output the chart
String chart1URL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap1 = c.getHTMLImageMap("", "", "title='{xLabel}: {value} GBytes'");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Multi-Color Bar Chart
</div>
<hr color="#000080">
<div style="font-size:9pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=imageMap1%></map>
</body>
</html>
