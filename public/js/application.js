
$(document).ready(function(){
	$('.question-created-at').each(function(index, el){
		var element = $(el)
		var prettyDate = $.format.prettyDate(element.text())
		element.text(prettyDate)
	})
})