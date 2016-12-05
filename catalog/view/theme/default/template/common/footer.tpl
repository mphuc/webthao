
        <footer class="main-footer">
            <div class="footer-copyright">
                © 2016 <a href="home.html">sfccoin.com</a>
            </div>
            <div class="footer-right-text">
                Smart financial connections
            </div>
        </footer>
       
   </body>

   <script type="text/javascript">
   
   	$('.packet-invest').on('submit', function(){
   		var self = $(this);
   		alertify.confirm('<p class="text-center" style="font-size:25px;color: black;text-transform: uppercase;height: 40px">You make sure your choice !</p>',
		  function(){
		    window.funLazyLoad.start();
	   		setTimeout(function(){
				self.ajaxSubmit({
					success : function(result) {
						result = $.parseJSON(result);
						console.log(result);
						
						var package = result.package / 100000000
						
						var xhtml = '<div class="col-md-12">Please send '+package+' BTC to this address.</div><div class="col-md-6"><img style="margin-left:-10px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+package+'"/><p>'+result.input_address+'</p></div><div class="col-md-6"><p>Your Packet: '+package+' BTC</p>Total: '+ package +' BTC</p></div>'
						alertify.alert(xhtml, function(){
						    window.funLazyLoad.reset();
						    setTimeout(function(){
							    location.reload(true);
							}, 2000);
						    
						  });
						
					}
				});
				check_payment();
			}, 200);
		  },
		  function(){
		});
   		return false;
   	});

   	$('.packet-invoide').on('submit', function(){
   		
   		var self = $(this);
	    window.funLazyLoad.start();
   		setTimeout(function(){
			self.ajaxSubmit({
				success : function(result) {
					result = $.parseJSON(result);
					console.log(result);
					if(_.has(result, 'success') && result['success'] === 1){
						var xhtml = '<div class="col-md-12 text-center"><h3>You have to activate this package! please select another package!</h3></div>'
					}else{
						var amount = result.amount / 100000000;
						
						var package = result.package / 100000000
						var total = package;
						var received = result.received / 100000000;
						var xhtml = '<div class="col-md-12">Please send '+amount+' BTC to this address.</div><div class="col-md-6"><img style="margin-left:-10px" src="https://chart.googleapis.com/chart?chs=225x225&chld=L|0&cht=qr&chl=bitcoin:'+result.input_address+'?amount='+amount+'"/><p>'+result.input_address+'</p></div><div class="col-md-6"><p>Your Packet: '+package+' BTC</p><p>Total: '+ total +' BTC</p><p></p>Paid amount: '+received+' BTC</div>'
					}
					
						alertify.alert(xhtml, function(){
							window.funLazyLoad.reset();
					    	//location.reload(true);
					  });
				}
			});
			//check_payment();
		}, 200);
   		return false;
   	});
	 function check_payment(){
	 	$.ajax({
	        url : "<?php echo $check_payment ?>",
	        type : "post",
	        dataType:"text",
	        data : {
	           
	        },
	        success : function (result){
	        	result = $.parseJSON(result);
	            if (result.confirmations == "3"){
	            	$('.ajs-btn.ajs-ok').trigger('click');
	            	var xhtml = '<div style="font-size:25px;color: black;text-transform: uppercase;height: 20px" class="col-md-12 text-center"><h3>You have successfully activate!</h3></div>';
	            	alertify.alert(xhtml, function(){
					    location.reload(true);
					  });
	            }
	            if (result.confirmations == "0")
	            {
	            	setTimeout(function(){ check_payment(); }, 1500);
	            }

	        }
	    });
	 }
   </script>
  
     <script src="catalog/view/theme/default/assets/plugin/bootstrap-tour/js/bootstrap-tour.js"></script>
     
     <script src="catalog/view/theme/default/assets/js/full-screen-page/screenfull.min.js"></script>
    <!-- <script src="catalog/view/theme/default/assets/js/home-page/jquery-slidePanel.min.js"></script>
    <script src="catalog/view/theme/default/assets/js/home-page/sidebar.min.js"></script>
    Page Plugin JavaScript
    <script src="catalog/view/theme/default/assets/js/peity-charts/jquery.peity2.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/assets/js/echarts/echarts-all.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/assets/js/c3-chart/d3.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/assets/js/c3-chart/c3.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/assets/js/float-chart/flot.jquery.js"></script>
    <script src="catalog/view/theme/default/assets/js/float-chart/jquery.flot.resize.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/assets/js/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/assets/js/weather/skycons.js"></script>
    <script src="catalog/view/theme/default/assets/plugin/magnific-popup/js/jquery.magnific-popup.min.js"></script>
    Global Template JavaScript
    <script src="catalog/view/theme/default/assets/js/global/site.min.js"></script> -->
     <script src="catalog/view/theme/default/assets/js/sitesettings/site-settings.js"></script>
     <script src="catalog/view/theme/default/assets/js/custom/custom-side-menu.js"></script>
     <!-- Page JavaScript -->
     <script src="catalog/view/theme/default/assets/js/media/media.min.js"></script> 
     <script src="catalog/view/theme/default/assets/js/calendar/calendar-custom.js" type="text/javascript"></script>
     <script src="catalog/view/theme/default/assets/js/dashboard/dashboard_v3.js" type="text/javascript"></script>
     <script src="catalog/view/theme/default/assets/js/chart-widgets/custom-chart-widgets.js" type="text/javascript"></script>
     <script src="catalog/view/theme/default/assets/js/global/site_menu_left.js"></script>
</html>