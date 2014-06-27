<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>eXo Code Fest 2014-team-I</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="An" >
		
		<!-- Le styles -->


<style>
/*!
* Code Fest 2014 
*/

#UIPortalApplication .UIWorkingWorkspace {
    z-index: auto !important;
}

.div1 {
display: inline-block;padding:10px;border:1px solid #aaaaaa;
color:#aeaeae
}

.task_text {width:70px;height:200px}

.row_distance{
margin: 20px;
}

.top_position{
}

.card_center{
min-height: 100px;
background: none repeat scroll 0 0 #dee7ff;
margin-bottom: 20px;
text-align: center;
background-color:#27ae60;
}

.card_center_title{
font-weight:bold;
font-size: 16px;
background-color:#2ecc71;
color: white;
padding: 15px;
word-wrap: break-word;
display: block;
}

.card_center_description{
font-size: 12px;
background-color:#27ae60;
color: white;
word-wrap: break-word;
display: block;
padding: 15px;
}

.left_inprogress .card_center_title{
font-weight:bold;
font-size: 16px;
background-color:#2ecc71;
color: white;
padding: 0px;
word-wrap: break-word;
display: block;

}

.left_inprogress .card_center_description{
font-size: 12px;
background-color:#27ae60;
color: white;
word-wrap: break-word;
display: block;
padding: 0px;
}


.center_position{
min-height: 600px;
border:1px solid #aaaaaa;
background: none repeat scroll 0 0 white;
color:#aeaeae;
}

.add_task{
background-image: url(../img/add_task.png);
background-repeat: no-repeat;
}

.left_position{
border:1px solid #aaaaaa;
min-height: 200px;
font-size: 25px;
color:#aeaeae;
}

.left_inprogress{
background: none repeat scroll 0 0 #345e96;
padding: 10px;
font-size: 25px;
color:#aeaeae;
}

.left_done{
background: none repeat scroll 0 0 #505050;
padding: 10px;
font-size: 25px;
color:#aeaeae;
}

.left_cancel{
background: none repeat scroll 0 0  #d0dde3;
padding: 10px;
font-size: 25px;
color:#aeaeae;
}

img.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto }
</style>

<!--
		<link href="http://exoplatform.github.io/ux-guidelines/css/bootstrap.css" rel="stylesheet">
    <link href="http://exoplatform.github.io/ux-guidelines/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="http://exoplatform.github.io/ux-guidelines/css/prettify.css" rel="stylesheet">
-->
		<link href="http://exoplatform.github.io/ux-guidelines/css/docs.css" rel="stylesheet">
		<link href="http://exoplatform.github.io/ux-guidelines/css/uxp-pattern.css" rel="stylesheet">
		<link href="http://exoplatform.github.io/ux-guidelines/css/exo-platform.css" rel="stylesheet">
<!--
		<link href="css/codefest.css" rel="stylesheet">		
-->


		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<!-- Le fav and touch icons -->
		
	</head>
	
	<body>



  <div class="container">
		<div class="row-fluid homeOverview">

      <div class="span9" ondrop="drop(event)" ondragover="allowDrop(event)">
        <div class="row-fluid row_distance top_position">
          <div style="">
            <div class="div1 span12">

              <div class="div1 span10">Task 1</div>
              <div class="div1 span2">Hanoi</div>


            </div>
          </div>
        </div>

        <div class="row-fluid row_distance center_position">
          <div style="">
            <div class="div1 span12">TODO
              <div class="row-fluid">
              <div data-toggle="modal" href="#myModal" id="drag_add" class="task_text card_center span3">
                <span class="card_center_title">Add task</span>
                <div class="card_center_description">
                  
                </div>
              </div>

              <div data-toggle="modal" href="#myModal3" id="drag1" class="task_text card_center span3" draggable="true" ondragstart="drag(event)">
                <div class="card_center_title">At home</div>
                <div class="card_center_description">buy foods, vegetable, Mike birthday (6 days left before 11 Nov)</div>
              </div>

              <div data-toggle="modal" href="#myModal3" id="drag2" class="task_text card_center span3" draggable="true" ondragstart="drag(event)">
                <div class="card_center_title">At Office</div>
                <div class="card_center_description">time to begin quiz 1, thanksgiving day, </div>

              </div>
              <div data-toggle="modal" href="#myModal3" id="drag3" class="task_text card_center span3" draggable="true" ondragstart="drag(event)">
                                <div class="card_center_title">Lorem</div>
                <div class="card_center_description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
              </div>
              

            </div>


              <div class="row-fluid">
              <div data-toggle="modal" href="#myModal3" id="drag4" class="task_text card_center span3" draggable="true" ondragstart="drag(event)">
                <div class="card_center_title">Task 4</div>
                <div class="card_center_description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>

