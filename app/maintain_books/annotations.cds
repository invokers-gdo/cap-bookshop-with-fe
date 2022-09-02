using AdminService as service from '../../srv/admin-service';

annotate service.Books with @odata.draft.enabled;

annotate service.Books with {
    @(Core.Computed, Common.Text: title)
    ID;

    @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Books',
        FetchValues : 1,
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : code,
                ValueListProperty : 'code',
                InitialValueIsSignificant : true,
            },
        ],
    }
    
    @Core.Immutable
    code
};


annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Code',
            Value : code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '50%',
            },
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Author',
            Value : author.name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : genre.name,
        },
    ],
    UI.HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Book',
        TypeNamePlural : 'Books',
        Title: { Value: code },
        Description: { Value: descr }
    },
    UI.Identification  : [
        { Value: ID },
        { Value : code }
    ],
    UI.SelectionFields  : [
        code
    ],
);
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Code',
                Value : code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Author',
                Value : author.name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Genre',
                Value : genre.name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Genre Description',
                Value : genre.descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'image',
                Value : image,
            },
            { Value: modifiedAt, ![@UI.Importance] : #Low },
            { Value: modifiedBy, ![@UI.Importance] : #Low }
        ],
    },
    UI.FieldGroup #Audit  : {
            $Type : 'UI.FieldGroupType',
            Data : [
                // { Value: createdAt },
                // { Value: createdBy },
                { Value: modifiedAt},
                { Value: modifiedBy}
            ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        { $Type : 'UI.ReferenceFacet', Target : '@UI.FieldGroup#Audit', Label : 'Audit Info' },
    ]
);
