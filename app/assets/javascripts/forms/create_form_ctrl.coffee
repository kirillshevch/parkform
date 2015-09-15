createFormCtrl = ->
  ($scope, Form, $location, $modal) ->
    $scope.popup = $modal( 
      scope: $scope
      templateUrl: 'forms/add_question_modal.html'
      container: 'body'
      show: false
    )
  

angular.module "app.forms"
  .controller "createFormCtrl", [
    "$scope"
    "Form"
    "$location"
    "$modal"
    createFormCtrl()
  ]
