angular.module("app").factory('TimeHelper', function TimeHelperFactory() {
	return {
	findIntervalsTime: function(task) {
		var timeArray = task.intervals.map(function(interval) {
			return Date.parse(interval.intrvlend) - Date.parse(interval.intrvlbegin);
		});
		return timeArray.reduce(function(a, b) { return a + b; }, 0);
	},
	findTasksTime: function(project) {
		var timeArray = project.tasks.map(function(task) {
			return task.duration;
		});
		return timeArray.reduce(function(a, b) { return a + b; }, 0);
	},
	setTasksTime: function(tasks) {
		var _this = this;
		return tasks.map(function(task) {
				task.duration = _this.findIntervalsTime(task);
				task.currentDuration = task.duration;
				task.stringDuration = _this.msToTime(task.duration);
			return task;
		});
	},
	setProjectsTime: function(projects) {
		var _this = this;
		projects.map(function(project) {
			project.tasks = _this.setTasksTime(project.tasks);
			return project;
		});
		return projects.map(function(project) {
			project.duration = _this.findTasksTime(project);
			project.stringDuration = _this.msToTime(project.duration);
			return project;
		});
	},
	msToTime: function(duration) {
    var milliseconds = parseInt((duration%1000)/100)
        , seconds = parseInt((duration/1000)%60)
        , minutes = parseInt((duration/(1000*60))%60)
        , hours = parseInt((duration/(1000*60*60))%24)
        , days = parseInt((duration/(1000*60*60*24))%7);

    hours = (hours < 10) ? "0" + hours : hours;
    minutes = (minutes < 10) ? "0" + minutes : minutes;
    seconds = (seconds < 10) ? "0" + seconds : seconds;
    hours = (days > 0) ? days + "days " + hours : hours;

    return hours + ":" + minutes + ":" + seconds;
}
	};
});
angular.module("app").factory("Project", ["$resource", function ProjectFactory($resource) {
	return $resource("/api/projects/:id", {id: '@id'}, {
		update: {
			method: "PATCH"
		}
	});
}]);
angular.module("app").factory('Task', ["$resource", function TaskFactory($resource) {
    return $resource('/api/projects/:project_id/tasks/:id', {project_id: '@project_id', id: '@id'},{
		update: {
			method: "PATCH"
		}
    	});
}]);
angular.module("app").factory('Interval', ["$resource", function IntervalFactory($resource) {
    return $resource('/api/projects/:project_id/tasks/:task_id/intervals/:id', {project_id: '@project_id', task_id: '@task_id', id: '@id'},{
		update: {
			method: "PATCH"
		}
    	});
}]);
