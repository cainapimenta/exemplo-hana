sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'alfa.exemplo.hana.purchaseorders',
            componentId: 'OrderHeaderList',
            contextPath: '/OrderHeader'
        },
        CustomPageDefinitions
    );
});