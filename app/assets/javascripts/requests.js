var concatDateTime = function(date, time){

	return date + ' ' + time;

}


$(document).ready(function(){

	$('#request_time_max_date').add('#request_time_min_date').datepicker({ defaultDate: 0, dateFormat: "yy-mm-dd", 
        onSelect:function(){
        	var $selected = $(this),
        		$altField = $('#'+$selected.attr('id').replace('date','')),
        		$altFieldTime = $('#'+$selected.attr('id').replace('date','hhmm')),
        		dateTime = concatDateTime($selected.val(), $altFieldTime.val());

        	$altField.val(dateTime);
    	}
	});

	$('body').delegate('.icon-calendar','click', function(){
		$(this).parent('.add-on').siblings('input').trigger('focus');
	}).delegate('#request_time_max_hhmm, #request_time_min_hhmm','blur keydown',function(evnt){

		var $blurred = $(this),
			$altField = $('#'+$blurred.attr('id').replace('_hhmm','')),
			$dateField = $('#'+$blurred.attr('id').replace('hhmm','date')),
			dateTime = '',
			trigger = (evnt.type=='focusout' || evnt.keyCode=='13');

		if(trigger && $blurred.val().length && $dateField.val().length){

			dateTime = concatDateTime($dateField.val(), $blurred.val());

			$altField.val(dateTime);
		}
	}).delegate('#new_request', 'submit', function(evnt){

		var $empties = $(this).find('input').filter('[value=""]');


		if($empties.length){
			evnt.preventDefault();

			$.scrollTo($empties[0], {offset : {top: -80, left: 0}, duration: 500});
			_($empties).each(function(ele, i){
				var $input = $(ele);
				$input.trigger('blur');
			});
		}

	}).delegate('input', 'blur keydown', function(evnt){

		var $input = $(this),
			value = $input.val(),
			placeholder = $input.attr('placeholder'),
			$controlgroup = $input.parents('.control-group');


		if(evnt.type=='focusout'){
			if(!value.length){
				$controlgroup.addClass('error');
				if(typeof placeholder == 'undefined' || !placeholder.length){
					$input.attr('placeholder','Input required');
				}
			}
		}else if(value.length){
			$controlgroup.removeClass('error');
		}

	});



});