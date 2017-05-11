<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<link rel="stylesheet" href="styles/assets/css/datetimepicker.min.css" />
<script async type="text/javascript" src="scripts/moment.min.js"></script>
<script async type="text/javascript" src="scripts/datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="styles/assets/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script async
	src="styles/assets/js/bootstrap-select.min.js"></script>

<link rel="stylesheet" href="styles/assets/css/lateral-menu.css" type="text/css">
<link rel="stylesheet" href="styles/assets/css/style-list.css" type="text/css">
<script src="scripts/jquery.bootpag.min.js"></script>

<script async type="text/javascript" src="scripts/es.min.js"></script>

<style>

@font-face {
	font-family: 'icons';
	src: url('styles/assets/fonts/iconos/iconos.eot?58322891');
	src: url('styles/assets/fonts/iconos/iconos.eot?58322891#iefix')
		format('embedded-opentype'),
		url('styles/assets/fonts/iconos/iconos.woff?58322891') format('woff'),
		url('styles/assets/fonts/iconos/iconos.ttf?58322891')
		format('truetype'),
		url('styles/assets/fonts/iconos/iconos.svg?58322891#fontello')
		format('svg');
	font-weight: normal;
	font-style: normal;
}

</style>

<div class="blue-barra">
	    <div class="container">
			<div class="row">
				<h3><spring:message code="shipment.shipment" /></h3>
			</div><!-- /row -->
	    </div>
	</div>


