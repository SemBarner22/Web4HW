package ru.itmo.tpl.model;

public class Post {
    private long id;
    private String title;
    private String text;
    private long user_id;

    public Post(long id, String title, String text, long user_id) {
        this.id = id;
        this.title = title;
        this.text = text;
        this.user_id = user_id;
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    /*public String getFirstText() {
        return text.substring(0, 250) + "...";
    }*/

    public long getUser_id() {
        return user_id;
    }

}
