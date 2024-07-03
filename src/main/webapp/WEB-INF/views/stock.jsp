<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <body>
        <div class>
            <div class="navbar mt-0 py-0" style="background-color: lightcoral; padding: 10px; margin-bottom: 10px;">
                <a href="<c:url value='/stock' />"
                    style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Stock</a>
                <a href="<c:url value='/order' />"
                    style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Order</a>
                <a href="<c:url value='/sales' />"
                    style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Sales</a>
                <a href="<c:url value='/' />"
                    style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Log Out</a>
            </div>          
            <div>
                <a href="/stock/create" class="btn btn-primary">Create New Stock</a>
            </div>
            <h2 class="mb-4 text-dark">Stock List</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Stock ID</th>
                        <th scope="col">Stock Name</th>
                        <th scope="col">Stock Location</th>
                        <th scope="col">Cost Per Unit</th>
                        <th scope="col">Selling Price Per Unit</th>
                        <th scope="col">Expiry Date</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Supplier Name</th>
                        <th scope="col">Staff In Charge</th>
                        <th scope="col" colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stock" items="${stockList}">
                        <tr>
                            <td>${stock.stockId}</td>
                            <td>${stock.stockName}</td>
                            <td>${stock.stockLocation}</td>
                            <td>${stock.costPerUnit}</td>
                            <td>${stock.sellPricePerUnit}</td>
                            <td>${stock.expiryDate}</td>
                            <td>${stock.quantity}</td>
                            <td>${stock.supplier != null ? stock.supplier.supplierName : 'N/A'}</td>
                            <td>${stock.staff != null ? stock.staff.name : 'N/A'}</td>
                            <td><a href="/stock/edit/${stock.stockId}" class="btn btn-primary btn-sm">Edit</a></td>
                            <td><a href="/stock/delete/${stock.stockId}" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>

    </html>