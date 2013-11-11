
$(function() {
  $("#setlist").sortable();
  $("#setlist").disableSelection();
});


function SongCtrl($scope) {
  $scope.songs = gon.songs


  $scope.addSongFromList = function(song) {
    $scope.songs.push(song);
  };
}