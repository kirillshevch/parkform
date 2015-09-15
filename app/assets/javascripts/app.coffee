//= require_tree ./templates
//= require auth/auth
//= require shared/shared
//= require core/core
//= require dashboard/dashboard
//= require forms/forms
//= require responses/responses

angular.module("app", [
  "ngRoute",
  "templates",
  "highcharts-ng"
  "Devise",
  "ngCookies",
  "ngResource"
  "ngSanitize"
  "ui.slider"
  "checklist-model"
  "pascalprecht.translate"
  "app.core"
  "app.shared"
  "app.auth"
  "app.dashboard"
  "app.forms"
  "app.responses"
])

angular.module "app"
  .config [ "$translateProvider", ($translateProvider) ->
    $translateProvider.preferredLanguage(I18n.locale);
    $translateProvider.useSanitizeValueStrategy "sanitize"
    $translateProvider.translations I18n.locale, I18n.translations[I18n.locale]
  ]
