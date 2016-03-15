# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$("#searched_name").change ->
		name = $(this).val()
		$.ajax
			url: "/participants/search"
			type: "GET"
			data: {s_name: name}
			dataType: "script"
			success: (data) ->
				console.log("success")
			error: (XMLHttpRequest, textStatus, errorThrown) ->
				console.log("error occured")
