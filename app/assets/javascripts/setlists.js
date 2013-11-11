function SongCtrl($scope) {

  $scope.artist_songs = gon.songs;
  $scope.setlist_songs = [];

  $scope.addSongToSetlist = function(song) {
    $scope.setlist_songs.push(song);
    $scope.removeSongFromArray($scope.artist_songs, song);
  };

  $scope.removeSongFromSetlist = function(song) {
    $scope.artist_songs.push(song);
    $scope.removeSongFromArray($scope.setlist_songs, song);
  };

  $scope.removeSongFromArray = function(array, song){
    for(var i = array.length; i--;) {
      if(array[i] === song) {
          array.splice(i, 1);
      }
    }
  }
  
  var sortableSong;

  $scope.dragStart = function(e, ui) {
    ui.item.data('start', ui.item.index());
  }

  $scope.dragEnd = function(e, ui) {
    var start = ui.item.data('start'),
      end = ui.item.index();
        
    $scope.setlist_songs.splice(end, 0, 
      $scope.setlist_songs.splice(start, 1)[0]);
        
    $scope.$apply();
  }

  sortableSong = $('#setlist').sortable({
    start: $scope.dragStart,
    update: $scope.dragEnd
  });
}
