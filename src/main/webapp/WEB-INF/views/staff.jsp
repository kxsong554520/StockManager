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
        <div>
            <h2 class="mb-4 text-dark">Staff List</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Staff ID</th>
                        <th scope="col">Username</th>
                        <th scope="col">Password</th>
                        <th scope="col">Email</th>
                        <th scope="col">Name</th>
                        <th scope="col">Role</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col" colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="staff" items="${staffList}">
                        <tr>
                            <td>${staff.staffId}</td>
                            <td>${staff.username}</td>
                            <td>${staff.password}</td>
                            <td>${staff.email}</td>
                            <td>${staff.name}</td>
                            <td>${staff.role}</td>
                            <td>${staff.phoneNum}</td>
                            <td><a href="/staff/edit/${staff.staffId}" class="btn btn-primary btn-sm">Edit</a></td>
                            <td><a href="/staff/delete/${staff.staffId}" class="btn btn-danger btn-sm">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>

    </html>