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
        </div><br/>
        <form name="login_form" method="post" action="login">
            <div class="main_content_card">
                <div class="card_title_zone">
                    Already an existing user?
                </div>
                <div class="card_element centered_in_card">
                    <table>
                        <tr>
                            <td colspan="2">Invalid username/password</td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="user_name"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="user_pass"/></td>
                        </tr>
                    </table>
                </div>
                <div class="card_button_zone">
                    <input type="submit" value="Sign-in"/>
                </div>
            </div><br/>
        </form>
    </body>
</html>
