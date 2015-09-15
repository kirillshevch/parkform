responsesShowCtrl = ->
  ($scope, Response, $routeParams) ->
    $scope.ready = false
    $scope.isArray = (object) -> typeof(object) == "object"
    Response.show (id: $routeParams.id), (response) -> 
      $scope.data = {}
      $scope.data.form = response.data.form
      dataResponse = {}
      _.map response.data.response.data, (item) -> dataResponse[item[0]] = item[1] 
      $scope.data.response = dataResponse
      $scope.ready = true

angular.module "app.responses"
  .controller "responsesShowCtrl", [
    "$scope"
    "Response"
    "$routeParams"
    responsesShowCtrl()
  ]
