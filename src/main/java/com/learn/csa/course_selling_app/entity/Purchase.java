package com.learn.csa.course_selling_app.entity;

public class Purchase 
{
    private int purchaseId;
    private String purchaseDate;
    private String amount;
    private String payment_id;
    private int studentID;
    private int courseId;
    private String executiveContact="Ticket Raised";
    private String course_starting;

    public Purchase(int purchaseId, String purchaseDate, String amount, String payment_id, int studentID, int courseId, String executiveContact, String course_starting) {
        this.purchaseId = purchaseId;
        this.purchaseDate = purchaseDate;
        this.amount = amount;
        this.payment_id = payment_id;
        this.studentID = studentID;
        this.courseId = courseId;
        this.executiveContact = executiveContact;
        this.course_starting= course_starting;
    }

    public Purchase(String purchaseDate, String amount, String payment_id, int studentID, int courseId, String executiveContact, String course_starting) {
        this.purchaseDate = purchaseDate;
        this.amount = amount;
        this.payment_id = payment_id;
        this.studentID = studentID;
        this.courseId = courseId;
        this.executiveContact = executiveContact;
        this.course_starting= course_starting;
    }

    public Purchase() {
    }

    public int getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(int purchaseId) {
        this.purchaseId = purchaseId;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(String payment_id) {
        this.payment_id = payment_id;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getExecutiveContact() {
        return executiveContact;
    }

    public void setExecutiveContact(String executiveContact) {
        this.executiveContact = executiveContact;
    }

    public String getCourse_starting() {
        return course_starting;
    }

    public void setCourse_starting(String course_starting) {
        this.course_starting = course_starting;
    }
    
    

    @Override
    public String toString() {
        return "Purchase{" + "purchaseId=" + purchaseId + ", purchaseDate=" + purchaseDate + ", amount=" + amount + ", payment_id=" + payment_id + ", studentID=" + studentID + ", courseId=" + courseId + ", executiveContact=" + executiveContact + '}';
    }
    
    

    
    
    
    
    
    
    
    
    
}
