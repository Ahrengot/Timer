<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>My URL shortener</title>
	<meta name="viewport" content="width=device-width">

	<style type="text/css">
		.error { color: red; font-style: italic; }
	</style>
</head>
<body>

<div id="container">
	<header>
		@section('title')
			<h1>My funky URL shortener</h1>
		@yield_section
	</header>

	<div id="main" role="main">
		@yield('page-content')
	</div>

	<footer>
		
	</footer>
</div>

</body>
</html>
