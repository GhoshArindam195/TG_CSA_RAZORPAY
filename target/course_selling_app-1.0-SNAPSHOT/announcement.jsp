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
                    <div class="carousel-item active" data-course-id="<%= announcements.get(0).getLinked_course_id() %>">
                        <img src="./carausal_pics/<%= announcements.get(0).getA_img() %>" class="d-block w-100 img-fluid" alt="...">
                    </div>
                    <% for(int i=1; i<announcements.size(); i++) {%>
                    <div class="carousel-item" data-course-id="<%= announcements.get(i).getLinked_course_id() %>">
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