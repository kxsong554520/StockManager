<%-- 
    Document   : login
    Created on : 24 May 2024, 12:30:54 AM
    Author     : KXSONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>
            .container { 
                background-color: lightblue;
                margin-top: 50px;
                padding: 20px;
                border-radius: 10px;
                max-width: 400px;
            }
            header {
                background-color: cyan;
                padding: 20px;
                text-align: center;
            }
            header img {
                width: 50px;
                height: 50px;
            }

        </style>
    </head>

    <body>
        <header>
            <div class="d-flex align-items-center">
                <img src="../img/logo.png" alt="logo" class="rounded-circle" style="height: 50px; width: 50px;"/>
                <h1 class="ms-3 mb-0">Stock Management System</h1>
            </div>            
        </header>

        <div class="container">
            <h2 class="text-center">Login</h2>
            <form method="post" action="">
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
                        <a href="register.jsp" class="btn btn-link me-2">Register (owner only)</a>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>

        
    </body>
</html>
