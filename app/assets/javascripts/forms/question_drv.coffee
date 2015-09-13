angular.module("app.forms").directive "question", ->
  restrict: "E"
  replace: true
  template: '<ng-include src="dynamicTemplateUrl"></ng-include>'
  scope:
    question: "="
    checkForm: "="
  link: (scope) ->
    scope.dynamicTemplateUrl = "forms/question_#{scope.question.question_type}.html"
  controller: ["$scope", ($scope) ->

    if $scope.question_type == "checkbox"
      $scope.question.response = [] 
    else if $scope.question.question_type == "slider"
      $scope.question.response = $scope.question.data
    else
      $scope.question.response = ""

  ]
