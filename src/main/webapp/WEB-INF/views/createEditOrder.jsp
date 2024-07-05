<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <body>
        <div class="container mt-5 text-dark">
            <h2 class="mb-4">
                <c:choose>
                    <c:when test="${order.orderId!=null}">
                        Edit Order
                    </c:when>
                    <c:otherwise>
                        Create Order
                    </c:otherwise>
                </c:choose>
            </h2>
            <form action="<c:choose><c:when test='${order.orderId!=null}'>/order/edit/${order.stock.stockId}</c:when><c:otherwise>/order/create</c:otherwise></c:choose>" method="post">
                <div class="form-group">
                    <label for="orderDate">Order Date</label>
                    <input type="date" class="form-control" id="orderDate" name="orderDate"
                        value="${order.orderDate}" required>
                    <div class="invalid-feedback">
                        Please provide an order date.
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="orderQty">Order Quantity</label>
                    <input type="text" class="form-control" id="orderQty" name="orderQty"
                        value="${order.orderQty}" required>
                    <div class="invalid-feedback">
                        Please provide a valid quantity.
                    </div>
                </div>

                <div class="form-group">
                    <label for="totalCost">Total Cost (RM)</label>
                    <input type="text" class="form-control" id="totalCost" name="totalCost"
                        value="${order.totalCost}" required>
                    <div class="invalid-feedback">
                        Please provide a valid quantity.
                    </div>
                </div>

                <div class="form-group">
                    <label for "stockId"> Stock Name </label>
                    <select name="stockId" id="stockId">
                        <c:forEach var="stock" items="${stockList}">
                            <option value="${stock.stockId}" ${order.stock != null && order.stock.stockId == stock.stockId ? 'selected' : ''}>${stock.stockName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mt-3">
                <c:choose>
                    <c:when test="${not empty order.orderId}">
                        <input type="hidden" name="orderId" value="${order.orderId}">
                        <button type="submit" class="btn btn-primary">Update Order</button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="btn btn-primary">Create Order</button>
                    </c:otherwise>
                </c:choose>
                <a href="/order" class="btn btn-secondary">Back to Order List</a>
                </div>
            </form>
        </div>
    </body>

    </html>