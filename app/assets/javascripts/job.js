
$(document).ready(function() {

	$('#sortable1, #sortable2').sortable(
        {
        	'connectWith':'.connectedSortable',
         	'dropOnEmpty':true,
         	'scroll':true,
         	items: "tr:not(.emptyMessage)",
         	receive: function(event, ui) {
                 //hide empty message on receiver
                 $('tr.emptyMessage', this).hide();
                 
                 //show empty message on sender if applicable
                 if($('tr:not(.emptyMessage)', ui.sender).length == 0){
                     $('tr.emptyMessage', ui.sender).show();
                 } else {
                     $('tr.emptyMessage', ui.sender).hide();
                 }            
             }
         
    });
});
