<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='spring' uri='http://www.springframework.org/tags'%>
<!doctype html>
<html lang='nl'>
<head>
<title>Filialen</title>
<link rel='shortcut icon' href='${contextPath}/images/favicon.ico'
	type='image/x-icon' />
<meta name='viewport' content='width=device-width,initial-scale=1'>
<link rel='stylesheet' href='/styles/default.css'>
</head>
<body>
	<nav>
		<ul>
			<li><a href="<c:url value='/filialen'/>">Filialen</a></li>
			<li><a href="<c:url value='/filialen/toevoegen'/>">Filiaal
					toevoegen</a></li>
			<li><a href="<c:url value='/filialen/perpostcode'/>">Filialen
					per postcode</a></li>
			<li><a href="<c:url value='/werknemers'/>">Werknemers</a></li>
			<li><a href="<c:url value='/offertes/aanvraag'/>">Aanvraag
					offerte</a></li>
			<li><a href="<c:url value='/'/>">Welkom</a></li>
			<c:url value='' var='nederlandsURL'>
				<c:param name='locale' value='nl_be' />
			</c:url>
			<li><a href='${nederlandsURL}'>Nederlands</a></li>
			<c:url value='' var='engelsURL'>
				<c:param name='locale' value='en_us' />
			</c:url>
			<li><a href='${engelsURL}'>Engels</a></li>

		</ul>
	</nav>
	<h1>
		<spring:message code="aantalFilialen" arguments="${aantalFilialen}" />
	</h1>
	<c:forEach items='${filialen}' var='filiaal'>
		<spring:url var='url' value='/filialen/{id}'>
			<spring:param name='id' value='${filiaal.id}' />
		</spring:url>
		<h2>
			<a href='${url}'>${filiaal.naam}</a>
		</h2>
		<p>${filiaal.adres.straat}
			${filiaal.adres.huisNr}<br> ${filiaal.adres.postcode}
			${filiaal.adres.gemeente}
		</p>
	</c:forEach>
</body>
</html>