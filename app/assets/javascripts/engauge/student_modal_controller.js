var HowItWorksModalCtrl = function ($scope, $modal) {

  $scope.accessCode = false;

  $scope.open = function (size) {
    var modalInstance = $modal.open({
      templateUrl: 'HowItWorksModal.html',
      size: size,
      resolve: {
        items: function () {
          return $scope.accessCode;
        }
      }
    });
  }; 
};
