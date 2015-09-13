mainCtrl = ->
  ($scope, Auth, $location, $rootScope) ->
    if window.anonimusUser
      $scope.ready = true
      $scope.isAuthenticated = false
      $rootScope.user = null
      $scope.currentUser = null
      if $location.path() != "/sign_in" && $location.path() != "/sign_up"
        $location.path("/sign_in")
    else
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

angular.module "app.core"
  .controller "mainCtrl", [
    "$scope"
    "Auth"
    "$location"
    "$rootScope"
    mainCtrl()
  ]
