angular.module("app.forms").directive "response", ->
  restrict: "E"
  replace: true
  template: '<ng-include src="dynamicTemplateUrl"></ng-include>'
  scope:
    question: "="
  link: (scope) ->
    scope.dynamicTemplateUrl = "forms/responses/response_#{scope.question.type}.html"
  controller: ["$scope", ($scope) ->
    if $scope.question.type == "checkbox" || $scope.question.type == "radio"
      createPoint = (point, index) ->
        {
          y: parseInt(point)
          name: index
        }

      $scope.chart =
        title: text: ''
        loading: false 
        options: 
          chart: type: 'pie'
          plotOptions: pie:
            innerSize: '70%'
            dataLabels: enabled: false
            showInLegend: false

      getChart = ->
        data = []
        total = 0
        _.map $scope.question.data, (point, index) ->
          data.push createPoint(point, index)
        $scope.chart.series = [data: data]

      getChart()

  ]
