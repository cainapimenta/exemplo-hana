using OrderService as service from '../../srv/order-service';
using from '../../db/schema';

annotate service.OrderHeader with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : documentNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : documentDate,
            },
            {
                $Type : 'UI.DataField',
                Value : expectedDeliveryDate,
            },
            {
                $Type: 'UI.DataField',
                Value: status_code,
                Criticality: status.criticality
            },
            {
                $Type : 'UI.DataField',
                Value : fornecedor_code,
            },
            {
                $Type : 'UI.DataField',
                Value : observation,
            },
            {
                $Type : 'UI.DataField',
                Value : total,
            },
            {
                $Type : 'UI.DataField',
                Label : 'fornecedor_cnpj',
                Value : fornecedor_cnpj,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Itens',
            Label : 'Itens',
            Target : '_item/@UI.LineItem#ItensPedido',
        }
    ],
    UI.LineItem : [
        {
            $Type: 'UI.DataFieldForAction',
            Label: 'Aprovar',
            Action: 'OrderService.aprovarOrder'
        },
        {
            $Type : 'UI.DataField',
            Value : documentNumber,
            ![@UI.Importance]: #High
        },
        {
            $Type : 'UI.DataField',
            Value : documentDate,
            ![@UI.Importance]: #High
        },
        {
            $Type : 'UI.DataField',
            Value : expectedDeliveryDate,
            ![@UI.Importance]: #Low
        },
        {
            $Type : 'UI.DataField',
            Value : fornecedor_code,
            ![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Value: status_code,
            Criticality: status.criticality,
            ![@UI.Importance]: #Medium
        }
    ],
);

annotate service.OrderItens with @(
    UI.LineItem#ItensPedido: [
        {
            $Type : 'UI.DataField',
            Label : 'Produto',
            Value : item_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Descrição',
            Value : item_name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Quantidade',
            Value : quantity,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Preço',
            Value : unitCost,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total',
            Value : total,
        }
    ]
);