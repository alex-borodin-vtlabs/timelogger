var app = angular.module('app');
app.controller('TasksController', function($scope, Task, $routeParams) {
    //Grab all the comments from the server
    $scope.tasks = Task.query({project_id: $routeParams.id});
});