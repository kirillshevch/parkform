angular.module "app.core"
  .factory "Form", ($resource) ->
    $resource "/api/forms/:id", { id: "@id" },
      index:  method: "GET"
      show:   method: "GET"
