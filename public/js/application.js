

$(document).ready(function(){
    $('.question-created-at').each(function(index, el){
        var element = $(el)
        var prettyDate = $.format.prettyDate(element.text())
        element.text(prettyDate)
    })
})


function clickShow(w) {
    var x = document.getElementById(w);
    if (x.style.display === '') {
        x.style.display = 'block';
    } else {
        x.style.display = '';
    }
}

function questionVote(w) {
    var x = document.getElementById(w);
    if (x.style.display === '') {
        x.style.display = 'block';
    } else {
        x.style.display = '';
    }
}

$(document).ready(function(){
	// this ID here refers to the form where the usesr types in a URL, you may have a different name for the ID. Edit the code accordingly.
	$('#post-question').submit(function(e){ 
    	e.preventDefault();         
    	$.ajax({
    	  	url: '/questions', //this refers to the route post '/url'
    	  	method: 'post',
    	  	data: $(this).serialize(),
    	  	dataType: 'json',
		    success: function(data){
			   	var resultStr; 
			    	resultStr = 
			    		"<table class='table'>"+
			    		"<col width='10%'><col width='40%'><col width='50%'>" +
							"<thead class='box-header'>" +
								"<th colspan='2'><a href='/questions/" + data.id + "'>" + data.question + "</a></th>" +
							"</thead>" +
							"<tbody>" +
								"<tr>" +
									"<td style='color: grey'>Responses: " + data.answer_count + "</td>" +
									"<td><span style='color: grey; text-align: left'>" +
									"<form id='question_vote' method='post' action='/questions/" + data.id + "/vote'>" +
									"<input type='image' src='/img/novoted.png' name='vote' alt='Vote!' style='height='12px' width='12px'> (0)" +
									"</form></span></td>" + 
									"<td style='color: grey; text-align: right'><a href='/users/" + data.user + "' style='color: grey'>" + data.user.full_name + " - </a>" +
									"<span class='question-created-at'>" + $.format.prettyDate(data.created_at) + "</span></td>" +
								"</tr>" +
							"</tbody>" +
						"</table><br>"
					// })
			
			    // console.log(resultStr)
    			$('.question-table').prepend(resultStr)
      			// write some code here to display the shortened URL
     		}
  	 	}); // end of function .ajax
 	}); // end of function .submit
});