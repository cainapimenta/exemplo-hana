using OrderService as service from '../../srv/order-service';

annotate service.OrderHeader with {
    status_code     @Common: {
        Text           : status.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'StatusOrder',
            Label         : 'Status',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: status_code,
                ValueListProperty: 'code'
            }]
        },
    };
    fornecedor_code @(
        Common: {
            Text           : fornecedor.name,
            TextArrangement: #TextFirst,
            SemanticObject : 'Fornecedor',
            ValueList      : {
                $Type         : 'Common.ValueListType',
                Label         : 'Lista de fornecedores',
                CollectionPath: 'Fornecedor',
                Parameters    : [
                    {
                        $Type            : 'Common.ValueListParameterInOut',
                        LocalDataProperty: fornecedor_code,
                        ValueListProperty: 'code'
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    }
                ]
            },
        },
        )
};

annotate service.OrderItens with {
    item_code @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        Label         : 'Lista de Produtos',
        CollectionPath: 'Produto',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: item_code,
                ValueListProperty: 'code'
            },
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: item_name,
                ValueListProperty: 'name'
            },
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: unitCost,
                ValueListProperty: 'price'
            }
        ]
    }, }
};