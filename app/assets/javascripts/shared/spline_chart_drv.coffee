angular.module("app.shared").directive "splineChart", ->
  restrict: "E"
  template: '<highchart ng-if="ready" config="chart"></highchart>{{::total}}'
  scope:
    data: "="
  controller: ["$scope", ($scope) ->
    $scope.ready = false
    $scope.allResponses = (total) -> $filter('translateParams')($translate.instant('js.helpers.responses'), total: total)
  ]
  link: (scope) ->
    data = []
    xAxis = []
    _.map scope.data, (value, key) ->
      xAxis.unshift key
      data.unshift value
    scope.ready = true
       
    scope.chart =
      options:
        chart: type: 'line'
        plotOptions: 
          series: stacking: 'normal'
        tooltip: enabled: false
        legend: enabled: false
      legend: enabled: false
      series: [ {
        name: ''
        data: data
        type: 'spline'
        color: '#077bc3'
        lineWidth: '3px'
        dashStyle: 'Solid'
        states: hover: enabled: false
        marker: 
          enabled: false
          states: hover: enabled: false
      } ]
      title: text: ''
      xAxis:
        title: text: I18n.t("js.helpers.created_at")
        categories: xAxis
      yAxis:
        title: text: I18n.t("js.response.count_of")
      credits: enabled: false
      loading: false
      size: {}
      subtitle: text: ''
