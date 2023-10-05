<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.learn.csa.course_selling_app.entity.Student"%>
<%@page import="com.learn.csa.course_selling_app.entity.Announcement"%>
<%@page import="com.learn.csa.course_selling_app.dao.CourseDAO"%>
<%@page import="com.learn.csa.course_selling_app.dao.AnnouncementDAO"%>
<%@page import="com.learn.csa.course_selling_app.entity.Course"%>
<%@page import="java.util.*"%>
<%@page import="com.learn.csa.course_selling_app.dao.FeedbackDAO"%>
<%
    Student loggedinUser = (Student) session.getAttribute("loggedUser");
    if(loggedinUser == null){
        response.sendRedirect("login.jsp");
    }
    else if(loggedinUser.getS_ID() != 1  ){
        response.sendRedirect("home.jsp");
    }
    else{    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home | CSA</title>


        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <!--Font Awesome CDN-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />

        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .custom-color{
                background-color: #000000 !important;
            }
            .custom-bg-color{
                background-color: #F0F2F5 !important;
            }

            .checked {
                color: orange;
            }

            body {
                min-height: 75rem;
                padding-top: 4.5rem;
            }
            ._rating {
                line-height: normal;
                display: inline-block;
                color: #fff;
                padding: 2px 4px 2px 6px;
                border-radius: 3px;
                font-weight: 500;
                font-size: 13px;
                vertical-align: middle;
                background-color: #388e3c;
            }
        </style>

    </head>
    <body>

        <!--Nav bar-->
        <%@include file="adminNav.jsp" %>
        <!--Nav bar Ends-->


        <!-- Announcement Carousel-->
        <%@include file="announcement.jsp" %>
        <!-- Announcement Carousel End-->


        <!--Main Content-->
        <div class="container-fluid mt-2">
            <%@include file="courseContents.jsp" %>
        </div>
        <!--Main Content End-->



        <!-- Admin Only - Add Course Modal -->
        <div class="modal fade" id="addCourseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Course</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="addCourseServlet" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Course Name</label>
                                        <input type="text" class="form-control" id="course_name" name="course_name" aria-describedby="emailHelp">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Fees</label>
                                        <input type="text" class="form-control" id="course_fees" name="course_fees">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Duration in days</label>
                                        <input type="text" class="form-control" id="course_duration" name="course_duration">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Starting On</label>
                                        <input type="date" class="form-control" id="course_starting" name="course_starting">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Course Details</label>
                                        <textarea class="form-control" rows="3" cols="3" id="course_description" name="course_description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <input id="course_pic" name="course_pic" type="file" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer d-flex justify-content-center">
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Add Course Modal End-->

        <!-- Admin Only - Add Announcement Modal -->
        <div class="modal fade" id="addannouncemnt" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Announcement</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="announcementServlet" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="start_date">Start Date</label>
                                        <input type="date" class="form-control" id="start_date" name="start_date">
                                    </div>
                                    <div class="form-group">
                                        <label for="start_date">End Date</label>
                                        <input type="date" class="form-control" id="end_date" name="end_date">
                                    </div>
                                    <div class="form-group">
                                        <input id="announcemnt_pic" name="announcemnt_pic" type="file" class="btn btn-primary">
                                    </div>
                                    <div class="custom-control custom-switch form-group">
                                        <input type="checkbox" class="custom-control-input" id="link_a_course" name="link_a_course" checked>
                                        <label class="custom-control-label" for="link_a_course">Link a Course</label>
                                    </div>
                                    <div class="form-group" id="link-course-div">
                                        <label for="link_course_id">Select the Course</label>
                                        <select class="form-control" id="link_course_id" name="link_course_id">
                                            <% for(Course course : courses) { %>
                                            <option value="<%= course.getC_id() %>"><%= course.getC_name() %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <input type="hidden" name="task" id="task" value="add">    
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer d-flex justify-content-center">
                            <button type="submit" class="btn btn-success">Post</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Add Announcement Modal End-->



        <!-- Footer -->
        <%@include file="commonfooter.jsp" %>
        <!--Footer End-->


    </body>


    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <!--JQuery CDN for AJAX-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!--Razor Pay Script-->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <!--Sweet Alert-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="script/appscript.js"></script>

    <!--Admin Only Script-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Function to hide/show the "link-course-div"
            function toggleLinkCourseDiv() {
                var checkbox = $("#link_a_course");
                var linkCourseDiv = $("#link-course-div");

                if (checkbox.prop("checked")) {
                    linkCourseDiv.show();
                } else {
                    linkCourseDiv.hide();
                }
            }

            // Add an event listener to the checkbox to call the function
            $("#link_a_course").change(toggleLinkCourseDiv);

            // Call the function initially to set the initial state
            toggleLinkCourseDiv();
        });
    </script>



    <!--Not Admin only but will need to place to appscript.sj later -> carousel-click.js-->
    <script>
        $(document).ready(function () {
            $('.carousel-item').click(function () {

                // Get the data-course-id from the clicked slide
                var courseId = $(this).data('course-id');

                // Find the "Enroll" button with the same data-course-id and trigger a click
                $('.enroll-button[data-course-id="' + courseId + '"]').click();
            });
        });
    </script>
    <!-- carousel-click.js end-->

</html>
<%}%>