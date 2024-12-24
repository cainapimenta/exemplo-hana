using {
    sap.common.CodeList,
    cuid,
    managed
} from '@sap/cds/common';

namespace alfa.treinamento.hana;

type Code : String(50) @(title: 'Código');

@cds.autoexpose
aspect code : cuid {
    code : Code not null
}

@cds.autoexpose @readonly
aspect ViewData {

}

@cds.persistence.exists 
entity Produto : ViewData {
    key code  : String(50);
    name  : String(100);
    price : Decimal(10, 2);
}

@cds.persistence.exists
entity Fornecedor : ViewData {
    key code : String(100);
    name : String(100);
    cnpj : String(14);
}

@cds.autoexpose
entity StatusOrder : CodeList {
    key code        : String(10)  @Common.Text: name  @Common.TextArrangement: #TextOnly;
        criticality : Integer;
}

@asset.unique: {documentNumber: [documentNumber]}
entity OrderHeader : cuid, managed {
    @mandadory documentNumber       : String(10) not null    @title: 'Nº do documento';
    @mandatory documentDate         : Date default $now      @title: 'Data do documento';
    @mandatory expectedDeliveryDate : Date default $now      @title: 'Data de entrega';
    @mandatory fornecedor_code      : String(100)            @title: 'Fornecedor';
    observation                     : String                 @title: 'Observação';
    fornecedor                      : Association to one Fornecedor
                                          on fornecedor.code = fornecedor_code;

    _item                           : Composition of many OrderItens
                                          on _item.order = $self;

    @readonly status_code           : String(10) default 'P' @title: 'Status';
    status                          : Association to one StatusOrder
                                          on status.code = status_code;
    @readonly total                 : Decimal(12, 2)         @title: 'Total produtos'  @Common.IsCurrency;
}

entity OrderItens : cuid {
    key order               : Association to OrderHeader;
        item_code           : String(50);
        item                : Association to one Produto
                                  on item.code = item_code;

        @readonly item_name : String(100);
        unitCost            : Decimal(12, 2) default 1;
        quantity            : Decimal(12, 2) default 1;
        @readonly total     : Decimal(12, 2);
}
