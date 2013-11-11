
$(function() {
  $("#setlist").sortable();
  $("#setlist").disableSelection();
});


function SongCtrl($scope) {
  $scope.songs = gon.songs
  $scope.addSong = function() {
    $scope.songs.push({text:$scope.name});
    $scope.songText = '';
  };
  $scope.addSongFromList = function(songName) {
    $scope.songs.push({text:name});
  };
}