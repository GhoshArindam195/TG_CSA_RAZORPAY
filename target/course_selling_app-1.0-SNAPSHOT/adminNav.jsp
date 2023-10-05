<!-- Nav bar starts---->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark custom-color">
    <a class="navbar-brand" href="index.jsp">CSA</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav m-auto">
            <li class="nav-item p-1">
                <button class="btn btn-warning" data-toggle="modal" data-target="#addCourseModal"><i class="fas fa-clipboard-list"> Add Course</i></button>
            </li>
            <li class="nav-item p-1">
                <button class="btn btn-primary" data-toggle="modal" data-target="#addannouncemnt"><i class="fas fa-gift"> Add Announcement</i></button>
            </li>

        </ul>



        <ul class="navbar-nav ml-auto">
            <li class="nav-item p-1">
                <a  class="nav-link" id="cart-icon" href="#" data-toggle="modal" data-target="#cart-modal"><i class="fas fa-cart-arrow-down" style="font-size: 20px;"></i> <i id="cart-val">(0)</i><span class="sr-only"></span></a>
            </li>
            <li class="nav-item p-1">
                <i class="fas fa-user-alt text-white h3">Admin <%= loggedinUser.getS_Name().split(" ")[0] %> </i>
            </li>
            <li class="nav-item p-1">
                <a href="logoutServlet" class="btn btn-outline-danger">Logout</a>
            </li>

        </ul>
    </div>
</nav>           
<!---Nav bar ends--->