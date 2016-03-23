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
        </div>
        <div class="main_content_card">
            <div class="card_title_zone">
                Sign-in
            </div>
            <div class="centered_in_card">
                <form name="Login Form" method="post" action="j_security_check">
                    <div class="card_element">Username: </div>
                    <div class="card_element"><input type="text" name="j_username" value="" required/></div>

                    <div class="card_element">Password: </div>
                    <div class="card_element"><input type="password" name="j_password" value="" required/></div>
                    
                    <div class="card_button_zone">
                        <input type="submit" value="Sign-in" />
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>