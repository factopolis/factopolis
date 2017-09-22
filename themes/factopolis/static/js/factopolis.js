$('#mediaModal').on('hidden.bs.modal', function () {
  $('#modal-target').html('');
});

/* Shuffle children for elements where order doesn't matter. */
$(document).ready(function () {
  var lists = document.getElementsByClassName('shuffle');
  for (var l = 0; l < lists.length; l++) {
    for (var i = lists[l].children.length; i >= 0; i--) {
      lists[l].appendChild(lists[l].children[Math.random() * i | 0]);
    }
  }
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
      var link = '<a class="modal-external-link" href="' + $(this).attr('href') + '" target="_blank">Watch on ' + $(this).text() + ' <i class="fa fa-external-link" aria-hidden="true"></i></a>';

      $('#modal-target').html('<div class="embed-responsive embed-responsive-16by9"></div>' + link);
      $('#modal-target > div.embed-responsive').html(videoPlayer);
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
      if (tweetId) {
        twttr.widgets.createTweet(tweetId,
          document.getElementById('modal-target'),
          {
            "conversation": "all"
          });
      } else {
        var timelineId = $(this).attr('data-timeline');
        twttr.widgets.createTimeline({
            sourceType: 'collection',
            id: timelineId
          },
          document.getElementById('modal-target')
        );
      }

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

/* Algolia */
$(document).ready(function() {
    $('#search-results').each(function() {
    var search = instantsearch({
      appId: '65DA5UO9TI',
      apiKey: 'bc6aa5e04ce6e9341b0c97f337e0d06d',
      indexName: 'factopolis',
      searchFunction: function(helper) {
        if (helper.state.query === '') {
          $('#latest-statements').show();
          $('#search-results').hide();
        } else {
          $('#latest-statements').hide();
          $('#search-results').show();
          helper.search();
        }
      }
    });

    search.addWidget(instantsearch.widgets.searchBox({
      container: '#search-query',
      placeholder: "Search",
      autofocus: true,
      poweredBy: true
    }));

    search.addWidget(instantsearch.widgets.infiniteHits({
      container: '#search-results',
      autoHideContainer: true,
      transformData: function(data) {
        if (data.quote)
          data.quote = data.quote.replace(/<(\/)?a[^>]*>/g, '<$1span>');
        return data;
      },
      templates: {
        empty: 'No results',
        item:
          '<a class="summary-card" href="/{{objectID}}">' +
            '<div>' +
              '{{#isPerson}}<img src="/{{objectID}}-64.jpg" />{{/isPerson}}' +
              '{{#isStatement}}<img src="/person/{{claimant}}-64.jpg" />{{/isStatement}}' +
            '</div>' +
            '<div class="contents">' +
              '<header>' +
                '<h4>' +
                  '{{#isPerson}}Person: {{name}}{{/isPerson}}' +
                  '{{#isClaim}}Claim: {{title}}{{/isClaim}}' +
                  '{{#isStatement}}Statement by {{claimantName}}{{/isStatement}}' +
                '</h4>' +
                '<h5>' +
                '{{#isClaim}}Made on {{count}} occasion(s).{{/isClaim}}' +
                '{{#isPerson}}{{#highestOffice}}{{highestOffice}}{{#highestOfficeThru}} ({{highestOfficeFrom}} - {{highestOfficeThru}}){{/highestOfficeThru}}{{/highestOffice}}{{/isPerson}}' +
                '{{#isStatement}}{{date}}{{/isStatement}}' +
                '</h5>' +
              '</header>' +
              '<div>' +
                '{{#isPerson}}{{count}} statement(s) on file.{{/isPerson}}' +
                '{{#isClaim}}{{{truth}}}{{/isClaim}}' +
                '{{#isStatement}}{{{quote}}}{{/isStatement}}' +
              '</div>' +
            '</div>' +
          '</a>'
      }
    }));

    search.start();
  });
});
