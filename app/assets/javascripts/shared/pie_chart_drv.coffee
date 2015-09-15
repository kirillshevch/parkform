angular.module("app.shared").directive "pieChart", ->
  restrict: "E"
  template: '<highchart ng-if="ready" config="chart"></highchart>{{::total}}'
  scope:
    data: "="
  controller: ["$scope", "$filter", "$translate", ($scope, $filter, $translate) ->
    $scope.ready = false
    $scope.allResponses = (total) -> $filter('translateParams')($translate.instant('js.helpers.responses'), total: total)
  ]
  link: (scope) ->

    createPoint = (point, index) -> { y: parseInt(point), name: index }

    scope.chart =
      title:
        html: true
        align: 'center',
        verticalAlign: 'middle',
        y: -20
      loading: false 
      options: 
        chart: type: 'pie'
        plotOptions: pie:
          innerSize: '70%'
          dataLabels: enabled: false
          showInLegend: true

    getChart = ->
      data = []
      total = 0
      _.map scope.data, (point, index) ->
        data.push createPoint(point, index)
        total += point
      scope.chart.series = [data: data]
      scope.chart.title.text = scope.allResponses(total)
      scope.ready = true

    getChart()