<div class="container">

	<div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">

				<div class="profile-usermenu">
					<form method="get" action="shipment/search.do">

						<ul class="nav">

							<li class="active"><a> <i
									class="glyphicon glyphicon-map-marker img-origin"></i> <spring:message code="shipment.origin" />
							</a></li>
							<li class="li-input"><input type="text" id="origin" name="origin"
								class="form-control input-text" value="${origin}" placeholder="" required></li>
							<li class="active"><a><i
									class="glyphicon glyphicon-map-marker img-destination"></i>
									<spring:message code="shipment.destination" />
							</a></li>
							<li class="li-input"><input id="destination" name="destination" type="text"
								class="form-control input-text" value="${destination}" placeholder="" required></li>
							<li class="active"><a href="" target="_blank"> <i
									class="glyphicon glyphicon-plane"></i> <spring:message code="shipment.date" />
							</a></li>
							<li class="li-input">
								<div class='input-group fondoDesplegable input-text' id='datetimepicker1'>
									<input name="date" style="backgroud-color: white;" type='text'
										class="form-control" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</li>
							<li class="active"><a href="" target="_blank"> <i
									class="glyphicon glyphicon-time"></i> <spring:message code="shipment.hour" />
							</a></li>
							<li style="text-align: center" class="li-input">
								<select class="form-control selectpicker input-text fondoDesplegable" name="hour">
								<option selected="selected" disabled value=''><spring:message code="shipment.select.hour" /></option>
									<jstl:forEach begin="0" end="23" varStatus="i">
										<jstl:choose>	
											<jstl:when test="${i.index lt 10 }">
												<option>0${i.index}:00</option>
											</jstl:when>
											<jstl:otherwise>
												<option>${i.index}:00</option>
											</jstl:otherwise>
										</jstl:choose>
									</jstl:forEach>
								</select>
							</li>
							<li class="active"><a href="#"> <i
									class="glyphicon glyphicon-eye-open"></i><spring:message code="shipment.package" />
							</a></li>
							<li style="padding-bottom: 2%;">
								<div class="form-check form-check-inline input-text">
									<label class="form-check-label"> <input
										class="form-check-input" type="checkbox" id="inlineCheckbox1" name="envelope"
										value="open"> <i class="demo-icon icon-package-1">&#xe800;</i><spring:message code="shipment.open" />
									</label> <label class="form-check-label"> <input
										class="form-check-input" type="checkbox" id="inlineCheckbox2" name="envelope"
										value="close"> <i class="demo-icon icon-package-1">&#xe801;</i><spring:message code="shipment.closed" />
									</label>
								</div>

							</li>
							<li class="active"><a> <i
									class="glyphicon glyphicon-resize-full"></i> <spring:message code="shipment.itemSize" />
							</a></li>
							
							<spring:message code="shipment.sizeS" var="s" />
							<spring:message code="shipment.sizeM" var="m" />
							<spring:message code="shipment.sizeL" var="l" />
							<spring:message code="shipment.sizeXL" var="xl" />
							<li style="text-align: center" class="li-input"><select
								class="form-control selectpicker input-text fondoDesplegable" name="itemSize">
									<option selected="selected" disabled value=''><spring:message code="shipment.select.sizes" /></option>
									<option value="S">"${s }" </option>
									<option value="M">"${m }" </option>
									<option value="L">"${l }" </option>
									<option value="XL">"${xl }" </option>
							</select></li>
							<li class="active"><button type="submit"
									class="btnSearch btn-lg btnSample btn-block btn-success">
									<spring:message code="welcome.search" /><span class="glyphicon glyphicon-search"></span>
								</button></li>
						</ul>
					</form>

				</div>
				<!-- END MENU -->
			</div>
		</div>






		<div class="col-md-9">
			<div class="profile-content">
					
					<div class="panel panel-default">
					<div class="panel-body">
						
						<div class="table-container">
					<table class="table table-filter">
								<tbody>
								
								
								<jstl:choose>
					<jstl:when test="${not empty shipments}">
						<jstl:forEach items="${shipments}" var="shipment">
								
									<tr>
										
										<td>
											
											
										<div class="row">
										
											<div class="col-lg-3 text-center">

												<img src="${shipment.itemPicture}" class="media-photo-shipment">
													
											</div>
										
											<div class="info-salida col-lg-6" style="margin-bottom: 2%; font-size: 16px;">
												<div class="cabecera">
												<div class="title">
													<h4><a href="shipment/display.do?shipmentId=${shipment.id}">${shipment.itemName}</a></h4>
												</div>
												
												<a target="_blank" href="http://maps.google.com/maps?q=${shipment.origin}"><i class="glyphicon glyphicon-map-marker img-origin"></i>${shipment.origin}</a>
											
												<i class="glyphicon glyphicon-sort"></i>
											
												<a target="_blank" href="http://maps.google.com/maps?q=${shipment.destination}"> <i
													class="glyphicon glyphicon-map-marker img-destination"></i>${shipment.destination}
												</a>
														
												
												</div>	
						

										

												<i class="glyphicon glyphicon-plane"></i> 
												<spring:message code="shipment.departureTime" />: 
												<fmt:formatDate value="${shipment.departureTime}" pattern="dd/MM/yyyy '-' HH:mm" />
												
												
												<br/>
												<i class="glyphicon glyphicon-plane"></i> 
												<spring:message code="shipment.maximumArriveTime" />: 
												<fmt:formatDate value="${shipment.maximumArriveTime}" pattern="dd/MM/yyyy '-' HH:mm" />
												
													
											</div>
											<div class="col-lg-3 profile-userbuttons" style="margin-top: 5%;">
											
												<div class="price">${shipment.price}&#8364;</div>	
												<button type="button" class="btn button-ok btn-block" style="font-size: 15px;" onclick="location.href = 'shipment/display.do?shipmentId=${shipment.id}';"><spring:message code="route.details" />&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></button>	
											

											</div>
										</div>
											
										
											
										</td>
									</tr>
									</jstl:forEach>
					</jstl:when>
					<jstl:otherwise>
						<p><spring:message code="shipment.results" /></p>
					</jstl:otherwise>
				</jstl:choose>
								</tbody>
							</table>
				<div id="pagination" class="copyright" style="text-align: center;">
					
						<script>
							$('#pagination').bootpag({
								total : <jstl:out value="${total_pages}"></jstl:out>,
								page : <jstl:out value="${p}"></jstl:out>,
								maxVisible : 5,
								leaps : true,
								firstLastUse : true,
								first : '<',
					            last: '>',
								wrapClass : 'pagination',
								activeClass : 'active',
								disabledClass : 'disabled',
								nextClass : 'next',
								prevClass : 'prev',
								lastClass : 'last',
								firstClass : 'first'
							}).on('page', function(event, num) {
								window.location.href = "${urlPage}" + num + "";
								page = 1
							});
						</script>
					
					</div>

				</div>




			</div>
</div></div>

		</div>







	</div>
</div>



<script type="text/javascript">

function initialize() {

	var input = document.getElementById('origin');
	var input2 = document.getElementById('destination');
	var options = {
		types: ['(cities)'],
		componentRestrictions: {country: 'es'}
	};
	var autocomplete = new google.maps.places.Autocomplete(input, options);
	var autocomplete = new google.maps.places.Autocomplete(input2, options);
	}
	
	
	google.maps.event.addDomListener(window, 'load', initialize);



	$(function() {
		$('#datetimepicker1').datetimepicker({
			viewMode : 'days',
			locale: 'es',
			format : 'DD/MM/YYYY'
		});
	});
</script>
