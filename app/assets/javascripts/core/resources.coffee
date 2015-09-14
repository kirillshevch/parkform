angular.module "app.core"
  .factory "Form", ($resource) ->
    $resource "/api/forms/:id", { id: "@id" },
      index:  method: "GET"
      show:   method: "GET"
  .factory "Response", ($resource) ->
    $resource "/api/responses/:id", { id: "@id" },
      show:   method: "GET"
      create: method: 'POST'
