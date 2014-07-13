function AlertDemoCtrl($scope) {
  $scope.alerts = [
    {type: 'success', msg: 'Click the button at left to get started, or choose an existing lesson below!'}
  ];

  $scope.showAlert = function() {
    $scope.alerts.push({type: 'danger', msg: 'No lesson selected. Click on a lesson to begin!'});
  };

  $scope.closeAlert = function(index) {
    $scope.alerts.splice(index, 1);
  };

}