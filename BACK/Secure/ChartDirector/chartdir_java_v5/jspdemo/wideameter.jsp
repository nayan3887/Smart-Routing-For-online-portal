<%@page import="ChartDirector.*" %>
<%@page import="javax.servlet.http.*" %>
<%!
// Function to create the demo charts
String createChart(HttpServletRequest request, int index)
{
    // The value to display on the meter
    double value = 6.5;

    // Create an AugularMeter object of size 200 x 100 pixels with rounded corners
    AngularMeter m = new AngularMeter(200, 100);

    //Set search path to current JSP directory for loading icon images
    m.setSearchPath(getServletConfig().getServletContext(), request);
    m.setRoundedFrame();

    // Set meter background according to a parameter
    if (index == 0) {
        // Use gold background color
        m.setBackground(Chart.goldColor(), 0x000000, -2);
    } else if (index == 1) {
        // Use silver background color
        m.setBackground(Chart.silverColor(), 0x000000, -2);
    } else if (index == 2) {
        // Use metallic blue (9898E0) background color
        m.setBackground(Chart.metalColor(0x9898e0), 0x000000, -2);
    } else if (index == 3) {
        // Use a wood pattern as background color
        m.setBackground(m.patternColor2("wood.png"), 0x000000, -2);
    } else if (index == 4) {
        // Use a marble pattern as background color
        m.setBackground(m.patternColor2("marble.png"), 0x000000, -2);
    } else {
        // Use a solid light purple (EEBBEE) background color
        m.setBackground(0xeebbee, 0x000000, -2);
    }

    // Set the meter center at (100, 235), with radius 210 pixels, and span from -24
    // to +24 degress
    m.setMeter(100, 235, 210, -24, 24);

    // Meter scale is 0 - 100, with a tick every 1 unit
    m.setScale(0, 10, 1);

    // Set 0 - 6 as green (99ff99) zone, 6 - 8 as yellow (ffff00) zone, and 8 - 10 as
    // red (ff3333) zone
    m.addZone(0, 6, 0x99ff99, 0x808080);
    m.addZone(6, 8, 0xffff00, 0x808080);
    m.addZone(8, 10, 0xff3333, 0x808080);

    // Add a title at the bottom of the meter using 10 pts Arial Bold font
    m.addTitle2(Chart.Bottom, "OUTPUT POWER LEVEL\n", "Arial Bold", 10);

    // Add a semi-transparent black (80000000) pointer at the specified value
    m.addPointer(value, 0x80000000);

    // Output the chart
    return m.makeSession(request, "chart" + index);
}
%>
<%
String chart0URL = createChart(request, 0);
String chart1URL = createChart(request, 1);
String chart2URL = createChart(request, 2);
String chart3URL = createChart(request, 3);
String chart4URL = createChart(request, 4);
String chart5URL = createChart(request, 5);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Wide Angular Meters
</div>
<hr color="#000080">
<div style="font-size:9pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart4URL)%>'>
<img src='<%=response.encodeURL("getchart.jsp?"+chart5URL)%>'>
</body>
</html>

