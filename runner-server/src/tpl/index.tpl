<!DOCTYPE html>
<html>
    <head>
        <title>login</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css" />
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="js/jquery.mobile-1.4.5.min.js"></script>
        <script type="text/javascript" src="js/cordova.js"></script>

        <script type="text/javascript" src="js/qr/src/grid.js"></script>
        <script type="text/javascript" src="js/qr/src/version.js"></script>
        <script type="text/javascript" src="js/qr/src/detector.js"></script>
        <script type="text/javascript" src="js/qr/src/formatinf.js"></script>
        <script type="text/javascript" src="js/qr/src/errorlevel.js"></script>
        <script type="text/javascript" src="js/qr/src/bitmat.js"></script>
        <script type="text/javascript" src="js/qr/src/datablock.js"></script>
        <script type="text/javascript" src="js/qr/src/bmparser.js"></script>
        <script type="text/javascript" src="js/qr/src/datamask.js"></script>
        <script type="text/javascript" src="js/qr/src/rsdecoder.js"></script>
        <script type="text/javascript" src="js/qr/src/gf256poly.js"></script>
        <script type="text/javascript" src="js/qr/src/gf256.js"></script>
        <script type="text/javascript" src="js/qr/src/decoder.js"></script>
        <script type="text/javascript" src="js/qr/src/qrcode.js"></script>
        <script type="text/javascript" src="js/qr/src/findpat.js"></script>
        <script type="text/javascript" src="js/qr/src/alignpat.js"></script>
        <script type="text/javascript" src="js/qr/src/databr.js"></script>

        <script type="text/javascript" src="js/api.camera.js"></script>

        <script type="text/javascript">
            $(document).ready(function(){
                $("#loginSubmit").click(function(){
                    var userid = $("#login-user-name").val();
                    var password = $("#login-password").val();
                    
                    $.ajax({
                        url: "http://127.0.0.1:8080/resignaaa",
                        type: "post",
                        data: {
                            userid: userid,
                            password: password
                        },
                        datatype: "json",
                        async: true,
                        success: function(data) {
                            alert("echo: " + data);
                            if (data["meg"]) {
                                $("#meg").text("ok!!!");
                            } else {
                                $("#meg").text("error!!!");
                            }
                        },
                        error: function(XMLHttpRequest, info, e){
                            alert("error: " + info);
                        }
                    });
                });
            });

            function read(a) {
                $("#qrContent").text(a);
            }

            function captureAndDecode() {
                navigator.camera.getPicture(function(image) {
                    qrcode.callback = read; 
                    qrcode.decode("data:image/jpeg;base64," + image);
                    $("#qrContent").text("decoding");
                }, function(e) {
                    console.log("camera error: " + e);
                }, { 
                    quality: 20,
                    destinationType: destinationType.DATA_URL,
                    targetWidth: 640,
                    targetHeight: 480
                }); 
            }
            
        </script>
	</head>

    <body>
    	<div data-role="page">
    		<div data-role="header">
                <a href="#about" data-rel="dialog" data-transition="pop"
                    class="ui-btn-left ui-btn ui-btn-inline ui-mini ui-corner-all">About</a>
                <h1>Login</h1>
            </div>
            <div data-role="content">
            	<form>
                    <input id="login-user-name" name="login-user-name" type="text" data-clear-btn="true"
                        placeholder="User name" />
                    <input id="login-password" name="login-password" type="password" data-clear-btn="true" 
                        placeholder="Password" />
                    <a id="loginSubmit" class="ui-btn ui-corner-all">Login</a>
                    <a href="#sign_up_page" class="ui-btn ui-corner-all">Signup</a>
                </form>

                <p id="meg">---</p>
                <a href="#user_home_page">user-preview</a>
            </div>
    	</div>

        <div data-role="page" id="about">
            <div data-role="header">
                <h1>About this app</h1>
            </div>
            <div data-role="content">
                <p>App for user to access our system. Thanks.</p>
            </div>

        </div>

        <div data-role="page" id="user_home_page">
            <div data-role="header">
                <a href="index.html" data-rel="back"
                    class="ui-btn-left ui-btn ui-btn-inline ui-mini ui-corner-all">Sign out</a>
                <h1 id="userNameHead">adolli</h1>
                <a href="#"
                    class="ui-btn-right ui-btn ui-btn-inline ui-mini ui-corner-all">Setting</a>
            </div>
            <div data-role="content">
                <table data-role="table" id="table-column-toggle" data-mode="columntoggle" class="ui-responsive table-stroke">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th data-priority="1">Value</th>
                            <th data-priority="2">Global rank</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Total energy</td>
                            <td>100 kWh</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>Fitness time</td>
                            <td>10h 12min</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>CO2 reduced</td>
                            <td>1.2 kg</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>---</td>
                            <td>---</td>
                            <td>1</td>
                        </tr>
                     </tbody>
                </table>

                <button onclick="captureAndDecode();">Start to exercise</button><br>
                <p id="qrContent"></p>
                
            </div>
        </div>

        <div data-role="page" id="sign_up_page">
            <script type="text/javascript">
                $(document).ready(function(){
                    $("#signup-submit").click(function(){
                        if ($("#sugnup-password").val() != $("#sugnup-password-repeat").val()) {
                            $("#password-check").text("passwords are not the same");
                            $("#password-check").show();
                        } else {
                            $("#password-check").hide();
                        }
                    });
                });
            </script>
            <div data-role="header">
                <a href="index.html" data-rel="back"
                    class="ui-btn-left ui-btn ui-btn-inline ui-mini ui-corner-all">Back</a>
                <h1>New user</h1>
                <a href="#" id="signup-submit"
                    class="ui-btn-right ui-btn ui-btn-inline ui-mini ui-corner-all">Ok</a>
            </div>
            <div data-role="content">
                <form>
                    <input id="sugnup-user-name" type="text" data-clear-btn="true" placeholder="User name" />
                    <input id="sugnup-password" type="password" data-clear-btn="true" placeholder="Password" />
                    <input id="sugnup-password-repeat" type="password" data-clear-btn="true" placeholder="Password repeat" />
                    <p id="password-check" style="color:red;"></p>
                </form>
            </div>
        </div>

    </body>

</html>
