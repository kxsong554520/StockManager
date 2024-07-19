<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>    
    <body>
        <div class="navbar mt-0 py-0" style="background-color: lightcoral; padding: 10px; margin-bottom: 10px;">
            <a href="<c:url value='/business' />"
                style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Business Summary</a>
            <a href="<c:url value='/staff' />"
                style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Staff</a>
            <a href="<c:url value='/supplier' />"
                style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Supplier</a>
            <a href="<c:url value='/register' />"
                style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">New Staff</a>
            <a href="<c:url value='/' />"
                style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Log Out</a>
        </div>

        <div class>
            <div>
                <a href="/supplier/create" class="btn btn-primary">Create New Supplier</a>
            </div>
            <h2 class="mb-4 text-dark">Supplier List</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Supplier ID</th>
                        <th scope="col">Supplier Name</th>
                        <th scope="col">Supplier Phone Number</th>
                        <th scope="col">Supplier Email</th>
                        <th scope="col" colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="supplier" items="${supplierList}">
                        <tr>
                            <td>${supplier.supplierId}</td>
                            <td>${supplier.supplierName}</td>
                            <td>${supplier.supplierNo}</td>
                            <td>${supplier.supplierEmail}</td>
                            <td><a href="/supplier/edit/${supplier.supplierId}" class="btn btn-primary btn-sm">Edit</a></td>
                            <td><a href="/supplier/delete/${supplier.supplierId}" class="btn btn-danger btn-sm">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>