<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <body>
        <div class="container mt-5 text-dark">
            <h2 class="mb-4">
                <c:choose>
                    <c:when test="${supplier.supplierId!=null}">
                        Edit Supplier
                    </c:when>
                    <c:otherwise>
                        Create Supplier
                    </c:otherwise>
                </c:choose>
            </h2>
            <form action="<c:choose><c:when test='${supplier.supplierId!=null}'>/supplier/edit/${supplier.supplierId}</c:when><c:otherwise>/supplier/create</c:otherwise></c:choose>" method="post">
                <div class="form-group">
                    <label for="supplierName">Supplier Name</label>
                    <input type="text" class="form-control" id="supplierName" name="supplierName"
                        value="${supplier.supplierName}" required>
                    <div class="invalid-feedback">
                        Please provide a supplier name.
                    </div>
                </div>
                <div class="form-group">
                    <label for="supplierNo">Supplier No</label>
                    <input type="text" class="form-control" id="supplierNo" name="supplierNo"
                        value="${supplier.supplierNo}" required>
                    <div class="invalid-feedback">
                        Please provide a supplier number.
                    </div>
                </div>
                <div class="form-group">
                    <label for="supplierEmail">Supplier Email</label>
                    <input type="email" class="form-control" id="supplierEmail" name="supplierEmail"
                        value="${supplier.supplierEmail}" required>
                    <div class="invalid-feedback">
                        Please provide a valid email address.
                    </div>
                </div>
                <div class="mt-2">
                <c:choose>
                    <c:when test="${not empty supplier.supplierId}">
                        <input type="hidden" name="supplierId" value="${supplier.supplierId}">
                        <button type="submit" class="btn btn-primary">Update Supplier</button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="btn btn-primary">Create Supplier</button>
                    </c:otherwise>
                </c:choose>
                </div>
                <a href="/supplier" class="btn btn-secondary">Back to Supplier List</a>
            </form>
        </div>
    </body>

    </html>