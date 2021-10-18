package com.ahohotel.mypage.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import com.ahohotel.mypage.inquiry.model.Service.InquiryService;
import com.ahohotel.mypage.inquiry.model.dto.InquiryDTO;
import com.ahohotel.mypage.inquiry.model.dto.InquiryFileDTO;
import com.ahohotel.user.model.dto.AhoUserDTO;


@WebServlet("/mypage/inquiry/update")
public class InquiryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인한 user의 DTO session에서 get
		AhoUserDTO user = (AhoUserDTO) request.getSession().getAttribute("loginUser");
		int userCode = user.getCode();
		String userName = user.getName();
		
		//선택한 1:1문의의 inquiryCode
		int inquiryCode = Integer.valueOf(request.getParameter("inquiryCode"));
//		System.out.println(inquiryCode);
		
		
		/* 1:1문의 세부내용 조회하기 */
		InquiryDTO inquiryDetail = new InquiryService().selectInquiryDetail(inquiryCode);
//		System.out.println(inquiryDetail);
		
		String path = "";
		if (inquiryDetail != null) {
			path = "/WEB-INF/view/mypage/inquiry/inquiryUpdate.jsp";
			request.setAttribute("userName", userName);
			request.setAttribute("inquiry", inquiryDetail);
			
		} else {
			inquiryDetail = new InquiryService().selectInquiryDetailWithoutFile(inquiryCode);
//			System.out.println(inquiryDetail);
			
			if (inquiryDetail != null) {
				path = "/WEB-INF/view/mypage/inquiry/inquiryUpdate.jsp";
				request.setAttribute("userName", userName);
				request.setAttribute("inquiry", inquiryDetail);
			} else {
				path = "/WEB-INF/view/common/failed.jsp";
				request.setAttribute("message", "1:1 문의 수정화면 띄우기 실패!");
			}
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* mypage-side.jsp에 넘겨줄 값 */
		AhoUserDTO user = (AhoUserDTO) request.getSession().getAttribute("loginUser");
		String userName = user.getName();
		
		
		/* file 업로드를 위해 encType="multipart/form-data"로 넘어 왔음을 의미 (최소 하나 이상의 file 타입 input 태그가 존재) */
		if (ServletFileUpload.isMultipartContent(request)) {
//			System.out.println("파일을 업로드 하는 경우");
			
			String rootLocation = getServletContext().getRealPath("/");
			int maxFileSize = 1024 * 1024 * 10;
			String encodingType = "UTF-8";
			
			String fileUploadDirectory = rootLocation + "/resources/inquiry-img/";

			File directory = new File(fileUploadDirectory);  

			if (!directory.exists()) {  // 경로에 해당하는 폴더가 없으면
				System.out.println("폴더 생성 : " + directory.mkdirs()); 
			}
			
			/* update 정보 mapping */
			List<Map<String, String>> fileList = new ArrayList<>();  // 파일 대상
			Map<String, String> parameter = new HashMap<>();         // 파일이 아닌것 대상
			
			/* 파일을 업로드 할 시 최대 크기나 임시 저장할 폴더의 경로 등을 포함하기 위함 인스턴스 */
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(new File(fileUploadDirectory));
			fileItemFactory.setSizeThreshold(maxFileSize);
			
			/* request를 파싱하여 데이터 하나하나를 FileItem 타입의 인스턴스들로 반환(List로 반환)(parseRequest 메소드 활용을 위해서) */
			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

			try {
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				
				for (FileItem item : fileItems) {
//					System.out.println(item); //isFromField = true : file이 아님, isFromField = false : file
				}
				
				for (int i = 0; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
					
					if (!item.isFormField()) {		// ### (업로드 하는 것이)파일 인 경우 ###
						
						if (item.getSize() > 0) {
							 String fieldName = item.getFieldName();
							 String originFileName = item.getName();
//							 System.out.println("input 태그의 name : " + fieldName);
//							 System.out.println("올린 파일의 이름 : " + originFileName);

							 int dot = originFileName.lastIndexOf(".");
							 String ext = originFileName.substring(dot);
							 
//							 System.out.println("올린 파일 확장자 : " + ext);
//							 System.out.println(UUID.randomUUID().toString().replace("-", ""));
							 
							 /* 저장할 파일의 새 이름 생성 */
							 String randomFileName = UUID.randomUUID().toString().replace("-", "") + ext;
//							 System.out.println(randomFileName);
							 
							 File storeFile = new File(fileUploadDirectory + "/" + randomFileName);
							 
							 /* 지정한 위치에 파일 저장 */
							 item.write(storeFile);
							 
							 /* 파일 하나에 대한 필요한 정보를 Map에 담는다. */
							 Map<String, String> fileMap = new HashMap<>();
							 fileMap.put("fieldName", fieldName);
							 fileMap.put("originFileName", originFileName);
							 fileMap.put("savedFileName", randomFileName);
							 fileMap.put("savePath", fileUploadDirectory);
							 
							 /* 하나의 파일 정보를(Map으로 담은 여러가지 정보)를 List에 담자 */
							 fileList.add(fileMap);
						 }
//						
					} else {		// ### 업로드 하는 것이 파일이 아닌 데이터인 경우 ###
						/* 파일이 아닌 데이터들은 Map에 담는다. */
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
					}
				}
//				
//				for (Map<String, String> file : fileList) {
//					System.out.println("file : " + file);
//				}
//				System.out.println("parameter : " + parameter);
				
				int inquiryCode = Integer.valueOf(parameter.get("inquiryCode"));
//				System.out.println("inquiryCode : " + inquiryCode);
				
				/* InquiryDTO에 update 할 1:1문의 정보 담기 */
				InquiryDTO updateInquiryDTO = new InquiryDTO();
				updateInquiryDTO.setInquiryCode(inquiryCode);
				updateInquiryDTO.setInquiryCategory(parameter.get("inquiryCategory"));
				updateInquiryDTO.setInquiryTitle(parameter.get("inquiryTitle"));
				updateInquiryDTO.setInquiryContent(parameter.get("inquiryContent"));

				/* 1:1 문의 update (파일을 제외한 내용) */
				int updateResult = new InquiryService().updateInquiry(updateInquiryDTO);
//				System.out.println(updateResult);

				if (updateResult > 0) {
					
					if (Integer.valueOf(parameter.get("isDeleteInquiryFile")) > 0) {
						
						/* "이전 업로드 파일 삭제하기"가 체크된 경우 파일 삭제 */
						int deleteResult = new InquiryService().deleteInquiryFile(inquiryCode); 
						
						if (deleteResult > 0) {
//							System.out.println("삭제 성공!");
						} else {
							String path = "/WEB-INF/view/common/failed.jsp";
							request.setAttribute("message", "1:1 문의 update에서 기존 파일 삭제 실패!");
						}
					}
					
					
					/* 새로 넣은 파일 insert */
					List<InquiryFileDTO> list = new ArrayList<InquiryFileDTO>();
					
					// insert 할 file들 list로 만들기
					for (Map<String, String> file : fileList) {
						InquiryFileDTO inquiryFileDTO = new InquiryFileDTO();
						
						inquiryFileDTO.setInquiryCode(inquiryCode);
						inquiryFileDTO.setqOriginalFile(file.get("originFileName"));
						inquiryFileDTO.setqFileName(file.get("savedFileName"));
						inquiryFileDTO.setqFile(file.get("savePath"));
						
						/* 파일 insert 메소드 호출 */
						int result = new InquiryService().insertInquiryFile(inquiryFileDTO);
						
					}
//					System.out.println("list : " + list);
					
				} else {
					String path = "/WEB-INF/view/common/failed.jsp";
					request.setAttribute("message", "1:1 문의 update (파일 제외) 실패!");
				}
				
			} catch (Exception e) {		/* 예외(업로드 실패) 시 업로드한 사진 삭제 */
				e.printStackTrace();
				
				int cnt = 0;
				
				/* 어떤 종류의 Exception이 발생하더라도 >>실패 시 올라간 파일은 삭제<<해야 한다. */
				for (int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					File deleteFile = new File(fileUploadDirectory + "/" + file.get("savedFileName"));
					boolean isDeleted = deleteFile.delete();
					
					if(isDeleted) {
						cnt++;		
					}
				}
				if (cnt == fileList.size()) {
					System.out.println("업로드에 실패한 모든 사진 삭제 완료 !");
				} else {
					System.out.println("업로드에 실패한 모든 사진 삭제 실패 !");
				}
			}
			
		} else {
			/* file 타입의 input 태그가 없는 경우 */
			System.out.println("파일을 업로드 하지 않는 경우");
		}
		
		response.sendRedirect(request.getContextPath() + "/mypage/inquiry");
	}

}
