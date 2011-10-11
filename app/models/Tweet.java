package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;

import play.data.validation.MaxSize;
import play.data.validation.Required;
import play.db.jpa.Model;

@Entity
@Table(name="tweets")
public class Tweet extends Model {
	
	@Required
	@MaxSize(140)
	public String tweet;
	
	@Required
	public Date createDate = new Date();
	
	public static List findLatest() {
		return Tweet.find("order by createDate desc").fetch();
	}
	
	@Override
	public String toString() {
		return this.tweet;
	}
}