<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html> 
<html>
    <head>
        <style>
            .container { 
                background-color: lightblue;
                margin-top: 50px;
                padding: 20px;
                border-radius: 10px;
                max-width: 400px;
            }
            header {
                background-color: orange;
                padding: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            header img {
                width: 50px;
                height: 50px;
            }
            .navbar {
                margin-top: 20px;
            }
            .navbar a {
                margin: 0 10px;
                text-decoration: none;
                color: black;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="d-flex align-items-center">
                <img src="<c:url value='/img/logo.png' />" alt="logo" class="rounded-circle" style="height: 50px; width: 50px;"/>
                <h1 class="ms-3 mb-0 text-dark">Stock Manager</h1>
                
            </div> 
            
        </header>
    </body>
</html>