</div>
              <div data-toggle="modal" href="#myModal3" id="drag5" class="task_text card_center span3" draggable="true" ondragstart="drag(event)">

                <div class="card_center_title">Task 5</div>
                <div class="card_center_description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
</div>
              <div data-toggle="modal" href="#myModal3" id="drag6" class="task_text card_center span3" draggable="true" ondragstart="drag(event)">

                <div class="card_center_title">Task 6</div>
                <div class="card_center_description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
</div>
              <div data-toggle="modal" href="#myModal3" id="drag7" class="task_text card_center span3" draggable="true" ondragstart="drag(event)">

                <div class="card_center_title">Task 7</div>
                <div class="card_center_description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
</div>
              </div>
            </div>
          </div>
        </div>
      </div>


      <div class="span3">
          <div class="row-fluid row_distance left_position left_inprogress"  ondrop="drop(event)" ondragover="allowDrop(event)">
            <div class="span12">  
                <div class="row-fluid">
                  <p>In progress</p>
                </div>
                <div class="row-fluid row_distance top_position">
                </div>
            </div>
          </div>

          <div class="row-fluid row_distance left_position left_done"  ondrop="drop(event)" ondragover="allowDrop(event)">
            <div class="span12">  
                <div class="row-fluid">
                  <p>Done</p>
                </div>
                <div class="row-fluid row_distance top_position">
                </div>
            </div>
          </div>

          <div class="row-fluid row_distance left_position left_cancel  ondrop="drop(event)" ondragover="allowDrop(event)">
            <div class="span12">  
                <div class="row-fluid">
                  <p>Cancel</p>
                </div>
                <div class="row-fluid row_distance top_position">
                </div>
            </div>
          </div>




      </div>


    </div>
  </div>
<br>

</div>








<!-- MODAL NORMAL -->
<div style="display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="myModal3" class="UIPopupWindow uiPopup UIDragObject NormalStyle modal hide fade">
		<div class="popupHeader ClearFix">
			<a data-dismiss="modal" aria-hidden="true" class="uiIconClose pull-right"></a>
			<span class="PopupTitle popupTitle">Task detail</span>
		</div>
		<div class="PopupContent popupContent uiGroupMembershipSelector">
			<div class="row-fluid">
      <div>
        
        <p style="display: inline-block">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
      </div>
			</div>
		</div>
		<span class="uiIconResize pull-right uiIconLightGray"></span>
      </div>

<!-- MODAL WITH BUTTON -->
<div style="display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal hide fade UIPopupWindow uiPopup UIDragObject NormalStyle" id="myModal">
		<div class="popupHeader ClearFix">
			<a data-dismiss="modal" aria-hidden="true" class="uiIconClose pull-right"></a>
			<span class="PopupTitle popupTitle">Add task</span>
		</div>
		<div class="PopupContent popupContent">

			<div class="form-horizontal resizable">	
			
        <div>
          
        </div>
        <div class="bs-docs-example">
              <div style="margin: 0;">
                <p>At resource center eXo Platform you will learn how to make a website. We offer free tutorials in all web development technologies.</p> 
              </div>
			  </div>
			<div class="uiAction uiActionBorder"> 
				<button data-dismiss="modal" type="button" onclick="" class="btn">Save</button>
				<button data-dismiss="modal" type="button" onclick="" class="btn">Cancel</button>
			</div>
		</div>



		  <span class="uiIconResize pull-right uiIconLightGray"></span>
     </div>

  </div>
			<div id="footer">
				Copyright ©2014. All rights reserved. <a href="http://www.exoplatform.com">eXo Platform SAS</a>
			</div>
		</div> 
		<!-- /container -->
		
		<!-- Le javascript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->

		<script src="http://exoplatform.github.io/ux-guidelines/js/jquery.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-transition.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-alert.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-modal.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-dropdown.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-scrollspy.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-tab.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-tooltip.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-popover.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-button.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-collapse.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-carousel.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/bootstrap-typeahead.js"></script>
		<script src="http://exoplatform.github.io/ux-guidelines/js/application.js"></script>
<!--
		<script src="js/codefest.js"></script>
-->



	</body>
</html>
