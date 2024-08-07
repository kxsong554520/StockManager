<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="container text-dark mb-5">
            <h2 class="text-center">Register</h2>
            <form method="post" action="/userpf">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
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
                    <input type="text" class="form-control" id="phoneNum" name="phoneNum" required>
                </div>
                
                <button type="submit" class="btn btn-primary w-100">Register</button>
                <a href="/" class="btn btn-secondary mt-2">Back to Login page</a>

            </form>
        </div>
    </body>
</html>