<?php
include "conf.php";
$access = false;
for($i = 0 ; $i<count($user) ; $i++){
	if(($_POST['username']=== $user[$i][0])&&($_POST['pw']===$user[$i][1])){
		$access = true;
	}
}
if(!$access){
	die("<h1 style='color:rgb(248, 51, 51); width: fit-content; margin: auto;' >Sorry! Wrong Username or Password</h1>");
}
?>
<html>

<title>EJS Database & Web</title>

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
	td {

   font-size: 12px;

}
.container{
	width: 100%;
	text-align: center;
}


</style>
</head>
<body>
<div class="container">
	<br><br>
<div class="row">
	<div class="col-lg-3">
		Record Number Search <br> <br>
		<input type="number" id="recnum" size="10"></input> <br> <br>
		<button onclick="recnum_search()">Search</button>
	</div>
	<br>
	<div class="col-lg-3">
		Version Tag Search <br> <br>
		<input type="text" id="vertag" size="10"></input> <br> <br>
		<button onclick="vertag_search()">Search</button>
	</div>
	<br>
	<div class="col-lg-3">
		Host Name Search <br> <br>
		<input type="text" id="hostname" size="10"></input> <br> <br>
		<button onclick="hostname_search()">Search</button>
	</div>
		<!-- <div class="col-lg-3">
		<h4 id="demo"></h4>
		<h1 id="myline">_____________</h1> 
	</div> -->
</div>

<br>
<br>

<div class="row" id="search_tickets">

</div>
<br>
<br>
<div class="jumbotron">
<div class="row" id="search_deploys">
</div></div>
</div>

	
<script>
var dict = new Map();
dict.set("desmond", "purple");
dict.set("sandbox", "orange");
dict.set("develop", "yellow");
dict.set("blue", "blue");
dict.set("green", "green");
var data = dict.get(window.location.host.split(".")[0])
document.getElementById("myline").style.color = data;
// document.getElementById("demo").innerHTML = window.location.host;

function recnum_search() {
	var params = "key=" + document.getElementById('recnum').value;
	get('/recnum_search', params, function(text) {
		console.log(text);
		var json_obj = JSON.parse(text);
		var dat = json_obj['dat'];
		var dat1 = json_obj['dat1'];
		update(dat, dat1);
		
	});
}

function update(dat, dat1) {
	var h;
		if (dat.length == 0) h = "<div class='col-lg-4 col-lg-offset-3'>No Results Found in Deploys</div>";
		else {
			h = 
				// "<div class='col-lg-4 col-lg-offset-3'>" + 
				"<table class='table table-striped'><thead>" +
					"<tr>" +
						"<th scope='col'>Record Number</th>" +
						"<th scope='col'>Version Tag</th>" +
						"<th scope='col'>Host Name</th>" +
						"<th scope='col'>Date</th>" +
						"<th scope='col'>Time</th>" +
						"<th scope='col'>OS User</th>" +
						"<th scope='col'>repo</th>" +
						"<th scope='col'>Dir</th>" +
					"</tr></thead><tbody>";
			for (var i=0;i<dat.length;++i) {
				h += "<tr>" +
						"<td>" + dat[i]["recordnum"] + "</td>" +
						"<td>" + dat[i]["vertag"] + "</td>" +
						"<td>" + dat[i]["hostname"] + "</td>" +
						"<td>" + dat[i]["date"] + "</td>" +
						"<td>" + dat[i]["time"] + "</td>" +
						"<td>" + dat[i]["osuser"] + "</td>" +
						"<td>" + dat[i]["repo"] + "</td>" +
						"<td>" + dat[i]["dir"] + "</td>" +
					"</tr>";
			}
			h += "</tbody></table>";
		}
		document.getElementById('search_deploys').innerHTML = h;
		if (dat1.length == 0) h = "<div class='col-lg-5 col-lg-offset-3'>No Results Found in Tickets</div>";
		else {
			h = 
				"<div class='col-lg-8' style='height:100px;overflow:auto;'>" + 
				"<table class='table table-striped'>" +
					"<tr>" +
						"<th scope='col'>Record Number</th>" +
						"<th scope='col'>Version Tag</th>" +
						"<th scope='col'>Hostname</th>" +
						"<th scope='col'>Date</th>" +
						"<th scope='col'>Time</th>" +
					"</tr>";
			for (var i=0;i<dat1.length;++i) {
				h += "<tr>" +
						"<td>" + dat1[i]["recordnum"] + "</td>" +
						"<td>" + dat1[i]["vertag"] + "</td>" +
						"<td>" + dat1[i]["hostname"] + "</td>" +
						"<td>" + dat1[i]["date"] + "</td>" +
						"<td>" + dat1[i]["time"] + "</td>" +
					"</tr>";
			}
			h += "</table></div>";
		}			
		document.getElementById('search_tickets').innerHTML = h;
		
}

function vertag_search() {
	var params = "key=" + document.getElementById('vertag').value;
	get('/vertag_search', params, function(text) {
		console.log(text);
		var json_obj = JSON.parse(text);
		var dat = json_obj['dat'];
		var dat1 = json_obj['dat1'];
		update(dat, dat1);
		
	});
}

function hostname_search() {
	var params = "key=" + document.getElementById('hostname').value;
	get('/hostname_search', params, function(text) {
		console.log(text);
		var json_obj = JSON.parse(text);
		var dat = json_obj['dat'];
		var dat1 = json_obj['dat1'];
		update(dat, dat1);
		
	});
}


function get(url, params, doneCallBack) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = handleStateChange;
	url += "?" + params;
	console.log(url);
	xhr.open("GET", url, true);
	xhr.send();

	function handleStateChange() {
		if (xhr.readyState === 4) {
			doneCallBack(xhr.status == 200 ? xhr.responseText : null);
		}
	}
}

</script>

</body>

</html>
