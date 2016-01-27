angular.module('app').controller('ProjectIndexController', function($scope, Project) {

    //Grab all forums from the server
    $scope.projects = Project.query();
	$scope.showCreateForm = false;
	$scope.project = new Project();
    //Destroy method for deleting a project
    $scope.destroy = function(index) {
        //Tell the server to remove the object
        $scope.project.$delete($scope.projects[index], function() {
            //If successful, remove it from our collection
            $scope.projects.splice(index, 1);
        });
    
    }

    $scope.update = function(index) {
    	$scope.projects[index].$update($scope.projects[index] ,function(response) {
			$scope.projects[index].updating = false;
    	});
    }
    $scope.create = function(project) {
    	if ($scope.createForm.$valid) {
     		project.$save(project, function(response) {
					$scope.showCreateForm = false;
					$scope.projects.unshift(response);
					$scope.project = new Project();
     				$scope.createForm.$setUntouched();
     				$scope.createForm.$setPristine();			
		});
		}
		else
		{

     		$scope.createForm.title.$setDirty();			
		}
	}; 
});
angular.module('app').controller('ProjectShowController', function($scope, Project, Task, $routeParams) {

    //Grab all forums from the server
    $scope.project = Project.get({id: $routeParams.id});
    $scope.tasks = Task.query({project_id: $routeParams.id});
    $scope.showCreateForm = false;
    $scope.task = new Task({project_id: $routeParams.id});
    //Destroy method for deleting a project
    $scope.destroy = function(index) {
        //Tell the server to remove the object
        $scope.tasks[index].project_id = $routeParams.id;
        $scope.task.$delete($scope.tasks[index], function() {
            //If successful, remove it from our collection
            $scope.tasks.splice(index, 1);
        });
    
    }

    $scope.update = function(index) {
        $scope.tasks[index].project_id = $routeParams.id;
        $scope.tasks[index].$update($scope.tasks[index] ,function(response) {
            $scope.tasks[index].updating = false;
        });
    }
    $scope.create = function(task) {
        if ($scope.createForm.$valid) {
            task.$save(task, function(response) {
                    $scope.showCreateForm = false;
                    $scope.tasks.unshift(response);
                    $scope.task = new Task({project_id: $routeParams.id});
                    $scope.createForm.$setUntouched();
                    $scope.createForm.$setPristine();           
        });
        }
        else
        {
            $scope.createForm.name.$setDirty();            
        }
    };  


});