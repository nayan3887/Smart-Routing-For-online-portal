<%@page import="ChartDirector.*" %>
<%
// The value to display on the meter
double value = 75.35;

// Create an LinearMeter object of size 60 x 265 pixels, using silver background with
// a 2 pixel black 3D depressed border.
LinearMeter m = new LinearMeter(60, 265, Chart.silverColor(), 0, -2);

// Set the scale region top-left corner at (25, 30), with size of 20 x 200 pixels.
// The scale labels are located on the left (default - implies vertical meter)
m.setMeter(25, 30, 20, 200);

// Set meter scale from 0 - 100, with a tick every 10 units
m.setScale(0, 100, 10);

// Set 0 - 50 as green (99ff99) zone, 50 - 80 as yellow (ffff66) zone, and 80 - 100
// as red (ffcccc) zone
m.addZone(0, 50, 0x99ff99);
m.addZone(50, 80, 0xffff66);
m.addZone(80, 100, 0xffcccc);

// Add a deep blue (000080) pointer at the specified value
m.addPointer(value, 0x000080);

// Add a text box label at top-center (30, 5) using Arial Bold/8 pts/deep blue
// (000088), with a light blue (9999ff) background
m.addText(30, 5, "Temp C", "Arial Bold", 8, 0x000088, Chart.TopCenter).setBackground(
    0x9999ff);

// Add a text box to show the value formatted to 2 decimal places at bottom center
// (30, 260). Use white text on black background with a 1 pixel depressed 3D border.
m.addText(30, 260, m.formatValue(value, "2"), "Arial", 8, 0xffffff,
    Chart.BottomCenter).setBackground(0, 0, -1);

// Output the chart
String chart1URL = m.makeSession(request, "chart1");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Vertical Linear Meter
</div>
<hr color="#000080">
<div style="font-size:9pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
</body>
</html>

