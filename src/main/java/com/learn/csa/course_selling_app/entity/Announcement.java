
package com.learn.csa.course_selling_app.entity;


public class Announcement {
    private int a_id;
    private String a_starDate;
    private String a_endDate;
    private Integer linked_course_id;
    private String a_img;

    public Announcement() {
    }

    public Announcement(String a_starDate, String a_endDate, Integer linked_course_id, String a_img) {
        this.a_starDate = a_starDate;
        this.a_endDate = a_endDate;
        this.linked_course_id = linked_course_id;
        this.a_img = a_img;
    }

    public Announcement(int a_id, String a_starDate, String a_endDate, Integer linked_course_id, String a_img) {
        this.a_id = a_id;
        this.a_starDate = a_starDate;
        this.a_endDate = a_endDate;
        this.linked_course_id = linked_course_id;
        this.a_img = a_img;
    }

    public int getA_id() {
        return a_id;
    }

    public String getA_starDate() {
        return a_starDate;
    }

    public void setA_starDate(String a_starDate) {
        this.a_starDate = a_starDate;
    }

    public String getA_endDate() {
        return a_endDate;
    }

    public void setA_endDate(String a_endDate) {
        this.a_endDate = a_endDate;
    }

    public Integer getLinked_course_id() {
        return linked_course_id;
    }

    public void setLinked_course_id(Integer linked_course_id) {
        this.linked_course_id = linked_course_id;
    }

    public String getA_img() {
        return a_img;
    }

    public void setA_img(String a_img) {
        this.a_img = a_img;
    }

    @Override
    public String toString() {
        return "Annoucement{" + "a_id=" + a_id + ", a_starDate=" + a_starDate + ", a_endDate=" + a_endDate + ", linked_course_id=" + linked_course_id + ", a_img=" + a_img + '}';
    }
    
    
    
    
    
    
    
    
    
}
