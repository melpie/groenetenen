<%@page contentType='text/html' pageEncoding='UTF-8' session='false'%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<!doctype html>
<html lang='nl'>
<head>
<title>Filiaal toevoegen</title>
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
	<h1>Filiaal toevoegen</h1>
	<c:url value='/filialen' var='url' />
	<form:form action='${url}' commandName='filiaal' id='toevoegform'>
		<form:label path='naam'>Naam:<form:errors path='naam' />
		</form:label>
		<form:input path='naam' autofocus='autofocus' required='true' />
		<br>
		<form:label path='adres.straat'>Straat:
			<form:errors path='adres.straat' />
		</form:label>
		<form:input path='adres.straat' required='true' />
		<br>
		<form:label path='adres.huisNr'>Huisnr.:
			<form:errors path='adres.huisNr' />
		</form:label>
		<form:input path='adres.huisNr' required='true' />
		<br>
		<form:label path='adres.postcode'>Postcode:
			<form:errors path='adres.postcode' />
		</form:label>
		<form:input path='adres.postcode' required='true' type='number'
			min='1000' max='9999' />
			<br>
		<form:label path='adres.gemeente'>Gemeente:
			<form:errors path='adres.gemeente' />
		</form:label>
		<form:input path='adres.gemeente' required='true' />
		<br>
		<form:label path='inGebruikName'>Ingebruikname:
			<form:errors path='inGebruikName' />
		</form:label>
		<form:input path='inGebruikName' required='true' />
		<br>
		<form:label path='waardeGebouw'>Waarde gebouw:
			<form:errors path='waardeGebouw' />
		</form:label>
		<form:input path='waardeGebouw' required='true' />
		<br>
		<div class='rij'>
			<form:checkbox path='hoofdFiliaal' label='Hoofdfiliaal' />
		</div>
		<br>
		<input type='submit' value='Toevoegen' id='toevoegknop'>
	</form:form>
	<script>
		document.getElementById('toevoegform').onsubmit = function() {
			document.getElementById('toevoegknop').disabled = true;
		};
	</script>
</body>
</html>