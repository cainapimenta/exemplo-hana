sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'alfa/exemplo/hana/purchaseorders/test/integration/FirstJourney',
		'alfa/exemplo/hana/purchaseorders/test/integration/pages/OrderHeaderList',
		'alfa/exemplo/hana/purchaseorders/test/integration/pages/OrderHeaderObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderHeaderList, OrderHeaderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('alfa/exemplo/hana/purchaseorders') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderHeaderList: OrderHeaderList,
					onTheOrderHeaderObjectPage: OrderHeaderObjectPage
                }
            },
            opaJourney.run
        );
    }
);