<%@page import="ChartDirector.*" %>
<%@page import="javax.servlet.http.*" %>
<%!
// A simple structure to represent a chart image with an image map
private static class ImageWithHotSpot
{
    String imageURL;
    String imageMap;
}

// Function to create the demo charts
ImageWithHotSpot createChart(HttpServletRequest request, int index)
{
    // Determine the donut inner radius (as percentage of outer radius) based on
    // input parameter
    int donutRadius = index * 25;

    // The data for the pie chart
    double[] data = {10, 10, 10, 10, 10};

    // The labels for the pie chart
    String[] labels = {"Marble", "Wood", "Granite", "Plastic", "Metal"};

    // Create a PieChart object of size 150 x 120 pixels, with a grey (EEEEEE)
    // background, black border and 1 pixel 3D border effect
    PieChart c = new PieChart(150, 120, 0xeeeeee, 0x000000, 1);

    // Set donut center at (75, 65) and the outer radius to 50 pixels. Inner radius
    // is computed according donutWidth
    c.setDonutSize(75, 60, 50, (int)(50 * donutRadius / 100));

    // Add a title to show the donut width
    c.addTitle("Inner Radius = " + donutRadius + " %", "Arial", 10).setBackground(
        0xcccccc, 0);

    // Draw the pie in 3D
    c.set3D(12);

    // Set the pie data and the pie labels
    c.setData(data, labels);

    // Disable the sector labels by setting the color to Transparent
    c.setLabelStyle("", 8, Chart.Transparent);

    // Output the chart
    ImageWithHotSpot ret = new ImageWithHotSpot();
    ret.imageURL = c.makeSession(request, "chart" + index);

    // Include tool tip for the chart
    ret.imageMap = c.getHTMLImageMap("", "",
        "title='{label}: {value}kg ({percent}%)'");

    return ret;
}
%>
<%
ImageWithHotSpot chart0 = createChart(request, 0);
ImageWithHotSpot chart1 = createChart(request, 1);
ImageWithHotSpot chart2 = createChart(request, 2);
ImageWithHotSpot chart3 = createChart(request, 3);
ImageWithHotSpot chart4 = createChart(request, 4);
%>
<html>
<body style="margin:5px 0px 0px 5px">
<div style="font-size:18pt; font-family:verdana; font-weight:bold">
    Donut Width
</div>
<hr color="#000080">
<div style="font-size:9pt; font-family:verdana; margin-bottom:1.5em">
    <a href="viewsource.jsp?file=<%=request.getServletPath()%>">View Source Code</a>
</div>
<img src='<%=response.encodeURL("getchart.jsp?"+chart0.imageURL)%>'
    usemap="#map0" border="0">
<map name="map0"><%=chart0.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart1.imageURL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=chart1.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart2.imageURL)%>'
    usemap="#map2" border="0">
<map name="map2"><%=chart2.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart3.imageURL)%>'
    usemap="#map3" border="0">
<map name="map3"><%=chart3.imageMap%></map>
<img src='<%=response.encodeURL("getchart.jsp?"+chart4.imageURL)%>'
    usemap="#map4" border="0">
<map name="map4"><%=chart4.imageMap%></map>
</body>
</html>

