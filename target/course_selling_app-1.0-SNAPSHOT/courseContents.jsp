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
            <div class="card-footer ">
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
                    <button type="button" class="btn btn-success mt-2 enroll-button" onclick="addToCart(<%= course.getC_id() %>, '<%= course.getC_name()%>', <%= course.getC_fees() %>)" data-course-id="<%= course.getC_id() %>"><b>Enroll</b></button>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>


<!--Cart Modal-->

<div class="modal fade" id="cart-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Your cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table" id="cart-table">
                    <thead class="text-dark">
                        <tr>
                            <th scope="col">no.</th>
                            <th scope="col">Item name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody id="tBody">
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-danger" id="clear-cart" onclick="clearCart()">Clear cart</button>
                <button type="button" class="btn btn-success" id="check-out" onclick="checkoutToServlet()" >Check out</button>
            </div>
        </div>
    </div>
</div>
<!--Cart Modal End-->

