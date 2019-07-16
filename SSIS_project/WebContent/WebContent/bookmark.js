

function setCookie(seq, title, exp){
	var d = new Date();
	d.setTime(d.getTime() + (exp*24*60*60*1000*365));
	var expires = "expires="+d.toUTCString();
	var encodedtitle = encodeURI(encodeURIComponent(title));
	var encoded =  seq+"="+encodedtitle+";"+expires+";path=/";
	document.cookie = encoded;
}

function recentCookie(name, seq, exp){
	var d = new Date();
	d.setTime(d.getTime()+ (exp*24*60*60*1000*365));
	var expires = "expires="+d.toUTCString();
	var recentlist = "";
	console.log(getCookie(name));
	if(getCookie(name)){
		recentlist = getCookie(name) + "&" + seq;
	} else {
		recentlist = seq;
	}
	document.cookie = name + "=" + recentlist +";" + expires + "; path=/";
}

function getCookie(name){
	var cname = name + "=";
	var decodedCookie = encodeURI(document.cookie, "UTF-8");
	console.log(decodedCookie);
	var ca = decodedCookie.split(';')
	for (var i = 0; i < ca.length; i++){
		var c = ca[i];
		while (c.charAt(0)==' '){
			c = c.substring(1);
		}
		if (c.indexOf(name)==0){}
		return c.substring(name.length, c.length);
	}
	return "";
	
}

