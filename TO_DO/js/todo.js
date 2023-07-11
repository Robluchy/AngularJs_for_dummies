var app = angular.module("todoApp", []);

app.controller("todoController", function ($scope) {
  $scope.todoList = [];

  $scope.todoAdd = function () {
    $scope.todoList.push({
      todoText: $scope.todoInput,
      done: false,
      state: "todo",
    });
    $scope.todoInput = "";
  };

  $scope.markDone = function () {
    angular.forEach($scope.todoList, function (x) {
      if (x.selected) x.state = "done";
    });
  };

  $scope.markDelayed = function () {
    angular.forEach($scope.todoList, function (x) {
      if (x.selected) x.state = "delayed";
    });
  };

  $scope.remove = function () {
    $scope.todoList = $scope.todoList.filter(function (x) {
      return !x.selected;
    });
  };
  $scope.save = function () {
    localStorage.setItem("todoList", JSON.stringify($scope.todoList));
    $scope.todoList = [];
  };

  $scope.load = function () {
    $scope.todoList = JSON.parse(localStorage.getItem("todoList"));
  };
});
