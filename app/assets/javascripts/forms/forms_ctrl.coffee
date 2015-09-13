formsCtrl = ->
  ($scope) ->
    if $scope.ready && $rootScope.user
      $location.path('/')

angular.module "app.forms"
  .controller "formsCtrl", [
    "$scope"
    formsCtrl()
  ]
