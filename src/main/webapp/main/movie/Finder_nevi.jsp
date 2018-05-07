<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = "findresult">
			<div id = "result-title">
			<hr class = "hr-title">
			아래의 선택조건에 해당하는 영화가 <font>총 ${moviePage.totalA }건</font> 검색되었습니다.
			</div>
			<div id = "findinfoform">
				<div id = "findinfo">
				<table>
					<tr>
						<td>
							<ul id = "title">
								<li>키워드 : </li>
								<li>장르 : </li>
								<li>제작국가 : </li>
								<li>관람등급 : </li>
							</ul>
						</td>
						<td>
							<ul id = "content">
								<li>
									<c:if test="${requestScope.movie_keyword == null || requestScope.movie_keyword == ''}">
										전체
									</c:if>
									<c:if test="${requestScope.movie_keyword != null}">
										<c:forEach var = "movie_type" items="${requestScope.movie_keyword }">
											${movie_keyword }
										</c:forEach>
									</c:if>
								</li>
								<li>
									<c:if test="${requestScope.movie_type == null}">
										전체
									</c:if>
									<c:if test="${requestScope.movie_type != null}">
										<c:forEach var = "movie_type" items="${requestScope.movie_type }">
											${movie_type }
										</c:forEach>
									</c:if>
								</li>
								<li>
									<c:if test="${requestScope.make_nation == null}">
										전체
									</c:if>
									<c:if test="${requestScope.make_nation != null}">
										<c:forEach var = "make_nation" items="${requestScope.make_nation }">
											${make_nation }
										</c:forEach>
									</c:if>
								</li>
								<li>
									<c:if test="${requestScope.movie_show_grade == null}">
										전체
									</c:if>
									<c:if test="${requestScope.movie_show_grade != null}">
										<c:forEach var = "movie_show_grade" items="${requestScope.movie_show_grade }">
											${movie_show_grade }
										</c:forEach>
									</c:if>
								</li>
							</ul>
						</td>
					</tr>						
				</table>
				
				</div>
			</div>
			<div id = "findcontentform">
				<div id = "findcontent">
				<c:forEach var ="find_list" items="${requestScope.find_list }">
					<div id = "findentity">
						<div id = "entity-poster">
						<c:forEach var ="poster_map" items="${requestScope.poster_map }" >
							<c:if test="${poster_map.key == find_list.movie_code }">
								<img src = "../../image/storage/moviephoto/${poster_map.value }">
							</c:if>
						</c:forEach>
						</div>
						<div id = "entity-title">
							<a href = "movieDetailView.do?movie_code=${find_list.movie_code }&photo_pg=1&trailer_pg=1">
							${find_list.movie_name }
							</a>
						</div>
						<div id = "entity-reserverate">
							예매율&emsp; 
							<c:forEach var="reserve_rate_map" items="${requestScope.reserve_rate_map }">
								<c:if test="${find_list.movie_code == reserve_rate_map.key }">
								${fn:substring( ''+(reserve_rate_map.value),0,4) } %
								( 
								<c:if test="${find_list.movie_evaluat_num == 0}">
									평점 없음
								</c:if>
								<c:if test="${find_list.movie_evaluat_num != 0}">
									평점 : ${fn:substring( ''+(find_list.acc_evaluat_score / find_list.movie_evaluat_num),0,4) } 점
								</c:if>)
								</c:if>
							</c:forEach>
						</div>
						<div id = "entity-opendate">
							${find_list.movie_open_date }
						</div>
						<div id = "entity-reserve">
							<a href="../../reserve.do?movie_code=${find_list.movie_code }" id = "reserve-btn" class="btn btn-info btn-lg" href = "movieDetailView.do?movie_code=${find_list.movie_code }">
          						<span class="glyphicon glyphicon-film"> 예매</span>
        					</a>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<div id = "findpagingform">
				<div id ="findpaging">
<%-- 				<c:if test="${requestScope.movie_keyword == null || requestScope.movie_keyword == '' || requestScope.movie_type == null || requestScope.make_nation == null || requestScope.movie_show_grade == null}"> --%>
<%-- 					<c:if test="${moviePage.startPage>1 }"> --%>
<%-- 						[<a id="paging" href="movieFinder.do?pg=${moviePage.startPage-1 }" class="previousbtn">이전</a>] --%>
<%-- 					</c:if>  --%>
<%-- 					<c:forEach var="i" begin="${moviePage.startPage}" end="${moviePage.endPage}" step="1"> --%>
<%-- 					<c:if test="${moviePage.pg==i }"> --%>
<%-- 						[<a id="currentPaging" href="movieFinder.do?pg=${i }" class="movebtn">${i }</a>] --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${moviePage.pg!=i }"> --%>
<%-- 						[<a id="paging" href = "movieFinder.do?pg=${i }" class="movebtn">${i }</a>] --%>
<%-- 					</c:if> --%>
<!-- 					el표현식에는 자바코드가 들어갈수없음 -->
<%-- 					</c:forEach> --%>
<%-- 					<c:if test="${moviePage.endPage<moviePage.totalPage}"> --%>
<%-- 						[<a id="paging" href="movieFinder.do?pg=${moviePage.endPage+1 }" class="nextbtn">다음</a>] --%>
<%-- 					</c:if> <!-- el표현식에는 자바코드가 들어갈수없음 --> --%>
<%-- 				</c:if> --%>
				</div>
			</div>
		</div>
	
</body>
</html>