angular.module("app").factory("Project", function ProjectFactory($resource) {
	return $resource("/api/projects/:id", {id: '@id'}, {
		update: {
			method: "PUT"
		}
	});
});
angular.module("app").factory('Task', function TaskFactory($resource) {
    return $resource('/api/projects/:project_id/tasks/:id', {project_id: '@project_id', id: '@id'},{
		update: {
			method: "PUT"
		}
    	});
});