<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<title>사회보장정보원 규정</title>
<link rel="Stylesheet" type="css/text" href="app.css"/>
<style>
.btn_click{
   background-color : rgb(255,255,255);
   border: none;
   padding : 10px;
   margin: 5px;
   font-size: 12pt;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
<link rel="stylesheet" type="text/css" href="app.css?alter"/>

   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
   <script type="text/javascript">
        $(document).ready(function () {
            
            $('li:not(:has(ul))').css({ cursor: 'default', 'list-style-image':'none'});
           
            
            $('li:has(ul)') //자식 요소(ul)를 갖는 요소(li)에 대해서
                .css({cursor: 'pointer', 'list-style-image':'url(C:\Users\USER\Desktop\plus.gif)'})
                .children().hide(); //자식요소 숨기기
               
            $('li:has(ul)').click(function(event){
                           
                //this == event.target으로 현재 선택된 개체에 대해서 처리
                if(this == event.target){
                      if ($(this).children().is(':hidden')) {
                        $(this).css('list-style-image', 'url(minus.gif)').children().slideDown();
                    }
                    else {
                        $(this).css('list-style-image', 'url(C:\Users\USER\Desktop\plus.gif)').children().slideUp();
                    }
 
                }
                return false;          
            });
        });
    </script>
 
</head>
<body lang = "ko">
<%@ include file="top.jsp"%>
<div class="treeview">
        <legend>사회보장정보원 사규목록 </legend>
        <ul>
           
            <li style = {margin-bottom:10px}>사규
                <ul>
                    <li>기본운영
                        <ul>
                            <li>규칙</li>
                                <ul class = "dropdown-menu">
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=27'">제규정관리규칙</a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=28'">자문위원회운영규칙</a></li>
                                </ul>
                             <li>정관</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=25'">정관</a></li>   
                                </ul>
                              <li>규정</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=26'">이사회 운영 규정</li>   
                                </ul>  
                        </ul>
                    </li>
                    <li>조직
                      <ul>
                            <li>규정</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=29'">직제규정</button></a></li>
                                </ul>
                             <li>규칙</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=30'">직제규정시행규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=31'">위임전결규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=32'">임시조직 관리규칙</button></a> </li>     
                                </ul>
                        </ul>
                    </li>
                    <li>인사보수
                        <ul>
                             <li>규정</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=33'">인사규정</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=37'">복무규정</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=39'">임원추천위원회 운영규정</button></a> </li>   
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=40'">임원 직무 청렴계약 운영규정</button></a> </li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=41'">보수규정</button></a></li>   
                                </ul>
                             <li>규칙</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=34'">인사규정시행규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=36'">무기계약근로자 등 관리규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=42'">보수규정시행규칙</button></a></li>   
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=44'">교육훈련규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=46'">상임이사 임명에 관한 규칙 </button></a></li>   
                                </ul>
                                
                              <li>예규</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=35'">연구직 및 연구관리 예규</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=38'">임직원 국외여행 운영예규</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=43'">여비지급예규</button></a></li>   
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=45'">공로연수 운영예규</button></a></li>
                                </ul>
                        </ul>
                    </li>
                    <li>회계감사
                        <ul>
                             <li>규정</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=47'">회계감사인 선임위원회 운영규정</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=48'">재무회계규정</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=51'">감사규정</button></a></li>      
                                </ul>
                             <li>규칙</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=49'">재무회계규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=50'">물품관리운영규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=52'">감사규정시행규칙</button></a></li>   
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=53'">임직원 행동강령</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=54'">임직원 윤리강령</button></a></li>   
                                </ul>
                                
                              <li>예규</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=55'">윤리경영 실천예규</button></a></li>
                                </ul>
                        </ul>
                    </li>
                    <li>업무
                        <ul>
                             <li>규칙</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=56'">신분증 관리규칙</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=57'">당직및 비상근무규칙</button></a></li>    
                                </ul>
                             <li>예규</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=58'">사무관리예규</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=59'">법인카드 관리 및 운영예규</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=61'">차량관리예규</button></a></li>   
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=62'">정보시스템사용자 교육운영예규</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=63'">고객상담센터 운영예규 </button></a> </li> 
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=64'">민원사무처리예규</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=65'">소송 및 법률자문 업무처리 예규</button></a></li>   
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=66'">경영공시 운영관리 예규</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=67'">통계관리예규</button></a></li> 
                                </ul>
                        </ul>
                    </li>
                     <li>보안업무
                        <ul>
                             <li>규정</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=68'">보안업무규정</button></a></li>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=69'">정보보안업무규정</button></a></li>    
                                </ul>
                             <li>규칙</li>
                                <ul>
                                   <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=70'">개인정보보호규칙</button></a></li>
                                </ul>
                        </ul>
                    </li>  
                </ul>
                
                
                
           </li>
           <li>지침
                <ul>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=71'">공익신고 처리 및 신고자 보호 등에 관한 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=72'">공직생애주기별 청렴교육 이수제도 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=73'">부정청탁 및 금품등 수수의 신고사무 처리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=74'">부패행위 신고 접수 처리 및 신고자 보호 등에 관한 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=75'">외부강의등 신고·관리업무 세부기준</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=76'">음주운전사건 처리기준</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=77'">일상감사 실시지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=78'">임직원의 직무 관련 범죄 세부고발기준</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=79'">직위별 직무별 청렴행동수칙 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=80'">청렴마일리지 제도 운영 지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=81'">청렴옴부즈만 설치 및 운영 지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=82'">협력회사 행동지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=83'">2019년도 예산집행지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=84'">자문위원회 세부운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=85'">제안제도 운영기준</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=100'">정보공개 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=101'">임직원 사택관리.운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=102'">상조회 운영회칙</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=103'">지역보건의료정보시스템 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=104'">상담업무 처리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=105'">전산교육장 관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=106'">홈페이지 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=107'">정보보호정책관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=108'">개인정보보호 내부관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=109'">정보보안점검지침 </button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=110'">용역사업보안관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=111'">보조기억매체보안관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=112'">사이버위기대응지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=113'">인원보안지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=114'">물리적보안지침</button></a> </li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=115'">정보자산보안관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=116'">정보시스템보안관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=117'">PC보안관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=118'">암호화관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=119'">데이터품질관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=120'">ITSM 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=121'">PMS 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=122'">보건복지 분야 개인정보 비식별 조치 지원 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=123'">개인정보 외부제공 기준</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=124'">공공데이터 개방관리 지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=125'">사회보장정보시스템(행복e음) 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=126'">사회서비스제공기관 평가관리 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=131'">연구직 및 연구업무 관리지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=132'">일자리 창출(미래성장 동력 발굴) 위원회 설치,운영 지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=133'">직원 복무관리 지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=134'">test 테스트</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=135'">사회복지시설정보시스템 운영지침</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=136'">전산수당 지급기준</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=137'">직무급 운영기준</button></a></li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=138'">임금피크제 별도직군 운영기준</button></a> </li>
                    <li><button class="btn_click" onclick ="location.href ='view.jsp?seq=139'">기록물관리지침</button></a></li>
                                                
                </ul>
            </li>
        </ul>

 </div>
</body>
</html>