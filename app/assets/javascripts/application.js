// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require user_courses
//= require_tree .
//  $(document).ready(function(){
            
            
//     //timer actions
//     $("#btn-custom").click(function(){
//         switch($(this).html().toLowerCase())
//         {
//             case "start":
//                 s = parseInt($("input[name='s']").val());
//                 if(isNaN(s))
//                 {
//                     s = 0;
//                     $("input[name='s']").val(0);
//                 }
//                 $("#trial").timer("start", {seconds:s});
//                 $(this).html("Pause");
//                 $("input[name='s']").attr("disabled", "disabled");
//                 break;
            
//             case "resume":
//                 $("#trial").timer("resume");
//                 $(this).html("Pause")
//                 break;
            
//             case "pause":
//                 $("#trial").timer("pause");
//                 $(this).html("Resume")
//                 break;
//         }
//     });

// });