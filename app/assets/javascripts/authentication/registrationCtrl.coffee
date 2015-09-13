angular.module('parkForm').controller('RegistrationsCtrl', ['$scope', 'Auth', '$location', '$rootScope'
  ($scope, Auth, $location, $rootScope) ->
    if $scope.ready && $rootScope.user
      $location.path('/')

    $scope.signupData = {}

    $scope.addUser = ->
      Auth.register($scope.signupData).then ((registeredUser) ->
        $rootScope.user = registeredUser
        $location.path('/')
      ), (error) ->
        $scope.error = error
])