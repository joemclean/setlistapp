function SongCtrl($scope) {

  $scope.artist_songs = gon.artist_songs;
  $scope.setlist_songs = gon.setlist_songs;
  $scope.setlist_song_ids = [];

  $scope.addSongToSetlist = function(song) {
    $scope.setlist_songs.push(song);
    $scope.setlist_song_ids.push(song.id);
    $scope.removeItemFromArray($scope.artist_songs, song);
  };

  $scope.removeSongFromSetlist = function(song) {
    $scope.artist_songs.push(song);
    $scope.removeItemFromArray($scope.setlist_songs, song);
    $scope.removeItemFromArray($scope.setlist_song_ids, song.id);
  };

  $scope.removeItemFromArray = function(array, item){
    for(var i = array.length; i--;) {
      if(array[i] === item) {
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
    $scope.setlist_song_ids.splice(end, 0, 
      $scope.setlist_song_ids.splice(start, 1)[0]);
        
    $scope.$apply();
  }

  sortableSong = $('#setlist').sortable({
    start: $scope.dragStart,
    update: $scope.dragEnd,
    axis: "y"
  });
}
