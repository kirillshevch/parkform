angular.module('parkForm').controller('FormsCtrl', ['$scope',
  ($scope) ->
    if $scope.ready && $rootScope.user
      $location.path('/')
])