
$('#mediaModal').on('hidden.bs.modal', function () {
  $('#modal-target').html('');
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

      $('#modal-target').html('<div class="embed-responsive embed-responsive-16by9"><iframe src="' + videoUrl + '" allowscriptaccess="always"></iframe></div>');
      $('#mediaModal').modal();
    }
  });
});

/* HTML5 videos */
$(document).ready(function () {
  $('.video-link').on('click', function (e) {
    var videoPlayer = null;
    if ($(this).attr('data-url')) {
      videoPlayer = document.createElement('video');
      videoPlayer.controls = true;
      videoPlayer.autoplay = true;

      var videoUrl = $(this).attr("data-url");
      var startTime = parseFloat($(this).attr('data-start'));
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
    } else if ($(this).attr('data-iframe')) {
      videoPlayer = document.createElement('iframe');
      videoPlayer.src = $(this).attr('data-iframe');
      videoPlayer.scrolling = "no";
      videoPlayer.border = "no";
      videoPlayer.sandbox = "allow-scripts allow-same-origin";
    }

    if (videoPlayer !== null) {
      $('#modal-target').html('<div class="embed-responsive embed-responsive-16by9"></div>');
      $('#modal-target > div').html(videoPlayer);
      $('#mediaModal').modal();

      e.preventDefault();
    }
  });
});

/* Twitter */
$(document).ready(function () {
  $('.twitter-link').on('click', function (e) {
    try {
      var tweetId = $(this).attr('data-tweet');

      twttr.widgets.createTweet(tweetId,
        document.getElementById('modal-target'),
        {
          "conversation": "all"
        });

      $('#mediaModal').modal();
      e.preventDefault();
    } catch (e) { }
  });
});

/* Share the Facts */
$(document).ready(function() {
  $('.share-the-facts-widget').each(function(idx, container) {
    /* Still on the fence about this, but leaning towards not enabling it. */
    return;
    var reqUrl = 'http://www.sharethefacts.co/services/oembed?format=json&url=https://www.sharethefacts.co/share/';
    reqUrl += $(container).attr('data-share-the-facts-id');
    $.getJSON(reqUrl, function(data) {
      $(container).replaceWith('<div class="share-the-fact">' + data.html + '</div>');
    });
  });
});
