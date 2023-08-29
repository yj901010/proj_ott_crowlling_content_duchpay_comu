package com.model.dto;

public class ReviewDTO {
   private int video_No;
   private String id;
   private String content;
   private int score;
   private int no;
   
   public ReviewDTO(int video_No, String id, String content, int score) {
      this.video_No = video_No;
      this.id = id;
      this.content = content;
      this.score = score;
   }

   
   public ReviewDTO(int video_No, String id, String content, int score, int no) {
      this.video_No = video_No;
      this.id = id;
      this.content = content;
      this.score = score;
      this.no = no;
   }


   public ReviewDTO(String id, String content, int score, int no) {
      this.id = id;
      this.content = content;
      this.score = score;
      this.no = no;
   }


   public int getVideo_No() {
      return video_No;
   }

   public String getId() {
      return id;
   }

   public String getContent() {
      return content;
   }

   public int getScore() {
      return score;
   }

   public int getNo() {
      return no;
   }
   
   
}