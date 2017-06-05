$(function() {
 $('span.starspan')
  .mouseenter(function() {
   $(this).find('img.star').attr('src', '/img/starfull.jpg');
  })
  .mouseleave(function() {
   $('img.star').attr('src', '/img/starempty.jpg');
  });

 var ddmenuitem;
 $('div.dropdown')
  .mouseenter(function() {
   ddmenuitem = $(this).find('ul').css('visibility', 'visible').fadeIn();
  })
  .mouseleave(function() {
   if (ddmenuitem) {
    ddmenuitem.css('visibility', 'hidden');
   }
  });
});