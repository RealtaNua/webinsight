document.write('<link rel="stylesheet" type="text/css" href="/widget_resources/versable-widget-silver.css">');

document.write('<div style="position:fixed;bottom:-1%;left:2%;">');
document.write('<div id= "versable-widget-header">Welcome<a href="#"><span id="versable-widget-toggle" class="glyphicon glyphicon-chevron-down versable-down pull-right"></span></a></div>');
document.write('');
document.write('<div id="versable-widget-content">');
	versableShowContents();
document.write('</div>');
document.write('</div>');

function versableShowContents() {
ifrm = document.createElement("IFRAME");
ifrm.setAttribute("src", "/widgets/show");
ifrm.setAttribute("id", "versable-widget-iframe");
ifrm.setAttribute("onload", "iframeLoaded()");
ifrm.setAttribute("scrolling", "no");
ifrm.setAttribute("style","");
ifrm.style.width = 350+"px";
document.getElementById("versable-widget-content").appendChild(ifrm);


}

$( "#versable-widget-toggle" ).click(function() {
   $( "#versable-widget-content" ).slideToggle( 400, function() {
   // Animation complete.
   $("#versable-widget-toggle").toggleClass("glyphicon-chevron-down");
   $("#versable-widget-toggle").toggleClass("glyphicon-chevron-up");   
   });
});

  function iframeLoaded() 
  {
      var iFrameID = document.getElementById('versable-widget-iframe');
      if(iFrameID) 
      {
            // here you can make the height, I delete it first, then I make it again
            iFrameID.height = "";
            iFrameID.height = iFrameID.contentWindow.document.body.scrollHeight + "px";
            //alert(iFrameID.contentWindow.document.body.Height);
        	//iFrameID.height = "800px";
      }
         
  }