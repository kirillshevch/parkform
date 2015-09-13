angular.module('parkForm').controller('MainCtrl', ['$scope', 'Auth', '$location', '$rootScope'
  ($scope, Auth, $location, $rootScope) ->
    $scope.ready = false

    Auth.currentUser().then ((user) ->
      isAuthenticated = true
      $rootScope.user = Auth._currentUser
      $location.path('/')
      $scope.ready = true
    ), (error) ->
      if $location.path() != 'sign_in'
        $location.path('/sign_up')
      $scope.ready = true

    if $rootScope.user && $location.path() != 'sign_in' && $scope.ready
      $location.path('/')
])