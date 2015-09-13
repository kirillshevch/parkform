angular.module('parkForm').config ($routeProvider) ->
  $routeProvider

  .when '/',
    templateUrl: 'index.html',
    controller: 'DashboardCtrl'

  .when '/sign_up',
    templateUrl: 'sign_up.html',
    controller: 'RegistrationsCtrl'

  .when '/sign_in',
    templateUrl: 'sign_in.html',
    controller: 'SessionsCtrl'

  .when '/forms/:id',
    templateUrl: 'form.html',
    controller: 'FormsCtrl'

  .otherwise
    redirectTo: '/'