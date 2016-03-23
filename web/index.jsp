<html>
    <head>
        <link rel="stylesheet" type="text/css" href="loginResource/general_css.css"/>
        <title>ProCon - The Professional Consultation Site</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body class="full_bg">
        <div class="page_header_zone">
            <div class="page_header_home"><img src="loginResource/title_image.png" alt="ProCon"></div>
        </div><br/>
        <form name="login_form" method="post" action="main/login">
            <div class="main_content_card">
                <div class="card_title_zone">
                    Already an existing user?
                </div>
                <div class="card_element centered_in_card">
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="user_name" required="required"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="user_pass" required="required"/></td>
                        </tr>
                    </table>
                </div>
                <div class="card_button_zone centered_in_card">
                    <input type="submit" value="Sign-in"/>
                </div>
            </div><br/>
        </form>
        
        <form name="register_form" method="post" action="main/register">
            <div class="main_content_card">
                <div class="card_title_zone">
                    Not yet Registered?
                </div>

                <div class="card_element centered_in_card">
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="user_name" required="required"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="user_pass" required="required"/></td>
                        </tr>
                        <tr><td><br/></td></tr>
                        <tr>
                            <td>First Name:</td>
                            <td><input type="text" name="first_name" required="required"/></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><input type="text" name="last_name" required="required"/></td>
                        </tr>
                        <tr>
                            <td>Profession:</td>
                            <td><input type="text" name="usr_profession" required="required"/></td>
                        </tr>
                        <tr>
                            <td>Account Class:</td>
                            <td><input type="radio" name="act_class" value="non-pro"/> Non-Professional</td>
                        </tr>
                        <tr>
                            <td/>
                            <td><input type="radio" name="act_class" value="pro"/> Professional</td>
                        </tr>
                        <tr>
                            <td>Age:</td>
                            <td><input type="number" name="age" required="required" maxlength="3" min="1" max="99"/></td>
                        </tr>
                        <tr>
                            <td>Gender:</td>
                            <td><input type="text" name="usr_gender" required="required" maxlength="1" pattern="[MF]{1}" /></td>
                        </tr>
                    </table>
                </div>
                
                <div class="card_button_zone centered_in_card">
                    <input type="submit" value="Register"/>
                </div>
            </div><br/>
        </form>

        <div class="main_content_card">
            <div class="card_title_zone">
                Not planning to Register?
            </div>
            <div class="card_button_zone centered_in_card">
                <a href="main/mainPage.jsp?myID=0"><div class="card_button">Enter as Guest</div></a>
            </div>
        </div>
    </body>
</html>
