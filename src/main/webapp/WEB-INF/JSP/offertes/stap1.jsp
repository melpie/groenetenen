<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<!doctype html>
<html lang='nl'>
<head>
<title>Aanvraag offerte (stap 1)</title>
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
	<h1>Aanvraag offerte</h1>
	<h2>Stap 1</h2>
	<c:url value='/offertes' var='url' />
	<form:form action='${url}' commandName='offerte'>
		<form:label path='voornaam'>Voornaam:<form:errors
				path='voornaam' />
		</form:label>
		<form:input path='voornaam' autofocus='true' required='true' />
		<form:label path='familienaam'>Familienaam:
<form:errors path='familienaam' />
		</form:label>
		<form:input path='familienaam' required='true' />
		<form:label path='emailAdres'>E-mail adres:
<form:errors path='emailAdres' />
		</form:label>
		<form:input path='emailAdres' required='true' type='email' />
		<input type='submit' value='Volgende stap' name='van1naar2'>
	</form:form>
</body>
</html>