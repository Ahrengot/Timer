<!doctype html>
<html lang="en_US">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
    <?php
    	$title = "";
    	$description = "";

    	$url = URL::current();
    ?>

    <!-- Meta tags used by mobile devices -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="viewport" content="width=device-width, user-scalable=no">

	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{ asset('/css/img/icons/114x114.png'); }}">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{ asset('/css/img/icons/72x72.png'); }}">
	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="{{ asset('/css/img/icons/57x57.png'); }}">
	<link rel="apple-touch-startup-image" href="{{ asset('/css/img/icons/splash-screen.png'); }}" />
	<link rel="shortcut icon" href="{{ asset('/css/img/icons/favicon.ico'); }}">

	<!-- Open graph meta tags -->
	<meta property="fb:admins" content="100000936142315">
	<meta property="og:locale" content="en_US">
	<meta property="og:type" content="article">
	<meta property="og:url" content="{{ $url }}">
	<meta property="og:site_name" content="{{ $title }}">
	<meta property="og:title" content="{{ $title }}">
	<meta property="og:description" content="{{ $description }}">
	<meta property="og:image" content="{{ asset('/css/img/icons/300x300.png'); }}">

	<title>Timer</title>
	<meta name="description" content="{{ $description }}"/>

	{{ HTML::style('css/combined.css'); }}
</head>
<body>

<div id="container">

</div>

<div id="javascript-templates">
	@yield('javascript-templates')
</div>

@yield('javascript')
</body>
</html>


