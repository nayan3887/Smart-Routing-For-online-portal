<%@page import="ChartDirector.*" %>
<%
// The value to display on the meter
double value = 27.48;

// Create an AngularMeter object of size 200 x 115 pixels, with silver background
// color, black border, 2 pixel 3D border border and rounded corners
AngularMeter m = new AngularMeter(200, 115, Chart.silverColor(), 0x000000, 2);
m.setRoundedFrame();

// Set the meter center at (100, 100), with radius 85 pixels, and span from -90 to
// +90 degress (semi-circle)
m.setMeter(100, 100, 85, -90, 90);

// Meter scale is 0 - 100, with major tick every 20 units, minor tick every 10 units,
// and micro tick every 5 units
m.setScale(0, 100, 20, 10, 5);

// Set 0 - 60 as green (66FF66) zone
m.addZone(0, 60, 0, 85, 0x66ff66);

// Set 60 - 80 as yellow (FFFF33) zone
m.addZone(60, 80, 0, 85, 0xffff33);

// Set 80 - 100 as red (FF6666) zone
m.addZone(80, 100, 0, 85, 0xff6666);

// Add a text label centered at (100, 60) with 12 pts Arial Bold font
m.addText(100, 60, "PSI", "Arial Bold", 12, Chart.TextColor, Chart.Center);

// Add a text box at the top right corner of the meter showing the value formatted to
// 2 decimal places, using white text on a black background, and with 1 pixel 3D
// depressed border
m.addText(156, 8, m.formatValue(value, "2"), "Arial", 8, 0xffffff).setBackground(
    0x000000, 0, -1);

// Add a semi-transparent blue (40666699) pointer with black border at the specified
// value
m.addPointer(value, 0x40666699, 0x000000);

// Output the chart
String chart1URL = m.makeSession(request, "chart1");
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Semi-Circle Meter
</div>
<hr color="#000080">
<div style="font-size:9pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
</body>
</html>

