$(document).ready(function () {
  $('a[href^="https://www.youtube.com/watch"]').on('click', function (e) {
    var queryVars = (function (url) {
      var p = document.createElement('a');
      p.href = url;
      if (p.search == "") return {};
      var r = {};
      (p.search.substring(1).split("&")).forEach(function (param) {
        var kv = param.split('=');
        r[kv[0]] = kv[1];
      });
      return r;
    })($(this).attr('href'));

    if ('v' in queryVars) {
      e.preventDefault();

      var startTime = $(this).attr('data-start-time') ? parseInt($(this).attr('data-start-time')) : 0;
      var endTime = $(this).attr('data-end-time') ? parseInt($(this).attr('data-end-time')) : 0;
      var videoUrl = 'http://www.youtube.com/embed/' + queryVars['v'] + '?autoplay=1&';
      if ($(this).attr('data-start-time')) {
        videoUrl += '&start=' + $(this).attr('data-start-time');
        if ($(this).attr('data-end-time')) {
          /* This actually ends the video; we want to pause it so
             people can resume it if they want some more context… */
          // videoUrl += '&end=' + $(this).attr('data-end-time');
        }
      }

      $('#mediaModal .modal-body').html('<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button><div class="embed-responsive embed-responsive-16by9"><iframe src="' + videoUrl + '" allowscriptaccess="always"></iframe></div>');
      $('#mediaModal').modal();
    }
  });

  $('#mediaModal').on('hidden.bs.modal', function () {
    $('#mediaModal .modal-body').html('');
  });

});