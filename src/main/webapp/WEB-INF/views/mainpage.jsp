<!DOCTYPE html>
<html>

<head>
    <title>Stock Manager</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://kit.fontawesome.com/57d52e4250.js" crossorigin="anonymous"></script>

</head>

<body class="text-light" style="background-color:burlywood">
    <header>
        <jsp:include page="header.jsp" />
    </header>
    <div class="mt-0 py-0">
        <jsp:include page="${pageContent}" />
    </div>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>

</html>