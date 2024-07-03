<%-- 
    Document   : login
    Created on : 24 May 2024, 12:30:54 AM
    Author     : KXSONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
    </head>

    <body>        

        <div class="container text-dark">
            <h2 class="text-center">Login</h2>
            <form method="post" action="/logintopfp">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <div class="container mt-3">
                    <div class="d-flex">
                        <a href="#" onclick="promptPassword()">Register (owner only)</a>
                    </div>
                    <div class="d-flex mt-2" >
                        <button type="submit" class="btn btn-primary" >Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
        function promptPassword() {
            var password = prompt("Please enter the password to register:");
            if (password === "abcd") {
                
                window.location.href = "/register";
            } else {
                alert("Incorrect password. Registration requires owner access.");
            }
        }
        </script>
</html>
