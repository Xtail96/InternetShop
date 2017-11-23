package edu.etu.web;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "COMMENT")
public class CommentEntry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private int id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "DATE")
    private Date date;

    @Column(name = "TEXT", nullable = false)
    private String text;

    public static List<CommentEntry> getAll() {
        return HibernateConnector.getSessionFactory().openSession().createCriteria(CommentEntry.class).list();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

}
