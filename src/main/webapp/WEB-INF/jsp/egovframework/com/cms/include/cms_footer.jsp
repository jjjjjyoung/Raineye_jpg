<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

</div>
<!-- Layout content -->

</div>
<!-- / Layout container -->

</div>

<!-- Overlay -->
<!-- <div class="layout-overlay layout-sidenav-toggle"></div> -->
</div>
<!-- / Layout wrapper -->
<div class="am-scroll-top">
	<i class="far fa-arrow-alt-circle-up"></i>
</div>

<!-- Layout footer -->
<nav class="layout-footer footer bg-footer-theme">
	<div
		class="container-fluid d-flex flex-wrap justify-content-between text-center container-p-x pb-3">
		<div class="pt-3">
			<span class="footer-text font-weight-bolder">CMS CO</span>
		</div>
		<div>
			<a href="javascript:void(0)" class="footer-link pt-3">About Us</a> 
			<a href="javascript:void(0)" class="footer-link pt-3 ml-4">Help</a>
			<a href="javascript:void(0)" class="footer-link pt-3 ml-4">Contact</a>
			<a href="javascript:void(0)" class="footer-link pt-3 ml-4">Terms&amp; Conditions</a>
		</div>
	</div>
</nav>
<!-- / Layout footer -->

</body>
</html>

<script type="text/javascript">
	$(function(){
		App.init();
		
		$('.am-left-sidebar .sidebar-elements li.parent').click(function(){	
			$('.am-left-sidebar .sidebar-elements li.parent').removeClass("active");			
			$(this).addClass("active");
		});		
		
		$('li.parent li.nav-items li').click(function(){
			$('li.parent').removeClass("active");	
			$(this).parent('li.parent').addClass("active");	
		});
	});
	
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-68396117-1', 'auto');
	ga('send', 'pageview');
</script>