
$(function() {
  $("#setlist").sortable();
  $("#setlist").disableSelection();
});


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
}