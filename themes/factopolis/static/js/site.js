$(document).ready(function() {
  var lists = document.getElementsByClassName('shuffle');
  for (var l = 0 ; l < lists.length ; l++) {
    for (var i = lists[l].children.length ; i >= 0 ; i--) {
      lists[l].appendChild(lists[l].children[Math.random() * i | 0]);
    }
  }
});
