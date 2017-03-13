<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<link rel="stylesheet" href="styles/assets/css/datetimepicker.min.css" />
<script type="text/javascript" src="scripts/moment.js"></script>
<script type="text/javascript" src="scripts/datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/i18n/defaults-*.min.js"></script>

<link rel="stylesheet" href="styles/assets/css/lateral-menu.css" type="text/css">
<link rel="stylesheet" href="styles/assets/css/style-list.css" type="text/css">
<link rel="stylesheet" href="styles/assets/css/style-details.css" type="text/css">

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


<div class="container">

	<div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">

				<div class="profile-usermenu">
					<form method="get" action="route/search.do">

						<ul class="nav">

							<li class="active"><a> <i
									class="glyphicon glyphicon-map-marker img-origin"></i><spring:message code="route.origin" />
							</a></li>
							<li class="li-input"><input type="text" name="origin"
								class="form-control input-text"></li>
							<li class="active"><a> <i
									class="glyphicon glyphicon-map-marker img-destination"></i>
									<spring:message code="route.destination" />
							</a></li>
							<li class="li-input"><input name="destination" type="text"
								class="form-control input-text"></li>
							<li class="active"><a target="_blank"> <i
									class="glyphicon glyphicon-plane"></i><spring:message code="route.date" />
							</a></li>
							
							<li class="li-input">
								<div class='input-group date input-text' id='datetimepicker1'>
									<input name="fecha" style="backgroud-color: white;" type='text'
										class="form-control" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</li>
							<!--
							<li class="li-input">
								<div class='input-group date input-text' id='datetimepicker2'>
									<input name="fecha" style="backgroud-color: white;" type='text'
										class="form-control" /> <span class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</li> -->
							
							<li class="active"><a> <i
									class="glyphicon glyphicon-eye-open"></i><spring:message code="route.package" />
							</a></li>
							<li style="padding-bottom: 2%;">
								<div class="form-check form-check-inline input-text">
									<label class="form-check-label"> <input
										class="form-check-input" type="checkbox" id="inlineCheckbox1"
										value="open"> <i class="demo-icon icon-package-1">&#xe800;</i><spring:message code="route.open" />
									</label> <label class="form-check-label"> <input
										class="form-check-input" type="checkbox" id="inlineCheckbox2"
										value="close"> <i class="demo-icon icon-package-1">&#xe801;</i><spring:message code="route.closed" />
									</label>
								</div>

							</li>
							<li class="active"><a> <i
									class="glyphicon glyphicon-resize-full"></i><spring:message code="route.sizes" />
							</a></li>
							<li style="text-align: center" class="li-input"><select
								class="selectpicker input-text" multiple name="tam">
									<option selected="selected" value="xs">XS</option>
									<option selected="selected" value="s">S</option>
									<option selected="selected" value="m">M</option>
									<option selected="selected" value="l">L</option>
									<option selected="selected" value="xl">XL</option>
							</select></li>
							<li class="active"><button type="submit"
									class="btnSearch btn-lg btnSample btn-block btn-success">
									<spring:message code="welcome.search" /> <span class="glyphicon glyphicon-search"></span>
								</button></li>
						</ul>
					</form>

				</div>
				<!-- END MENU -->
			</div>
		</div>
		
		
		
		
		
		
		<div class="col-md-9">
			<div class="profile-content">
			<h3><spring:message code="route.routes" /></h3>
							<div class="row ruta">
								<div class="row rtitulo">
									<div class="rtitulo col-sm-12 text-center ">
										<h4 class="titulo">${route.creator.name}</h4>
									</div>
								</div>
								<div class="row info-ruta">
									<div class="rfecha col-xs-7 col-sm-9">

										<div class="row info-lugar">

											<div class="col-xs-12 col-sm-4 text-center">
												<a><i class="glyphicon glyphicon-map-marker img-origin"></i>${route.origin}
												</a>
											</div>

											<div class="col-sm-2 text-center">
												<i class="glyphicon glyphicon-sort"></i>
											</div>

											<div class="col-xs-12 col-sm-4 text-center">
												<a> <i
													class="glyphicon glyphicon-map-marker img-destination"></i>${route.destination}
												</a>
											</div>
										</div>

										<div class="row">
											<div class="info-salida col-sm-12 ">

												<i class="glyphicon glyphicon-plane"></i> 
												<spring:message code="route.departureTime" />: ${route.date} / ${route.departureTime}
												<br/>
												<i class="glyphicon glyphicon-plane"></i> 
												<spring:message code="route.arriveTime" />: ${route.arriveTime}

											</div>
										</div>
										<div class="row info1">
											<div class="col-xs-6">
												<i class="demo-icon icon-package-1">&#xe800;</i><spring:message code="route.itemEnvelope" />: 
												${route.itemEnvelope}


											</div>
											<div class="col-xs-6">
												<i class="demo-icon icon-package-1">&#xe802;</i><spring:message code="route.size" />: XXX


											</div>
										</div>
										

									</div>
									<div class="imagen col-xs-5 col-sm-3 center">
										<div class="row text-center">
											<div class="col-xs-12">
												<img class="img-responsive center-block imagen-envio"
													width="70" height="70" src="images/anonymous.png">
											</div>
											
										</div>

									</div>
				
				<div class="imagen col-xs-5 col-sm-3 center">
					<div class="row text-center">
												
						<!-- Hecho por Guillermo para poder meter el link
						Si es necesario cambiarlo, no hay problemas -->	
											
						<form action="shipment/user/select.do?shipmentId=${route.id}" method="get">
							<input type=submit class="btn-sm btn-llevar btn btn-success ok"
								value= "<spring:message code="route.hire" /> <jstl:set var="price" value="${fn:replace(price,
                                '.0', '')}" /> <jstl:set var="priceFormated" value="${fn:replace(price, 
                                '.', ',')}" />${priceFormated} euros"/></input>
						</form>
						
						<security:authorize access="hasRole('USER')">
							<input type=submit class="btn-xs btn-llevar btn btn-danger contraoferta"
								value= "<spring:message code="route.offer" />" onclick="location.href = 'routeOffer/user/create.do?routeId=${route.id}';"></input>
						</security:authorize>
												
					</div>

				</div>
					
									
									
									
								</div>

							</div>
						
			</div>


		</div>

	</div>
</div>



<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
			viewMode : 'days',
			format : 'DD/MM/YYYY'
		});
	});
	
	
      $(function () {
          $('#datetimepicker2').datetimepicker();
      });
</script>
