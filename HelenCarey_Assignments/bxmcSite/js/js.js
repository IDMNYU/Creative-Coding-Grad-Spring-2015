  $(function() {
    $( "#button" ).click(function() {
      $( "#effect" ).toggleClass( "newClass", 1000 );
    });
  });


function (toggleCode) {

}

 $(function() {
    $( "#button" ).click(function() {
      $( "#effect" ).toggleClass( "newClass", 1000 );
    });
  });

 $(document).ready(function(){
  $(".flip").click(function(){
    $(this).next().find(".panel").slideToggle("slow");
  });
});