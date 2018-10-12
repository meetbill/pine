var app = angular.module('myApp', ['ngRoute','ngResource','pine.services','pine.directives']);

app.run(['$rootScope', function($rootScope) {
    $rootScope.wb_tab = {
        current: "1"
    };
    $rootScope.actions =
    {
        setCurrent: function (param) {
            $rootScope.wb_tab.current = param;
        }
    }
}]);
app.controller('MainxxCtrl', ['$scope','$rootScope','$routeParams', '$location', 'Module', 'Timeout', 'Request','$resource',function($scope, $rootScope ,$routeParams, $location, Module, Timeout, Request,$resource){
	var module = 'main';
    $rootScope.currentItem="main";
	Module.init(module, '首页');
	Module.initSection('server');
	$scope.info = null;
	$scope.loaded = false;
    $scope.title = "Home Page";
    var resource = $resource('/api/groupinfo');
    $scope.groupinfo = resource.get();
}]);
app.controller('AboutCtrl', ['$scope','$rootScope','$routeParams', '$location', 'Module', 'Timeout', 'Request',function($scope, $rootScope ,$routeParams, $location, Module, Timeout, Request){
	var module = 'about';
    $rootScope.currentItem="about";
	Module.init(module, '关于');
	Module.initSection('about');
	$scope.info = null;
	$scope.loaded = false;
    $scope.title = "About Page";
}]);

app.config(
    function($interpolateProvider) {  
        $interpolateProvider.startSymbol('[{');  
        $interpolateProvider.endSymbol('}]');  
});
app.config(['$httpProvider', function($httpProvider) {  
        $httpProvider.defaults.xsrfCookieName = 'csrftoken';  
        $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';  
}]);
app.config(['$routeProvider', function($routeProvider){
    $routeProvider
        .when('/main', {
            controller : 'MainxxCtrl',
            templateUrl : 'static/partials/main.html'
        })
        .when('/about', {
            controller : 'AboutCtrl',
            templateUrl : 'static/partials/about.html'
        })
        .otherwise({
            redirectTo : '/main'
        });
}]);  

