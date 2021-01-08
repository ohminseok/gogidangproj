package com.spring.gogidang.store;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.gogidang.member.MemberVO;
import com.spring.gogidang.menu.MenuService;
import com.spring.gogidang.menu.MenuVO;
import com.spring.gogidang.review.ReviewService;
import com.spring.gogidang.review.ReviewVO;


@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private ReviewService reviewSerivce;
	
	/*
	 * -form-
	 * 가게등록
	 */
	
	/*
	 * -기능-
	 * 가게 등록 + 수정
	 * 전체 가게 리스트
	 * 승인대기중인 가게 리스트
	 * 승인대기중인 가게 승인
	 * 승인대기중인 가게 거절
	 * 가게 상세 보기
	 */
	
	
	
	/*
	 * 전체 가게 리스트
	 */
	@RequestMapping(value = "/storeList.st")
	public String getShopList(Model model) {
		ArrayList<StoreVO> shopList = storeService.getStoreList();
		model.addAttribute("shopList", shopList);
		
		return "store/storeList";
	}
	
	/*
	 * 승인대기중인 가게 리스트 보기
	 */
	@RequestMapping(value = "/storeWait.st")
	public String getStoreWait(Model model) {
		ArrayList<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/storeWait";
	}
	
	/*
	 * 가게 상세 정보 보기
	 */
	@RequestMapping(value = "/storeInfo.st")
	public String shopInfo(StoreVO storeVO, Model model) {
		StoreVO vo = storeService.storeInfo(storeVO);
		ArrayList<MenuVO> menuList = menuService.getMenuList();
		ArrayList<ReviewVO> reviewList = reviewSerivce.reviewListAll();
		
		model.addAttribute("storeVO", vo);
		model.addAttribute("menuList",menuList);
		model.addAttribute("reviewList",reviewList);
		System.out.println(reviewList.size());
		
		
		return "store/store_Info";
	}
	
	/*
	 * 승인대기중인 가게 승인
	 */
	@RequestMapping(value = "/confirmStore.st")
	public String confirmStore(StoreVO storeVO) {
		storeService.confirmStore(storeVO);
		
		return "redirect:storeList.st";
	}
	
	/*
	 * 승인대기중인 가게 거절
	 */
	@RequestMapping(value = "/refuseStore.st")
	public String refuseStore(StoreVO storeVO) {
		storeService.refuseStore(storeVO);
		
		return "redirect:storeList.st";
	}
	
	// 가게 등록 form
	
	@RequestMapping("/storeRegForm.st")
	public String registrationForm(StoreVO storeVO, HttpSession session) throws Exception {
		
		storeVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
		StoreVO vo = storeService.selectStore(storeVO);

		session.setAttribute("StoreVO",vo);
		return "storesoo/store_registrationForm";
	}
	
	// 가게 등록 + 수정
	@RequestMapping("/storeProcess.st")
	public String storeProcess(StoreVO store , HttpSession session, HttpServletResponse response)throws Exception {
		//추가할내용 insert에서 세션을 다뤄야함 기억해두기 
		//insert 할때 가게 등록 저장되기전 가게승인 컬럼에 0(미승인)을 여기서 줘야함
		
		StoreVO vo1 = storeService.selectStore(store);
		
		// 가게등록이 안되어있을경우
		if ( vo1 == null || vo1.getS_num() == null || vo1.getS_num() == "") {
			
			store.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
			store.setConfirm(0); //처음 등록할때 미승인 상태로 띄워야하기때문에 insert전 데이터 넣어줌
			int res = storeService.insertStore(store);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			
			if (res==1) {
				
				session.setAttribute("StoreVO",store);
				writer.write("<script>alert('가게등록 성공!!'); location.href='./storeRegForm.st';</script>");
			}
			else {
				writer.write("<script>alert('가게등록 실패!!'); location.href='./storeRegForm.st';</script>");
			}
			
		}else { // 가게등록이 되어있을 경우
			
			store.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
			
			int res = storeService.updateStore(store);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			
			if(res != 0) {
				//업데이트 후 수정된 정보를 다시 가지고와서 세션 저장해주는것
				StoreVO vo2 = storeService.selectStore(store);
				session.setAttribute("StoreVO",vo2);
				writer.write("<script>alert('수정 성공!!!');" +"location.href = './storeRegForm.st';</script>");
				
			}else {

				writer.write("<script>alert('수정 실패!!!');" +"location.href = './storeRegForm.st';</script>");
			}
			
		}
		
		return null;
		
	}
	
	
	@RequestMapping("/menuRegForm.st")
	public String menuRegForm(StoreVO storeVO,MenuVO menuVO, HttpSession session, HttpServletResponse response ,Model model) throws Exception {

		storeVO.setU_id(((MemberVO)session.getAttribute("MemberVO")).getU_id());
		
		StoreVO vo = storeService.selectStore(storeVO);
		menuVO.setS_num(vo.getS_num());
		
		ArrayList<MenuVO> menuSelectList = menuService.selectMenu(menuVO);
		
		model.addAttribute("menuSelectList",menuSelectList);
		model.addAttribute("StoreVO",vo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		//사업자 번호 대신 가입승인 컬럼 가지고 비교해야됨 나중에 수정하기
		if( vo == null || vo.getConfirm() == 0 || vo.getS_num() == "") {
			
			writer.write("<script>alert('가게정보 등록 먼저 하세요!!!!');" +"location.href = './storeRegForm.st';</script>");
			
		}else {

			return "storesoo/menu_registrationForm";
		}
		 return null;
	}
	
	@RequestMapping("/menuProcess.st")
	public String menuProcess(MenuVO menuVO, HttpSession session , HttpServletResponse response) throws Exception {
		
		menuVO.setS_num(((StoreVO)session.getAttribute("StoreVO")).getS_num());
		System.out.println(menuVO.getS_num());
		menuVO.setU_id(((StoreVO)session.getAttribute("StoreVO")).getU_id());
		int i = 0;
		menuVO.setMenu_num(i++);
		
		int res = menuService.insertMenu(menuVO);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (res==1) {
			
			writer.write("<script>alert('메뉴등록 성공!!'); location.href='./menuRegForm.st';</script>");
		}
		else {
			writer.write("<script>alert('가게등록 실패!!'); location.href='./menuRegForm.st';</script>");
		}
	
		return null;
	}
	
	
	
}
