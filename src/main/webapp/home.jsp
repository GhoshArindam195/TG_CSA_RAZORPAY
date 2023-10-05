<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.learn.csa.course_selling_app.entity.Student"%>
<%@page import="com.learn.csa.course_selling_app.entity.Purchase"%>
<%@page import="com.learn.csa.course_selling_app.dao.CourseDAO"%>
<%@page import="com.learn.csa.course_selling_app.dao.PurchaseDAO"%>
<%@page import="com.learn.csa.course_selling_app.entity.Course"%>
<%@page import="java.util.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.learn.csa.course_selling_app.entity.Announcement"%>
<%@page import="com.learn.csa.course_selling_app.dao.AnnouncementDAO"%>
<%@page import="com.learn.csa.course_selling_app.dao.FeedbackDAO"%>
<%
    Student loggedinUser = (Student) session.getAttribute("loggedUser");
    if(loggedinUser == null){
        response.sendRedirect("login.jsp");
    }
    else if(loggedinUser.getS_ID() == 1  ){
        response.sendRedirect("admin.jsp");
    }
    else
    {
        List<Purchase> purchases = PurchaseDAO.getAllPurchasesByUserId(loggedinUser.getS_ID());    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | CSA</title>


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
        <%@include file="loggedinNav.jsp" %>
        <!--Nav bar Ends-->

        <!-- Announcement Carousel-->
        <%@include file="announcement.jsp" %>
        <!-- Announcement Carousel End-->

        <!--Main Content-->
        <div class="container-fluid mt-2">
            <%@include file="courseContents.jsp" %>
            <!--Main Content End-->
        </div>



        <!--Purchase Modal-->
        <div class="modal fade" id="purchase-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Your Purchases</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table" id="paymentTable">
                            <thead class="text-dark">
                                <tr>
                                    <th scope="col">Course Name</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Payment Id</th>
                                    <th scope="col">Purchase Date</th>
                                    <th scope="col">Course Status</th>
                                    <th scope="col">Course Starting</th>
                                    <th scope="col">Executive Contact</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Purchase p : purchases) {
                                
                                    Course c = CourseDAO.getCourseByCourseId(p.getCourseId());
                                    
                                    String cStartingDate = p.getCourse_starting();
                                    
                                    // Parse the input date string to a LocalDate object
                                    LocalDate startingDate = LocalDate.parse(cStartingDate, DateTimeFormatter.ISO_DATE);
                                    
                                    int cDuration = c.getC_duration();
                                    
                                    // Add the duration to the starting date
                                    LocalDate endDate = startingDate.plusDays(cDuration);
                                    
                                    //currentDate
                                    LocalDate currentDate = LocalDate.now();
                                    
                                    String status = "UPCOMING";
                                    
                                    if(currentDate.isBefore(startingDate)){
                                        status = "UPCOMING";
                                    }
                                    else if(currentDate.isAfter(endDate)){
                                        status = "COMPLETED";
                                    }
                                    else{
                                        status = "ONGOING";
                                    }
                                
                                %>
                                <tr>
                                    <td><%= c.getC_name() %></td>
                                    <td><%= p.getAmount() %></td>
                                    <td class="paymentIdCell" data-payment-id="<%= p.getPayment_id() %>"><%= p.getPayment_id() %></td>
                                    <td><%= p.getPurchaseDate()%></td>
                                    <td><%= status %></td>
                                    <td><%= p.getCourse_starting() %></td>
                                    <td><%= p.getExecutiveContact() %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--Purchase Modal End-->

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