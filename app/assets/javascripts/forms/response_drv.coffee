angular.module("app.forms").directive "response", ->
  restrict: "E"
  replace: true
  template: '<ng-include src="dynamicTemplateUrl"></ng-include>'
  scope:
    question: "="
  link: (scope) ->
    scope.dynamicTemplateUrl = "forms/responses/response_#{scope.question.type}.html"
  controller: ["$scope", ($scope) ->
    
  ]
