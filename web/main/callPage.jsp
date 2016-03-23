<%-- 
    Document   : guestPage
    Created on : Mar 18, 2016, 11:06:53 AM
    Author     : Chino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../loginResource/general_css.css"/>
        <title>ProCon - The Professional Consultation Site</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body class="full_bg">
        <div class="page_header_zone">
            <div class="page_header_home"><img src="../loginResource/title_image.png" alt="ProCon"></div>
            
            <div class="page_header_buttons_zone">
                <a href="guestPage.jsp"><div class="page_header_button">Back</div></a>
            </div>

        </div>
            <div class="main_content_card" style="height: 700px">
                <div class="card_title_zone" style="height:26px"/>
                <div class="card_element centered_in_card" style="padding-top: 40px">
                    <object type="application/x-shockwave-flash" data="http://releases.flowplayer.org/swf/flowplayer-3.2.18.swf" width="640" height="480" id="flashvideo" name="flashvideo">
                            <param name="movie" value="http://releases.flowplayer.org/swf/flowplayer-3.2.18.swf" />
                            <param name="flashvars" value='config={"clip":"http://188.166.204.23:8090/live.flv"}' />
                            <param name="islive" value="true" />
                            <param name="allowfullscreen" value="true" />
                            <param name="allowscriptaccess" value="always" />
                            <param name="play" value="true" />
                            <param name="bgcolor" value="000000" />
                            <param name="wmode" value="opaque" />
                    </object>
                </div>
            </div>
    </body>
</html>

