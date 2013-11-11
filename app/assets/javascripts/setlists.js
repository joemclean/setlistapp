
$(function() {
  $("#setlist").sortable();
  $("#setlist").disableSelection();
});


function SongCtrl($scope) {
  $scope.songs = gon.songs
  $scope.addSongFromList = function(name) {
    $scope.songs.push({name:name});
  };
}