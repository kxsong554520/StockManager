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
                <a href="/order/create" class="btn btn-primary">Create New Order</a>
            </div>
            <h2 class="mb-4 text-dark">Order List</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Order Quantity</th>
                        <th scope="col">Total Cost</th>
                        <th scope="col">Stock Name</th>
                        <th scope="col">Order Arrived?</th>
                        <th scope="col" colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.orderQty}</td>
                            <td>${order.totalCost}</td>
                            <td>${order.stock != null ? order.stock.stockName : 'N/A'}</td>
                            <!-- <td><form action="/order/arrive/${order.orderId}" method="POST" class="btn btn-outline-primary btn-sm"><input type="hidden" name="stockId" id = "stockId" value="${order.stock.stockId}"><button type="submit">Arrived</button></form></td> -->
                            <td>
                                <form action="/order/arrive/delete/${order.orderId}" method="POST" class="btn btn-outline-primary btn-sm">
                                  <input type="hidden" name="stockId" id="stockId" value="${order.stock.stockId}">
                                  <input type="checkbox" name="arrived" id="arrivedCheckbox" onchange="this.form.submit();">
                                  <label for="arrivedCheckbox">Arrived</label>
                                </form>
                              </td>
                            <td><a href="/order/edit/${order.orderId}" class="btn btn-primary btn-sm">Edit</a></td>
                            <td><a href="/order/delete/${order.orderId}" class="btn btn-danger btn-sm">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>