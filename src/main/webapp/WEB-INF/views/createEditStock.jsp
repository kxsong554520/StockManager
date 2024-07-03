<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <body>
        <div class="container mt-5 text-dark">
            <h2 class="mb-4">
                <c:choose>
                    <c:when test="${stock.stockId!=null}">
                        Edit Stock
                    </c:when>
                    <c:otherwise>
                        Create Stock
                    </c:otherwise>
                </c:choose>
            </h2>
            <form action="<c:choose><c:when test='${stock.stockId!=null}'>/stock/edit/${stock.supplier.supplierId}</c:when><c:otherwise>/stock/create</c:otherwise></c:choose>" method="post">
                <div class="form-group">
                    <label for="stockName">Item Name</label>
                    <input type="text" class="form-control" id="stockName" name="stockName"
                        value="${stock.stockName}" required>
                    <div class="invalid-feedback">
                        Please provide a name for the stock.
                    </div>
                </div>
                <div class="form-group">
                    <label for="stockLocation">Shelf</label>
                    <select class="form-control" id="stockLocation" name="stockLocation" required>
                        <option value="">Select a shelf</option>
                        <option value="A" ${stock.stockLocation == 'A' ? 'selected' : ''}>A</option>
                        <option value="B" ${stock.stockLocation == 'B' ? 'selected' : ''}>B</option>
                        <option value="C" ${stock.stockLocation == 'C' ? 'selected' : ''}>C</option>
                        <option value="D" ${stock.stockLocation == 'D' ? 'selected' : ''}>D</option>
                        <option value="E" ${stock.stockLocation == 'E' ? 'selected' : ''}>E</option>
                        <option value="F" ${stock.stockLocation == 'F' ? 'selected' : ''}>F</option>
                        <option value="G" ${stock.stockLocation == 'G' ? 'selected' : ''}>G</option>
                        <option value="H" ${stock.stockLocation == 'H' ? 'selected' : ''}>H</option>
                        <option value="I" ${stock.stockLocation == 'I' ? 'selected' : ''}>I</option>
                        <option value="J" ${stock.stockLocation == 'J' ? 'selected' : ''}>J</option>
                    </select>
                    <div class="invalid-feedback">
                        Please indicate the shelf location of the stock.
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="expiryDate">Expiry Date</label>
                    <input type="date" class="form-control" id="expiryDate" name="expiryDate"
                        value="${stock.expiryDate}" required>
                    <div class="invalid-feedback">
                        Please provide a valid date.
                    </div>
                </div>

                <div class="form-group">
                    <label for="quantity">Quantity</label>
                    <input type="text" class="form-control" id="quantity" name="quantity"
                        value="${stock.quantity}" required>
                    <div class="invalid-feedback">
                        Please provide a valid quantity.
                    </div>
                </div>

                <div class="form-group">
                    <label for="costPerUnit">Cost Per Unit (RM)</label>
                    <input type="text" class="form-control" id="costPerUnit" name="costPerUnit"
                        value="${stock.costPerUnit}" required>
                    <div class="invalid-feedback">
                        Please provide a valid cost.
                    </div>
                </div>

                <div class="form-group">
                    <label for="sellPricePerUnit">Selling Price Per Unit (RM)</label>
                    <input type="text" class="form-control" id="sellPricePerUnit" name="sellPricePerUnit"
                        value="${stock.sellPricePerUnit}" required>
                    <div class="invalid-feedback">
                        Please provide a valid selling price.
                    </div>
                </div>

                <div class="form-group">
                    <label for "supplierId"> Supplier </label>
                    <select name="supplierId" id="supplierId">
                        <c:forEach var="supplier" items="${supplierList}">
                            <option value="${supplier.supplierId}" ${stock.supplier != null && stock.supplier.supplierId == supplier.supplierId ? 'selected' : ''}>${supplier.supplierName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for "staffId"> Staff in charge </label>
                    <select name="staffId" id="staffId">
                        <c:forEach var="staff" items="${staffList}">
                            <option value="${staff.staffId}" ${stock.staff != null && stock.staff.staffId == staff.staffId ? 'selected' : ''}>${staff.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                <c:choose>
                    <c:when test="${not empty stock.stockId}">
                        <input type="hidden" name="stockId" value="${stock.stockId}">
                        <button type="submit" class="btn btn-primary">Update Stock</button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="btn btn-primary">Create Stock</button>
                    </c:otherwise>
                </c:choose>
                <a href="/stock" class="btn btn-secondary">Back to Stock List</a>
                </div>
            </form>
        </div>
    </body>

    </html>