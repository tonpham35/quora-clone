// $(document).ready(function(){
// 	// this ID here refers to the form where the usesr types in a URL, you may have a different name for the ID. Edit the code accordingly.
// 	$('#input-box').submit(function(e){ 
//     	e.preventDefault();         
//     	$.ajax({
//     	  	url: '/urls', //this refers to the route post '/url'
//     	  	method: 'post',
//     	  	data: $(this).serialize(),
//     	  	dataType: 'json',
// 		    success: function(data){
// 			   	var resultStr; 
// 			    $.each(data.reverse(), function(index, value) {
// 			    	resultStr += 
// 			    		"<tr>" +
// 					    	"<td><a href='" + value.long_url + "' target='_blank'>" + value.long_url + "</td>" +
// 					        "<td><a href='" + value.short_url + "' target='_blank'>" + "http://ton.ly/" + value.short_url + "</td>" +
// 					        "<td>" + value.click_count + "</td>" +
// 				        "</tr>"
// 			    })

//     			$('.tablebody').html(resultStr)
//     			pop_up()
//       			// write some code here to display the shortened URL
//      		}
//   	 	}); // end of function .ajax
//  	}); // end of function .submit
// }); // end of function document.ready