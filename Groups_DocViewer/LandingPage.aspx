<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="Groups_DocViewer.LandingPage" %>
<%@ Import Namespace="Groupdocs.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Group Docs Viewer</title>
    <%=Viewer.CreateScriptLoadBlock().LoadJquery(true).LoadJqueryUi(true).UseHttpHandlers()%>
    <style>
            body {
                overflow:  hidden;
            }
    </style>
</head>
<body>
        <div id="DocViewer" style="width: 100%; height: 100%;"></div>
        <%= Viewer.ClientCode()
            .TargetElementSelector("#DocViewer")
            .FilePath("mcqs.pdf")
            .UseHtmlBasedEngine(true)
            .UseInnerThumbnails(false).OpenThumbnails(false)
            .SupportPageRotation()
        %>
        <script type="text/javascript">
            function Check() {
                var new_width = $(window).width();
                $("#DocViewer").groupdocsViewer("setWidth", new_width - 10);
                var threshold = 860;
                if (new_width < threshold) {
                    var new_zoom = new_width * 100 / threshold;
                    $("#DocViewer").groupdocsViewer("setZoom", new_zoom);
                } else {
                    $("#DocViewer").groupdocsViewer("setZoom", 100);
                }
            }
            $(document).ready(function () {
                $(document).bind('touchstart,touchmove', function (e) {
                    e.preventDefault();
                });
                var containerElement = $("#DocViewer");
                containerElement.groupdocsViewer("on", "documentLoadCompleted.groupdocs",
                function (e) {
                    Check();
                });
            });

            $(window).resize(function () {
                Check();
            });
        </script>
</body>
</html>

