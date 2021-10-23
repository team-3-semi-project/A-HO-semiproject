package com.ahohotel.mypage.myreview;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ahohotel.mypage.reserve.model.dto.ReserveDTO;
import com.ahohotel.mypage.reserve.model.dto.ReserveSearchListDTO;
import com.ahohotel.mypage.reserve.model.dto.ReviewPhotoDTO;
import com.ahohotel.mypage.reserve.model.service.ReserveService;
import com.ahohotel.user.model.dto.AhoUserDTO;

@WebServlet("/review/update")
public class ReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
		
		ReserveService reserveService = new ReserveService();
		
		ReserveSearchListDTO reserve = reserveService.selectOneReserve(reserveCode);
		
		System.out.println("예약번호" + reserve);
		
		String path = "/WEB-INF/view/mypage/review/myReviewUpdate.jsp";
		request.setAttribute("reserve", reserve);
		
		request.getRequestDispatcher(path).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		ReserveService reserveService = new ReserveService();
		
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			String rootLocation = getServletContext().getRealPath("/");
			int maxFileSize = 1024 * 1024 * 10;
			
			String fileUploadRoot = rootLocation + "/resources/upload/review-img/";
			
			File directory = new File(fileUploadRoot);
			
			if (!directory.exists()) {
				directory.mkdirs();
			}
			
			Map<String, String> parameter = new HashMap<>();
			List<Map<String, String>> fileList = new ArrayList<>();
			
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(new File(fileUploadRoot));
			fileItemFactory.setSizeThreshold(maxFileSize);
			
			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
			
			try {
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				
				for (FileItem item : fileItems) {
					System.out.println("item " + item);
				}
				
				for (int i = 0; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
					
					if (!item.isFormField()) {
						
						if (item.getSize() > 0) {
							
							String fileName = item.getFieldName();
							String originFileName = item.getName();
							
							int dot = originFileName.lastIndexOf(".");
							String ext = originFileName.substring(dot);
							
							String randomName = UUID.randomUUID().toString().replace("-", "") + ext;
							
							File storeFile = new File(fileUploadRoot + "/" + randomName);
							
							item.write(storeFile);
							
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("fileName", fileName);
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomName);
							fileMap.put("savePath", fileUploadRoot);
							
							fileList.add(fileMap);
						}
						
					} else {
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
					}
				}
				System.out.println("parameter"+ parameter);
				System.out.println("fileList" + fileList);
				
				int reserveCode = Integer.valueOf(parameter.get("reserveCode"));
				
				
				List<ReviewPhotoDTO> rePhotoo = reserveService.selectReviewPhoto(reserveCode);
				
				int cnt = 0;
				for (int i = 0; i < rePhotoo.size(); i++) {
					File deletFile = new File(fileUploadRoot + "/" + rePhotoo.get(i).getFileName());
					
					boolean isDeleted = deletFile.delete();
					
					if (isDeleted) {
						cnt++;
					}
					
				}
				int result1 = reserveService.deleteReview(reserveCode);
				
				
				
				
				ReserveDTO review = new ReserveDTO();
				review.setUserCode(((AhoUserDTO) request.getSession().getAttribute("loginUser")).getCode());
				review.setReserveCode(reserveCode);
				review.setReview(parameter.get("reviewText"));
				review.setScore(Integer.valueOf(parameter.get("score")));
				review.setReviewDate(new Date());
				
				List<ReviewPhotoDTO> reviewPhoto = new ArrayList<>();
				for (int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					ReviewPhotoDTO rePhoto = new ReviewPhotoDTO();
					rePhoto.setFileName(file.get("savedFileName"));
					rePhoto.setOriginalFile(file.get("originFileName"));
					rePhoto.setFilePath(file.get("savePath"));
					rePhoto.setReservecode(reserveCode);
					
					reviewPhoto.add(rePhoto);
					
					System.out.println("rePhoto : " + rePhoto);
				}
				
				int result = reserveService.updateReview(review, reviewPhoto);
				
				String path = "";
				if (result > 0) {
					path = "/WEB-INF/view/common/success.jsp";
					request.setAttribute("successCode", "insertReview");
				} else {
					path = "/WEB-INF/view/common/failed.jsp";
					request.setAttribute("message", "리뷰 등록 실패!");
				}
				
				request.getRequestDispatcher(path).forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
				
				int cntt = 0;
				for(int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					File deletFile = new File(fileUploadRoot + "/" + file.get("savedFileName"));
					boolean isDeleted = deletFile.delete();
					
					if (isDeleted) {
						cntt++;
					}
				}
			
				if (cntt == fileList.size()) {
					System.out.println("실패 사진 삭제 완료!");
					e.printStackTrace();
				} else {
					e.printStackTrace();
				}
			}
			
		}
	}

}
