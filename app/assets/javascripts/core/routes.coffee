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

      .when '/forms/:id',
        templateUrl: 'forms/show.html',
        controller: 'formsShowCtrl'

      .otherwise
        redirectTo: '/'
