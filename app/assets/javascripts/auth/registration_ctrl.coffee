registrationCtrl = ->
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

angular.module "app.auth"
  .controller "registrationCtrl", [
    "$scope"
    "Auth"
    "$location"
    "$rootScope"
    registrationCtrl()
  ]
