  var rowNum = 1;

  function addRow(frm) {
  	choiceId = rowNum;
	rowNum ++;
	var row = 
	'<div id="itemRows'+rowNum+'" class="input-group small-spacing">'
	+'<span class="input-group-addon">'+rowNum+'</span>'
	+'<input type="text" required="required" placeholder="Your answer..." '
	+'name="question[choices_attributes]['+choiceId+'][description]" '
	+'id="question_choices_attributes_'+choiceId+'_description" class="form-control form-control">'
	+'</div>';
	
	jQuery('#itemRows').append(row);
	frm.add_qty.value = '';
  	frm.add_name.value = '';
  }
