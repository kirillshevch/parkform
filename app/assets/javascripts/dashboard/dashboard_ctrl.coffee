dashboardCtrl = ->
  ($scope, Auth, $location, $rootScope) ->
    $location.path('/forms')

angular.module "app.dashboard"
  .controller "dashboardCtrl", [
    "$scope"
    "Auth"
    "$location"
    "$rootScope"
    dashboardCtrl()
  ]
