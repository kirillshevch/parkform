formsResponsesShowCtrl = ->
  ($scope, FormResponse, $routeParams) ->
    $scope.ready = false
    
    isChartable = (type) -> type == "checkbox" || type == "radio" || type == "text"

    prepareQuestion = (question) ->
      {
        id: question.id
        title: question.title
        type: question.question_type
        data: []
      }
    
    prepareResponse = (response) ->
      questions = {}

      _.map response.data.form.questions, (question) -> questions[question.id] = prepareQuestion(question)

      _.map response.data.responses, (response) -> 
        _.map response.data, (data) -> questions[data[0]].data.push data[1] 

      _.map questions, (q) -> q.data = _.countBy(q.data) if isChartable(q.type)

      questions

    FormResponse.index (form_id: $routeParams.form_id), (response) -> 
      $scope.questions = prepareResponse(response)
      $scope.ready = true

angular.module "app.forms"
  .controller "formsResponsesShowCtrl", [
    "$scope"
    "FormResponse"
    "$routeParams"
    formsResponsesShowCtrl()
  ]
