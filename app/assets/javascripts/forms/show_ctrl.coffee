formsShowCtrl = ->
  ($scope, Form, $routeParams, Response, $location) ->

    $scope.ready = false
    $scope.formIsFilled = false

    Form.show (id: $routeParams.id), (response) -> 
      $scope.form = response.form
      $scope.ready = true

    checkIsFilled = ->
      ready = true
      for question in $scope.form.questions
        ready = false unless question.response
      $scope.formIsFilled = ready
      $scope.$apply()

    checkForm = _.debounce(checkIsFilled, 200)

    $scope.checkForm = -> checkForm()

    $scope.createResponse = ->
      data = _.map $scope.form.questions, (q) -> 
        [q.id, q.response ]

      Response.create (
        response: 
          form_id: $scope.form.id
          data: data
      ), (response) ->
        $location.path("/forms/#{$scope.form.id}/responses")

angular.module "app.forms"
  .controller "formsShowCtrl", [
    "$scope"
    "Form"
    "$routeParams"
    "Response"
    "$location"
    formsShowCtrl()
  ]
