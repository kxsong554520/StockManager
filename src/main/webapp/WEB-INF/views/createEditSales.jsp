<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <body>
        <div class="container mt-5 text-dark">
            <h2 class="mb-4">
                <c:choose>
                    <c:when test="${sales.salesId!=null}">
                        Edit Sale
                    </c:when>
                    <c:otherwise>
                        Create Sale
                    </c:otherwise>
                </c:choose>
            </h2>
            <form action="<c:choose><c:when test='${sales.salesId!=null}'>/sales/edit/${sales.stock.stockId}</c:when><c:otherwise>/sales/create</c:otherwise></c:choose>" method="post">
                <div class="form-group">
                    <label for="custName">Customer Name</label>
                    <input type="text" class="form-control" id="custName" name="custName"
                        value="${sales.custName}" required>
                    <div class="invalid-feedback">
                        Please provide an valid name.
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="soldQty">Sold quantity</label>
                    <input type="text" class="form-control" id="soldQty" name="soldQty"
                        value="${sales.soldQty}" required>
                    <div class="invalid-feedback">
                        Please provide a valid quantity.
                    </div>
                </div>

                <div class="form-group">
                    <label for="totalPrice">Total Price</label>
                    <input type="text" class="form-control" id="totalPrice" name="totalPrice"
                        value="${sales.totalPrice}" required>
                    <div class="invalid-feedback">
                        Please provide a valid price.
                    </div>
                </div>

                <div class="form-group">
                    <label for="recordDate">Record Date</label>
                    <input type="date" class="form-control" id="recordDate" name="recordDate"
                        value="${sales.recordDate}" required>
                    <div class="invalid-feedback">
                        Please provide an order date.
                    </div>
                </div>

                <div class="form-group">
                    <label for "stockId"> Stock Name </label>
                    <select name="stockId" id="stockId">
                        <c:forEach var="stock" items="${stockList}">
                            <option value="${stock.stockId}" ${sales.stock != null && sales.stock.stockId == stock.stockId ? 'selected' : ''}>${stock.stockName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mt-3">
                <c:choose>
                    <c:when test="${not empty sales.salesId}">
                        <input type="hidden" name="salesId" value="${sales.salesId}">
                        <button type="submit" class="btn btn-primary">Update Sale</button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="btn btn-primary">Create Sale</button>
                    </c:otherwise>
                </c:choose>
                <a href="/sales" class="btn btn-secondary">Back to Sales Record</a>
                </div>
            </form>
        </div>
    </body>

    </html>