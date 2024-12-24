sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'alfa.exemplo.hana.purchaseorders',
            componentId: 'OrderHeaderObjectPage',
            contextPath: '/OrderHeader'
        },
        CustomPageDefinitions
    );
});