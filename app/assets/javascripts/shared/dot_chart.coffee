angular.module("app.shared").directive "dotChart", ->
  restrict: "E"
  template: '<highchart ng-if="ready" config="chart"></highchart>'
  scope:
    data: "="
    title: "@"
  controller: ["$scope", ($scope) ->
    $scope.ready = false
  ]
  link: (scope) ->
    scope.ready = true
    scope.chart = 
      options:
        chart:
          type: 'scatter'
          zoomType: 'xy'

        plotOptions: scatter:
          marker:
            radius: 5
            states: hover:
              enabled: true
              lineColor: 'rgb(100,100,100)'
          states: hover: marker: enabled: false
          tooltip:
            headerFormat: '<b>{series.name}</b><br>'
            pointFormat: "#{I18n.t('js.forms.from')}: {point.x}, #{I18n.t('js.forms.to')}: {point.y}"

      title: text: ''

      xAxis:
        title:
          enabled: true
          text: I18n.t("js.forms.from")
        startOnTick: true
        endOnTick: true
        showLastLabel: true
      yAxis: title: text: I18n.t("js.forms.to")

      series: [ {
        name: scope.title
        data: scope.data
      } ]
