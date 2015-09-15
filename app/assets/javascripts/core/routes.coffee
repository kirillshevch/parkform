angular.module "app.core"
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'index.html',
        controller: 'dashboardCtrl'

      .when '/sign_up',
        templateUrl: 'auth/sign_up.html',
        controller: 'registrationCtrl'

      .when '/sign_in',
        templateUrl: 'auth/sign_in.html',
        controller: 'sessionsCtrl'

      .when '/forms',
        templateUrl: 'forms/index.html',
        controller: 'formsIndexCtrl'

      .when '/forms/new',
        templateUrl: 'forms/new.html',
        controller: 'createFormCtrl'

      .when '/forms/:id',
        templateUrl: 'forms/show.html',
        controller: 'formsShowCtrl'

      .when '/forms/:form_id/responses',
        templateUrl: 'forms/responses/show.html',
        controller: 'formsResponsesShowCtrl'

      .when '/responses',
        templateUrl: 'responses/index.html',
        controller: 'responsesIndexCtrl'

      .when '/responses/:id',
        templateUrl: 'responses/show.html',
        controller: 'responsesShowCtrl'

      .otherwise
        redirectTo: '/'
