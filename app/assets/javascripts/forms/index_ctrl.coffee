formsIndexCtrl = ->
  ($scope, Form) ->
    $scope.ready = false
    Form.index "", (response) ->
      $scope.forms = response.forms
      $scope.ready = true


angular.module "app.forms"
  .controller "formsIndexCtrl", [
    "$scope"
    "Form"
    formsIndexCtrl()
  ]
