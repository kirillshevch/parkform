//= require_tree ./templates
//= require auth/auth
//= require core/core
//= require dashboard/dashboard
//= require forms/forms

angular.module("app", [
  "ngRoute",
  "templates",
  "Devise",
  "ngCookies",
  "ngResource"
  "ui.slider"
  "checklist-model"
  "pascalprecht.translate"
  "app.core"
  "app.auth"
  "app.dashboard"
  "app.forms"
])

