angular.module "app.core"
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'index.html',
        controller: 'dashboardCtrl'

      .when '/sign_up',
        templateUrl: 'sign_up.html',
        controller: 'registrationCtrl'

      .when '/sign_in',
        templateUrl: 'sign_in.html',
        controller: 'sessionsCtrl'

      .when '/forms/:id',
        templateUrl: 'form.html',
        controller: 'formsCtrl'

      .otherwise
        redirectTo: '/'
