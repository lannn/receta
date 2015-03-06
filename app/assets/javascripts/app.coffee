receta = angular.module("receta", [
  "templates",
  "ngResource",
  "ngRoute",
  "controllers"
])

receta.config(["$routeProvider", ($routeProvider) ->
  $routeProvider
    .when("/",
      templateUrl: "index.html"
      controller: "RecipesController"
    )
])

controllers = angular.module("controllers", [])
