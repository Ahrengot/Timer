@layout('master')

@section('javascript-templates')
	<script type="text/template" id="template-slips-list">
		<%
			function formatTime(hour, min, sec) {
				var result = '';
				if (hour > 0) result += hour + 'h '
				if (hour > 0 || min > 0) result += min + 'm '
				result += sec + 's'
				return result;
			}
		%>

		<ol class="slips">
			<% _.each(slips, function(slip) { %>
				<%
					var totalSec	= slip.get('duration'),
						hour		= Math.floor(totalSec / 3600),
						min			= Math.floor((totalSec / 60) % 60),
						sec			= totalSec % 60;
				%>
				<li><a href="#/track/<%= escape(slip.get('description')) %>">
					<span class="title"><%= slip.get('description') %></span><span class="duration"><%= formatTime(hour, min, sec) %></span>
				</a></li>
			<% }); %>
		</ol>
	</script>

	<script type="text/template" id="template-track-time">
		<p class="desc text-right"><%= description %></p>
		<time>00:00:00</time>
		<div class="columns">
		<div class="column one-half"><button class="resume toggle-timer"><%= (duration > 0) ? 'Resume' : 'Start' %></button></div>
		<div class="column one-half column-last"><button class="reset silver">Reset</button></div>
	</script>

	<script type="text/template" id="template-add-slip">
		<button>Add new slip</button>
		<p class="instructions text-center"><em>Or continue tracking time on one of these:</em></p>
	</script>
@endsection

@section('javascript')
	<script>
		window.BASE_URL = "{{ URL::base(); }}";
	</script>

	{{ HTML::script('https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js'); }}
	{{ HTML::script('http://underscorejs.org/underscore-min.js'); }}
	{{ HTML::script('http://backbonejs.org/backbone-min.js'); }}

	{{ HTML::script('js/Plugins-ck.js'); }}
	{{ HTML::script('js/Main.js'); }}
@endsection