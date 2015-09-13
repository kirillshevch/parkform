angular.module('parkForm').controller('SessionsCtrl', ['$scope', 'Auth', '$location', '$rootScope',
  ($scope, Auth, $location, $rootScope) ->
    if $scope.ready && $rootScope.user
      $location.path('/')
      
    $scope.signinData = {}

    $scope.logout = ->
      Auth.logout().then ((oldUser) ->
        $rootScope.user = undefined
        $location.path '/sign_in'
      ), (error) ->

    $scope.signIn = ->
      Auth.login($scope.signinData).then ((user) ->
        $rootScope.user = user
        $location.path '/'
      ), (error) ->
        $scope.error = error

])