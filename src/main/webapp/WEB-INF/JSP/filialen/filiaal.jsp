<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='spring' uri='http://www.springframework.org/tags'%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<!doctype html>
<html lang='nl'>
<head>
<title>'${filiaal.naam}'</title>
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
	<c:choose>
		<c:when test="${not empty filiaal}">
			<h1>${filiaal.naam}</h1>
			<dl>
				<dt>Straat</dt>
				<dd>${filiaal.adres.straat}</dd>
				<dt>Huisnr.</dt>
				<dd>${filiaal.adres.huisNr}</dd>
				<dt>Postcode</dt>
				<dd>${filiaal.adres.postcode}</dd>
				<dt>Gemeente</dt>
				<dd>${filiaal.adres.gemeente}</dd>
				<dt>Type</dt>
				<dd>${filiaal.hoofdFiliaal ? "Hoofdfiliaal" : "Bijfiliaal"}</dd>
				<dt>Waarde gebouw</dt>
				<dd>
					&euro;
					<spring:eval expression='filiaal.waardeGebouw' />
				</dd>
				<dt>Ingebruikname</dt>
				<dd>
					<spring:eval expression='filiaal.inGebruikName' />
				</dd>
			</dl>
			<spring:url value='/filialen/{id}' var='verwijderURL'>
				<spring:param name='id' value='${filiaal.id}' />
			</spring:url>
			<form:form action='${verwijderURL}' method='delete'>
				<input type='submit' value='Verwijderen'>
			</form:form>
			<spring:url value='/filialen/{id}/wijzigen' var='wijzigURL'>
				<spring:param name='id' value='${filiaal.id}' />
			</spring:url>
			<form action='${wijzigURL}'>
				<input type='submit' value='Wijzigen'>
			</form>
		</c:when>
		<c:otherwise>
			<div class='fout'>Filiaal niet gevonden</div>
		</c:otherwise>
	</c:choose>
	<c:if test='${not empty param.fout}'>
		<div class='fout'>${param.fout}</div>
	</c:if>
</body>
</html>