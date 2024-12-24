using {alfa.treinamento.hana as my} from '../db/schema';

service OrderService {

    @odata.draft.enabled
    entity OrderHeader as projection on my.OrderHeader
        actions {
            @(
                cds.odata.bindingparameter.name: '_it',
                Common.SideEffects             : {TargetProperties: ['_it/status_code']},
                // Common.IsActionCritical: true,
                Core.OperationAvailable        : {$edmJson: {$Eq: [
                    {$Path: '_it/status_code'},
                    'P'
                ]}}
            )
            action aprovarOrder(
                                @(
                                    Label:'Status',
                                    Common.ValueList.entity:'StatusOrder',
                                    Common.ValueListWithFixedValues
                                )
                                statusCode : String(10) not null @title:'Status'
            );
        };
}
