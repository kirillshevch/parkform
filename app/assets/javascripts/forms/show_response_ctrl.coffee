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
        _.map response.data, (data) -> 
          if questions[data[0]].type == "text"
            questions[data[0]].data.push response.created_at
          else
            questions[data[0]].data.push data[1]

      _.map questions, (q) -> 
        q.data = _.countBy(q.data) if isChartable(q.type)
        q.data[I18n.t("js.helpers.created_at")] = 0 if q.type == "text"

      questions

    FormResponse.index (form_id: $routeParams.form_id), (response) -> 
      $scope.responsesLength = if response.data.responses.length then true else false
      $scope.questions = prepareResponse(response)
      $scope.ready = true


angular.module "app.forms"
  .controller "formsResponsesShowCtrl", [
    "$scope"
    "FormResponse"
    "$routeParams"
    formsResponsesShowCtrl()
  ]
