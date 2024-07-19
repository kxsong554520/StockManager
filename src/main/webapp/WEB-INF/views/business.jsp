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
        <div class="container text-black">
            <div>
                <h2>Business Summary</h2>
                <p>Total Cost (RM): ${totalCost}</p>
                <p>Total Sales (RM): ${totalSales}</p>
                <p>Profit (RM): ${profit}</p>
                <br>
                <p>Total Staff: ${totalStaff}</p>
                <p>How Many Types Of Item In Stock: ${totalStocks}</p>
                <p>Total Orders In Progress: ${totalOrders}</p>
                <p>Total Sales Recorded: ${totalSold}</p>
                <p>Total Supplier Contacts: ${totalSupplier}</p>
            </div>
        </div>
    </body>

    </html>