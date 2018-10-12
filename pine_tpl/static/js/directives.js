var directives = angular.module('pine.directives', []);
directives.directive('navbar', function(){
	return {
		restrict: 'A',
		transclude: true,
		scope: {},
		template: '<div class="navbar navbar-inverse navbar-fixed-top">\
                <div class="container">\
                    <a class="navbar-brand" href="#!/main">Pine</a>\
                    <div class="navbar-collapse collapse">\
                        <ul class="nav navbar-nav">\
                            <li ng-class="{ active:\'main\'== $root.currentItem }"><a href="#!/main">首页</a></li>\
                        </ul>\
                        <ul class="nav navbar-nav navbar-right">\
                            <li ng-class="{ active:\'about\'== $root.currentItem }"><a href="#!/about">关于</a></li>\
                        </ul>\
                    </div>\
                </div>\
			</div>',
		replace: true
	};
});
