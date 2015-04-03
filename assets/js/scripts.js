$(document).ready(function() {
    $('.date-tear-sheet').hover(function() {
         $(this).find('.date-tear-sheet-title').fadeToggle(600);
    });

    $('.audio-container' ).hover(function() {
         $(this).find('.audio-play').fadeToggle(600);
    });
});

