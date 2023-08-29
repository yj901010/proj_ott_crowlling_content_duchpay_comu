package com.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

@WebServlet("/DateCalService")
public class DateCalService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		int per = Integer.parseInt(request.getParameter("per"));
		String start_Date = request.getParameter("start_Date");
		
		// LocalDateTime으로 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		// GsonBuilder를 사용하여 LocalDate 객체를 직렬화 및 역직렬화하는 커스텀 직렬화기 설정
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateSerializer())
                .setPrettyPrinting()
                .create();

        LocalDate date = LocalDate.parse(start_Date, formatter);
        LocalDate caldate = date.plusMonths(per);

        String result = gson.toJson(caldate);

        response.setCharacterEncoding("EUC-KR");
        response.setContentType("application/json");
        response.getWriter().print(result);
    }

    // LocalDate를 yyyy-MM-dd 형식의 문자열로 직렬화하는 커스텀 직렬화기
    private class LocalDateSerializer implements JsonSerializer<LocalDate> {
        @Override
        public JsonPrimitive serialize(LocalDate src, java.lang.reflect.Type typeOfSrc,
                                      JsonSerializationContext context) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = src.format(formatter);
            return new JsonPrimitive(formattedDate);
        }
    }
}






