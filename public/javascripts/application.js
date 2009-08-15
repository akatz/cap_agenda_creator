// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  // $(".datepicker").datepicker({ showOn: 'button', buttonText: "select" });
  
  
  
  $(function()
  {

  	// initialise the "Select date" link
  	$('#date-pick')
  		.datePicker(
  			// associate the link with a date picker
  			{
  				createButton:false,
  				startDate:'01/01/2005',
  				endDate:'31/12/2010'
  			}
  		).bind(
  			// when the link is clicked display the date picker
  			'click',
  			function()
  			{
  				updateSelects($(this).dpGetSelected()[0]);
  				$(this).dpDisplay();
  				return false;
  			}
  		).bind(
  			// when a date is selected update the SELECTs
  			'dateSelected',
  			function(e, selectedDate, $td, state)
  			{
  				updateSelects(selectedDate);
  			}
  		).bind(
  			'dpClosed',
  			function(e, selected)
  			{
  				updateSelects(selected[0]);
  			}
  		);

  	var updateSelects = function (selectedDate)
  	{
  		var selectedDate = new Date(selectedDate);
  		$('#agenda_date_3i option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
  		$('#agenda_date_2i option[value=' + (selectedDate.getMonth()+1) + ']').attr('selected', 'selected');
  		$('#agenda_date_1i option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');
  	}
  	// listen for when the selects are changed and update the picker
  	$('#agenda_date_3i, #agenda_date_2i, #agenda_date_1i')
  		.bind(
  			'change',
  			function()
  			{
  				var d = new Date(
  							$('#agenda_date_1i').val(),
  							$('#agenda_date_2i').val()-1,
  							$('#agenda_date_3i').val()
  						);
  				$('#date-pick').dpSetSelected(d.asString());
  			}
  		);

  	// default the position of the selects to today
  	var today = new Date();
  	updateSelects(today.getTime());

  	// and update the datePicker to reflect it...
  	$('#agenda_date_3i').trigger('change');
  });
  
});
