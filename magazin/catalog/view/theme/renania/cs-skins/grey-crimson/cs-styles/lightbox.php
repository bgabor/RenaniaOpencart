<?php
header("Content-type: text/css");
include ('./config.php');

echo '

#lightbox{
	position: absolute;
	left: 0;
	width: 100%;
	z-index: 100;
	text-align: center;
	line-height: 0;
	}

#lightbox a img{ border: none; }

#outerImageContainer{
	position: relative;
	background: #eee;
	width: 250px;
	height: 250px;
	margin: 0 auto;
	}

#imageContainer{
	padding: 10px;
	}

#loading{
	position: absolute;
	top: 40%;
	left: 0%;
	height: 25%;
	width: 100%;
	text-align: center;
	line-height: 0;
	}
#hoverNav{
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	z-index: 10;
	}
#imageContainer>#hoverNav{ left: 0;}
#hoverNav a{ outline: none;}

#prevLink, #nextLink{
	width: 49%;
	height: 100%;
	background: transparent url("../../../cs-js/lbjs/blank.gif") no-repeat; /* Trick IE into showing hover */
	display: block;
	}
#prevLink { left: 0; float: left;}
#nextLink { right: 0; float: right;}
#prevLink:hover, #prevLink:visited:hover { background: url("../../../cs-js/lbjs/prev.gif") left 15% no-repeat; }
#nextLink:hover, #nextLink:visited:hover { background: url("../../../cs-js/lbjs/next.gif") right 15% no-repeat; }


#imageDataContainer{
	font: 10px Verdana, Helvetica, sans-serif;
	background: #eee;
	margin: 0 auto;
	line-height: 1.4em;
	overflow: auto;
	width: 100%	
	}

#imageData{	padding:0 10px; color: #363636; }
#imageData #imageDetails{ width: 70%; float: left; text-align: left; }	
#imageData #caption{ font-weight: bold;	}
#imageData #numberDisplay{ display: block; clear: left; padding-bottom: 1.0em;	}			
#imageData #bottomNavClose{ width: 66px; float: right;  padding-bottom: 0.7em;	}	
		
#overlay{
	position: absolute;
	top: 0;
	left: 0;
	z-index: 90;
	width: 100%;
	height: 500px;
	background: #000;
	}

';
?>