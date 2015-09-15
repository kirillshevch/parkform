responsesIndexCtrl = ->
  ($scope, Response, $routeParams) ->
    $scope.ready = false
    Response.index "", (response) -> 
      $scope.responses = response.responses
      $scope.ready = true

angular.module "app.responses"
  .controller "responsesIndexCtrl", [
    "$scope"
    "Response"
    "$routeParams"
    responsesIndexCtrl()
  ]
