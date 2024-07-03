<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="container text-dark">
            <h2 class="text-center">Update Staff</h2>
            <form method="post" action="/staff/edit/${staff.staffId}">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" value="${staff.username}" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" value="${staff.password}" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${staff.name}" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${staff.email}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="role" id="roleOwner" value="Owner" required>
                        <label class="form-check-label" for="roleOwner">Owner</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="role" id="roleEmployee" value="Employee" required>
                        <label class="form-check-label" for="roleEmployee">Employee</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="phoneNum" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${staff.phoneNum}" required>
                </div>
                
                <button type="submit" class="btn btn-primary w-100">Update</button>
            </form>
        </div>
    </body>
</html>