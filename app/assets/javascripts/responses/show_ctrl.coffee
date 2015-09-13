responsesShowCtrl = ->
  ($scope, Response, $routeParams) ->
    $scope.ready = false
    Response.show (id: $routeParams.id), (response) -> 
      $scope.response = response.response
      $scope.ready = true

angular.module "app.responses"
  .controller "responsesShowCtrl", [
    "$scope"
    "Response"
    "$routeParams"
    responsesShowCtrl()
  ]
