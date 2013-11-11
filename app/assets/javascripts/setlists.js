
$(function() {
  $("#setlist").sortable();
  $("#setlist").disableSelection();
});


function SongCtrl($scope) {

  $scope.sortByKey = function(array, key) {
    return array.sort(function(a, b) {
        var x = a[key]; var y = b[key];
        return ((x < y) ? -1 : ((x > y) ? 1 : 0));
    });
  }

  $scope.artist_songs = gon.songs;
  $scope.sortByKey($scope.artist_songs, 'name');
  $scope.setlist_songs = [];

  $scope.addSongToSetlist = function(song) {
    $scope.setlist_songs.push(song);
    $scope.removeSongFromArray($scope.artist_songs, song);
  };

  $scope.removeSongFromSetlist = function(song) {
    $scope.artist_songs.push(song);
    $scope.removeSongFromArray($scope.setlist_songs, song);
    $scope.sortByKey($scope.artist_songs, 'name');
  };

  $scope.removeSongFromArray = function(array, song){
    for(var i = array.length; i--;) {
      if(array[i] === song) {
          array.splice(i, 1);
      }
    }
  }
}