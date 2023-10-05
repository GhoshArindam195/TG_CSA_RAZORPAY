<%@page import="com.learn.csa.course_selling_app.dao.CourseDAO"%>
<%@page import="com.learn.csa.course_selling_app.entity.Course"%>
<%@page import="com.learn.csa.course_selling_app.entity.Announcement"%>
<%@page import="com.learn.csa.course_selling_app.dao.AnnouncementDAO"%>
<%@page import="com.learn.csa.course_selling_app.dao.FeedbackDAO"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CSA | Index</title>


        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .custom-color{
                background-color: #000000 !important;
            }
            .checked {
                color: orange;
            }
            .custom-bg-color{
                background-color: #F0F2F5 !important;
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


    <body class="custom-bg-color">
        <!-- Nav bar starts---->
        <%@include file="normalNav.jsp" %>
        <!---Nav bar ends-->

        <%
                            List<Announcement> announcements = AnnouncementDAO.getAllCurrentAnnouncements();
                            if(announcements.size()>0){
        %>
        <!--Carousel-->
        <div class="container-fluid my-4">
            <div class="row">
                <div class="col-sm-12">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner" >
                            <div class="carousel-item active">
                                <img src="./carausal_pics/<%= announcements.get(0).getA_img() %>" class="d-block w-100 img-fluid" alt="...">
                            </div>
                            <% for(int i=1; i<announcements.size(); i++) {%>
                            <div class="carousel-item">
                                <img src="./carausal_pics/<%= announcements.get(i).getA_img() %>" class="d-block w-100 img-fluid" alt="...">
                            </div>
                            <% } %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--Carousel End-->
        <% } %>

        <!--Courses-->
        <div class="container-fluid mt-2">
            <%
            List<Course> courses = CourseDAO.getAllCourses();
            Map<Integer, String[]> feedbacks = FeedbackDAO.getCoursesFeedbackCountAndRAtings();
            
            %>
            <div class="row">
                <div class="card-columns">
                    <% for(Course course : courses) { %>
                    <div class="card">
                        <img src="course_pics/<%= course.getC_img() %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= course.getC_name()%></h5>
                            <p class="card-text"><%= course.getC_details()%></p>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="_rating">(<%= feedbacks.get(course.getC_id())[2] %>) &#9733;</div>
                                    <span>(<%= feedbacks.get(course.getC_id())[1] %>)</span>
                                </div>
                                <div class="col-sm-6">
                                    <button class="btn m-0 p-0"><b><span>&#8377;</span> <%= course.getC_fees() %></b></button>
                                    <button class="btn m-0 p-0" style="text-decoration: line-through"><span>&#8377;</span> <%= Integer.parseInt(course.getC_fees())*2 %></button>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-warning mt-2 text-light"><b>Details</b></button>
                                <a class="btn btn-success mt-2" href="login.jsp"><b>Enroll</b></a>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <!--Courses End-->

        <!--Footer-->
        <!-- Remove the container if you want to extend the Footer to full width. -->
        <!--<div class="container my-5">-->

        <!-- Footer -->
        <%@include file="commonfooter.jsp" %>
        <!--Footer End-->

        <!-- Add Bootstrap JavaScript and jQuery -->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


    </body>
</html>
