
$('#mediaModal').on('hidden.bs.modal', function () {
  $('#mediaModal .modal-video-content').html('');
});

/* YouTube videos */
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

      var videoUrl = 'http://www.youtube.com/embed/' + queryVars['v'] + '?autoplay=1&';
      if ($(this).attr('data-start-time')) {
        videoUrl += '&start=' + $(this).attr('data-start-time');
        if ($(this).attr('data-end-time')) {
          /* This actually ends the video; we want to pause it so
             people can resume it if they want some more context… */
          // videoUrl += '&end=' + $(this).attr('data-end-time');
        }
      }

      $('#mediaModal .modal-video-content').html('<iframe src="' + videoUrl + '" allowscriptaccess="always"></iframe>');
      $('#mediaModal').modal();
    }
  });
});

/* HTML5 videos */
$(document).ready(function() {
  $('.video-link').on('click', function(e) {
    var videoPlayer = document.createElement('video');
    videoPlayer.controls = true;
    videoPlayer.autoplay = true;

    var videoUrl = $(this).attr("href");
    var startTime = parseFloat($(this).attr('data-start-time'));
    var duration = parseFloat($(this).attr('data-duration'));
    if (isFinite(startTime) || isFinite(duration)) {
      if (isNaN(startTime))
        startTime = 0;

      videoUrl += "#t=" + startTime;

      if (duration) {
        videoUrl += ',' + (startTime + duration);
      }
    }
    videoPlayer.src = videoUrl;

    $('#mediaModal .modal-video-content').html(videoPlayer);
    $('#mediaModal').modal();

    e.preventDefault();
  });
});
