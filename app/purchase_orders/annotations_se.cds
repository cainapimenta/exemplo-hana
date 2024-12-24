using OrderService as service from '../../srv/order-service';

annotate service.OrderHeader with @(Common: {SideEffects #UpdateTotalHeader: {
    SourceEntities  : [_item],
    TargetProperties: ['total']

}, });

annotate service.OrderItens @Common.SideEffects #UpdateTotalItem: {
    SourceProperties: [
        'quantity',
        'unitCost'
    ],
    TargetProperties: ['total']
};
