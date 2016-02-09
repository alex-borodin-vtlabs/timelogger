angular.module('app').controller('ProjectIndexController', ["$scope", "Project", "TimeHelper", function($scope, Project, TimeHelper) {

    //Grab all forums from the server
    $scope.projects = Project.query(function() {
        TimeHelper.setProjectsTime($scope.projects);

    });
	$scope.showCreateForm = false;
	$scope.project = new Project();



    //Destroy method for deleting a project
    $scope.destroy = function(index) {
        var project = $scope.projects[index];
        //Tell the server to remove the object
        var uProject = new Project({id: project.id, title: project.title});
        uProject.$delete(uProject, function() {
            //If successful, remove it from our collection
            $scope.projects.splice(index, 1);
        });

    }

    $scope.update = function(index) {
        var project = $scope.projects[index];
        var uProject = new Project({id: project.id, title: project.title});
    	uProject.$update(uProject ,function(response) {
			project.updating = false;
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
}]);
angular.module('app').controller('ProjectShowController', ["$scope", "$interval", "Project", "Task", "Interval", "$routeParams", "TimeHelper", function($scope, $interval, Project, Task, Interval, $routeParams, TimeHelper) {

    //Grab all forums from the server
    $scope.project = Project.get({id: $routeParams.id}, function() {
        TimeHelper.setTasksTime($scope.project.tasks);

    });
    $scope.showCreateForm = false;
    $scope.task = new Task({project_id: $routeParams.id});

    $scope.play = function(index) {
        var task = $scope.project.tasks[index];
        task.playing = true;
        task.startTime = new Date();
        task.player = $interval(function() {
            var now = new Date();
            var diff = now - task.startTime;
            task.duration = diff + task.currentDuration;
            task.stringDuration = TimeHelper.msToTime(task.duration);
        }, 1000);

    }
    $scope.stop = function(index) {
        var task = $scope.project.tasks[index];
        task.playing = false;
        task.endTime = new Date();

        $interval.cancel(task.player);
        var interval = new Interval({project_id: $routeParams.id,
                                        task_id: task.id,
                                        intrvlbegin: task.startTime,
                                        intrvlend: task.endTime});
        interval.$save(interval, function(response) {
            $scope.project.tasks[index] = Task.get({project_id: $scope.project.id, id: task.id}, function() {
                TimeHelper.setTasksTime($scope.project.tasks);

            });

        });

    }

    //Destroy method for deleting a project
    $scope.destroy = function(index) {
        var task = $scope.project.tasks[index];
        var uTask = new Task({project_id: $scope.project.id, id: task.id, name: task.name});
        //Tell the server to remove the object
        uTask.$delete(uTask, function() {
            //If successful, remove it from our collection
            $scope.project.tasks.splice(index, 1);
        });

    }

    $scope.update = function(index) {
        var task = $scope.project.tasks[index];
        var uTask = new Task({project_id: $scope.project.id, id: task.id, name: task.name});
        uTask.$update(uTask ,function(response) {
            task.updating = false;
            TimeHelper.setTasksTime($scope.project.tasks);

        });
    }
    $scope.create = function(task) {
        if ($scope.createForm.$valid) {

            task.$save(task, function(response) {

                    $scope.showCreateForm = false;
                    $scope.project.tasks.unshift(response);
                    TimeHelper.setTasksTime($scope.project.tasks);
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


}]);
