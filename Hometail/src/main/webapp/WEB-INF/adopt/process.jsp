<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/paper.jpg');" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">입양절차</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../main/main.do">Home <i class="ion-ios-arrow-forward"></i></a></span> <span><a href="../adopt/list.do">입양 <i class="ion-ios-arrow-forward"></i></a></span></p>
          </div>
        </div>
      </div>
</section>
<section class="ftco-services">
			<div class="container">
				<div class="row justify-content-start mb-5 pb-5">
          <div class="col-md-4 heading-section ftco-animate">
            <h2 class="mb-4">입양절차</h2>
          </div>
          <div class="col-md-8 pl-md-5 ftco-animate">
          	<div class="pl-md-4 border-line">
	          	<p>반려동물을 하고 싶다면 유기동물보호시설에서 보호하고 있는 유기동물을 입양하는게 어떨까요?</br>
	          	각 지점 전문가와의 꼼꼼한 상담 및 신원 확인을 통해 보호소 입양을 진행하고 있습니다.</p>
          	</div>
          </div>
        </div>
				<div class="row">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="">1</span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">홈페이지 공고 확인 후 방문</h3>
                <p>홈페이지에서 보호중인 아이들의 공고를 확인 후 보호소에 방문합니다.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="">2</span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">상담 및 보호중인 아이와의 만남 </h3>
                <p>관리사와 상담을 진행 후 책임분양을 원하는 아이와 만납니다.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="">3</span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">책임분양 계약서 작성 후 분양</h3>
                <p>분양결정을 내린 후 책임 분양 계약서를 작성합니다.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="icon d-flex justify-content-center align-items-center">
            		<span class="">4</span>
              </div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">입양 이후 소식 전달</h3>
                <p>새로운 가족을 만나게 된 아이들의 소식을 제공받습니다.</p>
              </div>
            </div>      
          </div>
          
        </div>
        <!-- list -->
         <section>
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		  <div class="panel panel-default">
		    <div class="panel-heading" role="tab" id="headingOne">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		          입양신청서
		        </a>
		      </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
		      <div class="panel-body">
		       <h5 class="g-color-primary font-weight-bold g-mb-30">* 다음 양식을 채워주세요</h5>
				
                 <form action="process_ok.do" method="post">
		        <table class="table table-boardered">
		            <tr>
		                <th>1. 신청인 성명</th>
		                <td><input type="text" class="form-control" name="id"></td>        
		            </tr>
		            <tr>
		                <th>2. 성별</th>
		                <td>
		                <input type="radio"  name="sex" value="남">남 &nbsp;&nbsp;
		                <input type="radio"  name="sex" value="여">여 &nbsp;&nbsp;
		                </td>     
		            </tr>
		            <tr>
		                <th>3. 연령</th>
		                <td><input type="age" class="form-control" name="age" placeholder="숫자만 입력"></td>      
		            </tr>
		            <tr>
		                <th>4. 전화번호</th>
		                <td><input type="tel" class="form-control" name="tel" placeholder="숫자만 입력"></td>      
		            </tr>
		            <tr>
		                <th>5. 이메일</th>
		                <td><input type="email" class="form-control" name="email"></td>       
		            </tr>
		            <tr>
		                <th>6. 통화하기 편한 시간</th>
		                <td><input type="time" class="form-control" name="time"></td>       
		            </tr>
		            <tr>
		                <th>7. 사시는 지역</th>
		                <td><input type="area" class="form-control" name="area" placeholder="(예: 서울,경기,부산..)"></td>       
		            </tr>
		            <tr>
		                <th>8. 결혼여부</th>
		                <td>
		                <input type="radio"  name="marry" value="기혼">기혼 &nbsp;&nbsp;
		                <input type="radio"  name="marry" value="미혼">미혼 &nbsp;&nbsp;
		                </td>     
		            </tr>
		            <tr>
		                <th>9. 신청인 직업</th>
		                <td><input type="jab" class="form-control" name="jab"></td>       
		            </tr>
		            <tr>
		             <th><h5 class="g-color-primary font-weight-bold g-mb-30">* 지금부터 설문을 시작하겠습니다</h5></th>
     				 </tr>
		            <tr>
		                <th>1. 예전에 반려동물을 키우신 적이 있으신가요?</th>
		                <td>
		                <input type="radio"  name="past" value="예">예 &nbsp;&nbsp;
		                <input type="radio"  name="past" value="아니오">아니오 &nbsp;&nbsp;
		                </td>     
		            </tr>
		            <tr>
		                <th>2. 현재 집에서 다른 동물을 키우고 계십니까? </th>
		                <td>
		                <input type="radio"  name="now" value="예">예 &nbsp;&nbsp;
		                <input type="radio"  name="now" value="아니오">아니오 &nbsp;&nbsp;
		                </td>     
		            </tr>
		             <tr>
		                <th>2-1.만일 있으시다면 다음 사항에 입력해주세요</th>
		                 <td>종류<input type="akind" class="form-control" name="akind"></td>&nbsp;&nbsp;
		                 <td>나이<input type="aage" class="form-control" name="aage"></td>&nbsp;&nbsp;
		                 <td>성별<input type="asex" class="form-control" name="asex"></td>&nbsp;&nbsp;  
		                   
		            </tr>
		             <tr>
		                <th>3. 가족들은 입양에 대해서 모두 찬성하시나요? </th>
		                <td>
		                <input type="radio"  name="agree" value="모두 찬성">모두 찬성 &nbsp;&nbsp;
		                <input type="radio"  name="agree" value="부분 찬성">부분 찬성 &nbsp;&nbsp;
		                <input type="radio"  name="agree" value=" 본인제외 모두반대">본인제외 모두반대 &nbsp;&nbsp;
		                </td>     
		            </tr>
		            <tr>
		                <th>4. 입양을 원하시는 이유는 무엇인가요?</th>
		                <td><input type="want" class="form-control" name="want"></td>       
		            </tr>
		            <tr>
		                <th>5. 부재시 반려동물을 어떻게 관리하실 예정이신가요?</th>
		                <td><input type="absen" class="form-control" name="absen"></td>       
		            </tr>
		            <tr>
		                <th>6. 하고 싶은 말이 있으신가요?</th>
		                <td>
		                 <textarea rows="5" cols="40" name="info" class="form-control"></textarea>
		                </td>     
		            </tr>
		            <tr>
		                <td colspan="2">
		                <input type="submit" class="btn btn-primary" value="전송">
		                <input type="reset" class="btn btn-danger" value="취소">
		                </td>
		            </tr>
		             
		             
		        </table>
		    </form>



                    </div>
                </div>
		       
		      </div>
		    </div>
		  </div>

		</section>
	
        <div id="root"></div>
        <script src="../process/bundle.js"></script>
        
			</div>
		</section>
</body>
</html>