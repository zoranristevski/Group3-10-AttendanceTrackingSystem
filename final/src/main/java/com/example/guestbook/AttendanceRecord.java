package com.example.guestbook;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.google.appengine.api.users.User;


@Entity
public class AttendanceRecord {
	@Id public Long attendanceId;
    public User student;
    public Group tutorialGroup;
    public Long weekId;
    public Boolean present;
	public AttendanceRecord(){

	}
}
