package com.model.dto;

public class VideoDTO {
	private int no;
	private String title;
	private String poster_Path;
	private String thumbnail_Path;
	private String platform_Name;
	private int year;
	private String genre;
	private String director;
	private String actor;
	private String running_Time;
	private int age_Rating;
	private double score;
	private String synopsis;
	
	public VideoDTO(int no, String title, String poster_Path, String thumbnail_Path, String platform_Name, int year,
			String genre, String director, String actor, String running_Time, int age_Rating, double score,
			String synopsis) {
		this.no = no;
		this.title = title;
		this.poster_Path = poster_Path;
		this.thumbnail_Path = thumbnail_Path;
		this.platform_Name = platform_Name;
		this.year = year;
		this.genre = genre;
		this.director = director;
		this.actor = actor;
		this.running_Time = running_Time;
		this.age_Rating = age_Rating;
		this.score = score;
		this.synopsis = synopsis;
	}
	
	public VideoDTO(String title, String poster_Path, String thumbnail_Path, String platform_Name, int year,
			String genre, String director, String actor, String running_Time, int age_Rating, double score,
			String synopsis) {
		this.title = title;
		this.poster_Path = poster_Path;
		this.thumbnail_Path = thumbnail_Path;
		this.platform_Name = platform_Name;
		this.year = year;
		this.genre = genre;
		this.director = director;
		this.actor = actor;
		this.running_Time = running_Time;
		this.age_Rating = age_Rating;
		this.score = score;
		this.synopsis = synopsis;
	}



	public VideoDTO(int no, String title) {
		super();
		this.no = no;
		this.title = title;
	}

	@Override
	public String toString() {
		return "VideoDTO [no=" + no + ", title=" + title + ", poster_Path=" + poster_Path + ", thumbnail_Path="
				+ thumbnail_Path + ", platform_Name=" + platform_Name + ", year=" + year + ", genre=" + genre
				+ ", director=" + director + ", actor=" + actor + ", running_Time=" + running_Time + ", age_Rating="
				+ age_Rating + ", score=" + score + ", synopsis=" + synopsis + "]";
	}

	public int getNo() {
		return no;
	}

	public String getTitle() {
		return title;
	}

	public String getPoster_Path() {
		return poster_Path;
	}

	public String getThumbnail_Path() {
		return thumbnail_Path;
	}

	public String getPlatform_Name() {
		return platform_Name;
	}

	public int getYear() {
		return year;
	}

	public String getGenre() {
		return genre;
	}

	public String getDirector() {
		return director;
	}

	public String getActor() {
		return actor;
	}

	public String getRunning_Time() {
		return running_Time;
	}

	public int getAge_Rating() {
		return age_Rating;
	}

	public double getScore() {
		return score;
	}

	public String getSynopsis() {
		return synopsis;
	}
	
	
}
