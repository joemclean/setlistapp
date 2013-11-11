
$(function() {
  $("#setlist").sortable();
  $("#setlist").disableSelection();
});


function SongCtrl($scope) {
  $scope.artist_songs = gon.songs
  $scope.setlist_songs = [];

  $scope.addSongFromList = function(song) {
    $scope.setlist_songs.push(song);
  };
}