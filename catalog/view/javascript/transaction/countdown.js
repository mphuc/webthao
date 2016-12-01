 $(function() {
    $('[data-countdown]').each(function() {
         var $this = $(this), finalDate = $(this).data('countdown');
            $this.countdown(finalDate, function(event) {
            $this.html(event.strftime('<i class="fa fa-refresh fa-spin"></i> <span style="color:#797979;"> </span> %H:%M:%S'));
            
        });
    });
 });
 //  $(function() {
 //    $('[data-countdown]').each(function() {
 //         var $this = $(this), finalDate = $(this).data('countdown');
 //            $this.countdown(finalDate, function(event) {
 //            //$('.time-out').html(event.strftime('%D days %H:%M:%S'));
 //              $this.html(event.strftime('<span class="time">%D Days</span>-<span class="time">%H</span>:<span class="time">%M</span>:<span class="time">%S</span>'));
            
 //        });
 //    });
 // });