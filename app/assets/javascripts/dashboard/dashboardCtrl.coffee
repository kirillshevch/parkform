angular.module('parkForm').controller('DashboardCtrl', ['Auth', '$location', '$scope', '$rootScope',
  (Auth, $location, $scope, $rootScope)->
    if $scope.ready && $rootScope.user
      $location.path('/')
])