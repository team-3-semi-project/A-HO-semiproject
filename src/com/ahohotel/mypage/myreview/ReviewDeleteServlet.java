package com.ahohotel.mypage.myreview;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ahohotel.mypage.reserve.model.dto.ReviewPhotoDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;

@WebServlet("/review/delete")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
		
		System.out.println(reserveCode);
		ReserveService reserveService = new ReserveService();
		
	
		
		String rootLocation = getServletContext().getRealPath("/");
		String fileUploadRoot = rootLocation + "/resources/upload/review-img/";

		List<ReviewPhotoDTO> rePhoto = reserveService.selectReviewPhoto(reserveCode);
		
		int cnt = 0;
		for (int i = 0; i < rePhoto.size(); i++) {
			File deletFile = new File(fileUploadRoot + "/" + rePhoto.get(i).getFileName());
			
			boolean isDeleted = deletFile.delete();
			
			if (isDeleted) {
				cnt++;
			}
			
		}
		int result = reserveService.deleteReview(reserveCode);
		
		if(cnt == rePhoto.size()) {
			System.out.println("사진삭제완료");
		}
		
		
		String path = "";
		
		if (result > 0) {
			path = "/WEB-INF/view/common/success.jsp";
			request.setAttribute("successCode", "deleteReview");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}


}
