formsShowCtrl = ->
  ($scope, Form, $routeParams) ->
    $scope.ready = false
    Form.show (id: $routeParams.id), (response) -> 
      $scope.form = response.form
      $scope.ready = true

angular.module "app.forms"
  .controller "formsShowCtrl", [
    "$scope"
    "Form"
    "$routeParams"
    formsShowCtrl()
  ]
