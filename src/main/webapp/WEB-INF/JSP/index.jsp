<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!doctype html>
<html lang='nl'>
<head>
<title>Groene tenen</title>
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
	<h1>Groene tenen</h1>
	<blockquote>De aanleg van een gezellig gazon</blockquote>
	<c:url value="/images/ochtend.jpg" var="landImage" />
	<c:set var='foto' value='${empty foto ? "ochtend" : foto}' />
	<img alt='gazon in de ${foto}' src='${contextPath}/images/${foto}.jpg'
		class='fullwidth'>
	<c:url var='ochtendURL' value=''>
		<c:param name='foto' value='ochtend' />
	</c:url>
	<c:url var='avondURL' value=''>
		<c:param name='foto' value='avond' />
	</c:url>
	<a href='${ochtendURL}'>Ochtend</a>
	<a href='${avondURL}'>Avond</a>
</body>
</html>