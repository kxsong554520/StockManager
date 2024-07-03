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
                <a href="/sales/create" class="btn btn-primary">Record a Sale</a>
            </div>
            <h2 class="mb-4 text-dark">Sale Records</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Sales ID</th>
                        <th scope="col">Customer Name</th>
                        <th scope="col">Sold Quantity</th>
                        <th scope="col">Total Price</th>
                        <th scope="col">Record Date</th>
                        <th scope="col">Stock Name</th>
                        <th scope="col" colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="sales" items="${salesList}">
                        <tr>
                            <td>${sales.salesId}</td>
                            <td>${sales.custName}</td>
                            <td>${sales.soldQty}</td>
                            <td>${sales.totalPrice}</td>
                            <td>${sales.recordDate}</td>
                            <td>${sales.stock != null ? sales.stock.stockName : 'N/A'}</td>
                            <td><a href="/sales/edit/${sales.salesId}" class="btn btn-primary btn-sm">Edit</a></td>
                            <td><a href="/sales/delete/${sales.salesId}" class="btn btn-danger btn-sm">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>