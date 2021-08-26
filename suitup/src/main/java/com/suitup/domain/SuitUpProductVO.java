package com.suitup.domain;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SuitUpProductVO {
	

	private int proNum;
	private String proName;
	private int proPrice;
	private int cateNum;
	private int cateDtnum;
	private int dtproCount;
	private String proImage;
	private String proDetail;
	// 상품 이미지
	List<MultipartFile> image;
	// 상품 설명 이미지
	List<MultipartFile> detail;
	
	
	
	
	
	
	public int getDtproCount() {
		return dtproCount;
	}
	public void setDtproCount(int dtproCount) {
		this.dtproCount = dtproCount;
	}
	public int getProNum() {
		return proNum;
	} 
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	public int getCateDtnum() {
		return cateDtnum;
	}
	public void setCateDtnum(int cateDtnum) {
		this.cateDtnum = cateDtnum;
	}
	public String getProImage() {
		return proImage;
	}
	public void setProImage(String proImage) {
		this.proImage = proImage;
	}
	public String getProDetail() {
		return proDetail;
	}
	public void setProDetail(String proDetail) {
		this.proDetail = proDetail;
	}
	
	
	public List<MultipartFile> getImage() {
		return image;
	}
	public void setImage(List<MultipartFile> image) {
		this.image = image;
		this.proImage = "";
		// 각자 환경에 맞게 경로 수정
		String path = "C:\\Users\\sonic\\Documents\\GitHub\\suitup\\src\\main\\webapp\\resources\\images\\imgUpload\\";
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	    }
		// 업로드 파일 접근
		if(! image.isEmpty()) {
				for(MultipartFile mf : image) {
					// "/" 로 이름 구분
					String serialNo = ""+System.currentTimeMillis();
					serialNo = serialNo.substring(5, 12);
					this.proImage += serialNo + mf.getOriginalFilename() + "/";
						
						String originFileName = mf.getOriginalFilename(); // 원본 파일 명
						
						String safeFile = path + serialNo + originFileName;
						
						try {
							mf.transferTo(new File(safeFile));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}	
				}
			
	}
	
	
	public List<MultipartFile> getDetail() {
		return detail;
	}
	
	public void setDetail(List<MultipartFile> detail) {
		this.detail = detail;
		this.proDetail = "";
		// 각자 환경에 맞게 경로 수정
		String path = "C:\\Users\\sonic\\Documents\\GitHub\\suitup\\src\\main\\webapp\\resources\\images\\imgUpload\\";
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	     }
		// 업로드 파일 접근
		if(! detail.isEmpty()) {
			for(MultipartFile mf : detail) {
				// "/" 로 이름 구분
				String serialNo = ""+System.currentTimeMillis();
				serialNo = serialNo.substring(5, 12);
				this.proDetail += serialNo + mf.getOriginalFilename() + "/";
								
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명	
				String safeFile = path + serialNo + originFileName;
								
				try {
					mf.transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}	
		}
	}
}
