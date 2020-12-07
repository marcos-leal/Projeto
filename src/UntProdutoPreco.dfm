object FrmProdutoPreco: TFrmProdutoPreco
  Left = 0
  Top = 0
  Caption = 'FrmProdutoPreco'
  ClientHeight = 485
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 818
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -179
    ExplicitWidth = 814
  end
  object Image2: TImage
    Left = 0
    Top = 457
    Width = 818
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -179
    ExplicitTop = 271
    ExplicitWidth = 814
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 818
    Height = 416
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 9
      Top = 6
      Width = 795
      Height = 67
      TabOrder = 0
      object BttnNOVO: TButton
        Left = 28
        Top = 28
        Width = 90
        Height = 25
        Caption = 'Novo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BttnNOVOClick
      end
      object BttnLISTARPRODUTOR: TButton
        Left = 142
        Top = 28
        Width = 110
        Height = 25
        Hint = 'Lista de distribuidor para pesquisa e edi'#231#227'o.'
        Caption = 'Listar Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BttnLISTARPRODUTORClick
      end
      object BttnALTERAR: TButton
        Left = 272
        Top = 28
        Width = 90
        Height = 25
        Caption = 'Alterar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BttnALTERARClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 79
      Width = 795
      Height = 280
      TabOrder = 1
      object Label1: TLabel
        Left = 28
        Top = 15
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Transparent = True
      end
      object Label4: TLabel
        Left = 28
        Top = 58
        Width = 62
        Height = 13
        Caption = 'Dt. Cadastro'
      end
      object Label5: TLabel
        Left = 124
        Top = 58
        Width = 84
        Height = 13
        Caption = 'Dt. Ult. Altera'#231#227'o'
      end
      object Label2: TLabel
        Left = 124
        Top = 15
        Width = 38
        Height = 13
        Caption = 'Produto'
        FocusControl = DBEdit2
        Transparent = True
      end
      object Label3: TLabel
        Left = 464
        Top = 15
        Width = 75
        Height = 13
        Caption = 'Pre'#231'o de venda'
        FocusControl = DBEdit3
        Transparent = True
      end
      object DBEdit1: TDBEdit
        Left = 28
        Top = 29
        Width = 88
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        DataField = 'CODPROD'
        DataSource = DtSrcPRODUTO
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 28
        Top = 73
        Width = 88
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        DataField = 'DTCADASTRO'
        DataSource = DtSrcPRODUTO
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 124
        Top = 73
        Width = 88
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        DataField = 'DTULTALTER'
        DataSource = DtSrcPRODUTO
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit2: TDBEdit
        Left = 124
        Top = 29
        Width = 332
        Height = 21
        AutoSelect = False
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'NOME'
        DataSource = DtSrcPRODUTO
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 464
        Top = 29
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'PRECO'
        DataSource = DtSrcPRODUTO
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 9
      Top = 366
      Width = 795
      Height = 40
      TabOrder = 2
      object BttnFINALIZAR: TButton
        Left = 26
        Top = 12
        Width = 90
        Height = 25
        Caption = 'Finalizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BttnFINALIZARClick
      end
      object BttnCANCELAR: TButton
        Left = 186
        Top = 10
        Width = 90
        Height = 25
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BttnCANCELARClick
      end
      object BttnFECHAR: TButton
        Left = 698
        Top = 10
        Width = 90
        Height = 25
        Caption = 'Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BttnFECHARClick
      end
    end
  end
  object SQLQryPRODUTO: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CODPROD, NOME, PRECO, DTCADASTRO, DTULTALTER'
      '  FROM PRODUTO'
      ' WHERE CODPROD = 0 ')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 400
    Top = 248
  end
  object DtStPrvdrPRODUTO: TDataSetProvider
    DataSet = SQLQryPRODUTO
    Left = 408
    Top = 256
  end
  object ClntDtStPRODUTO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrPRODUTO'
    AfterPost = ClntDtStPRODUTOAfterPost
    Left = 416
    Top = 264
    object ClntDtStPRODUTOCODPROD: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPROD'
      Required = True
      Precision = 10
      Size = 0
    end
    object ClntDtStPRODUTONOME: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 60
    end
    object ClntDtStPRODUTOPRECO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object ClntDtStPRODUTODTCADASTRO: TSQLTimeStampField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'DTCADASTRO'
    end
    object ClntDtStPRODUTODTULTALTER: TSQLTimeStampField
      DisplayLabel = 'Dt. Ult. Altera'#231#227'o'
      FieldName = 'DTULTALTER'
    end
  end
  object DtSrcPRODUTO: TDataSource
    DataSet = ClntDtStPRODUTO
    OnStateChange = DtSrcPRODUTOStateChange
    Left = 424
    Top = 272
  end
end
