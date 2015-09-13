dashboardCtrl = ->
  ($scope, Auth, $location, $rootScope) ->
    if $scope.ready && !$rootScope.user
      $location.path('/sign_up')

angular.module "app.dashboard"
  .controller "dashboardCtrl", [
    "$scope"
    "Auth"
    "$location"
    "$rootScope"
    dashboardCtrl()
  ]
