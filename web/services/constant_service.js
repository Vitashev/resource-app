(function () {

    angular.module('restApp')
        .constant('constant', {
            serviceBase: '/rest.php/',
            resourcesQuery: 'resources',
            resource_classesQuery: 'resource_classes',
            parametersQuery: 'parameters',
            operationsQuery: 'operations',
            personal_datasQuery: 'personal_datas',
            paramsNumber: 6,
            perPage: 4,
            pageRange: 7
        });
})();
