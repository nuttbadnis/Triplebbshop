	document.getElementById('imgsrc').src = document.getElementById('imgsrc').src + '?' + (new Date()).getTime();

	var not_linkin = 0;

	function linkinError(img) {
		not_linkin = 1;
		$('.inonly').hide();
		console.log("link in: Error " + img);
	}

	$(document).ready(function() { 
		appendLinkin();
	});

	function appendLinkin() {
		setTimeout(function() {
			if(not_linkin == 0){
				console.log("link in: internal");

				$("a.link-in").each(function() {
					var linkin_href = $(this).attr("href"); 

					if(linkin_href.indexOf('linkin')<=0) {  
						if(linkin_href.indexOf('?')>0) {  
							$(this).attr("href", linkin_href + '&linkin=1');
						}
						else {
							$(this).attr("href", linkin_href + '?linkin=1');
						}
					}
				});
			}
			// else {
			// 	console.log("link in: not internal");
			// }
		}, 2000);
	}