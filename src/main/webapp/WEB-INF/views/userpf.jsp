<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <!DOCTYPE html>
    <html>

    <body>
        <div class="navbar mt-0 py-0" style="background-color: lightcoral; padding: 10px; margin-bottom: 10px;">
            <c:choose>
                <c:when test="${staff.role == 'Owner'}">
                    <a href="<c:url value='/dashboard' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Dashboard</a>
                    <a href="<c:url value='/staff' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Staff</a>
                    <a href="<c:url value='/supplier' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Supplier</a>
                    <a href="<c:url value='/register' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">New
                        Staff</a>
                    <a href="<c:url value='/' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;"> Log Out
                    </a>
                </c:when>
                <c:when test="${staff.role == 'Employee'}">
                    <a href="<c:url value='/stock' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Stock</a>
                    <a href="<c:url value='/order' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Order</a>
                    <a href="<c:url value='/sales' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;">Sales</a>
                    <a href="<c:url value='/' />"
                        style="color: white; text-decoration: none; padding: 8px 12px; margin-right: 10px;"> Log Out
                    </a>
                </c:when>
            </c:choose>
        </div>
        <div class="d-flex justify-content-center align-items-center" style="height: 60vh">
            <div class="card profile-container col-md-8" style="background-color: lightgray;">
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-center align-items-center">
                        <img src="<c:url value='/img/user.jpg' />"
                            style="border-radius:50%; width: 200px; height: 200px;">
                    </div>
                    <div class="col-md-12 d-flex justify-content-center align-items-center flex-column">
                        <div class="card-body text-center">
                                <p>Username: ${staff.username}</p>
                                <p>Email: ${staff.email}</p>
                                <p>Phone Number: ${staff.phoneNum}</p>
                                <p>User Role: ${staff.role}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>