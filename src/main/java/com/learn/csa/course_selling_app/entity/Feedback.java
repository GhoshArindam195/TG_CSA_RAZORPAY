
package com.learn.csa.course_selling_app.entity;

public class Feedback 
{
    private int f_id;
    private int rating;
    private String feedback;
    private int courseId;
    private int userId;

    // Constructors, getters, setters, and other methods

    // Default constructor
    public Feedback() {
    }

    // Parameterized constructor
    public Feedback(int rating, String feedback, int courseId, int userId) {
        this.rating = rating;
        this.feedback = feedback;
        this.courseId = courseId;
        this.userId = userId;
    }
    
    // Parameterized constructor
    public Feedback(int f_id, int rating, String feedback, int courseId, int userId) {
        this.f_id = f_id;
        this.rating = rating;
        this.feedback = feedback;
        this.courseId = courseId;
        this.userId = userId;
    }

    public int getF_id() {
        return f_id;
    }


    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Feedback{" + "f_id=" + f_id + ", rating=" + rating + ", feedback=" + feedback + ", courseId=" + courseId + ", userId=" + userId + '}';
    }
    
    

    

}
