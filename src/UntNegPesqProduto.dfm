object FrmNegPesqProduto: TFrmNegPesqProduto
  Left = 0
  Top = 0
  Caption = 'FrmNegPesqProduto'
  ClientHeight = 455
  ClientWidth = 558
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
    Width = 558
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -262
    ExplicitTop = 1
    ExplicitWidth = 897
  end
  object Image2: TImage
    Left = 0
    Top = 427
    Width = 558
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -262
    ExplicitTop = 41
    ExplicitWidth = 897
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 558
    Height = 64
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 574
    object Label5: TLabel
      Left = 15
      Top = 5
      Width = 42
      Height = 13
      Caption = 'Produtor'
      Transparent = True
    end
    object Label1: TLabel
      Left = 310
      Top = 6
      Width = 25
      Height = 13
      Caption = 'CNPJ'
      Transparent = True
    end
    object Label2: TLabel
      Left = 15
      Top = 47
      Width = 219
      Height = 13
      Caption = 'Duplo clique na grid para selecionar o produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtNOME: TEdit
      Left = 15
      Top = 20
      Width = 285
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object BttnLOCALIZARPROD: TButton
      Left = 460
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Localizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BttnLOCALIZARPRODClick
    end
    object EdtCNPJ: TEdit
      Left = 310
      Top = 20
      Width = 136
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      MaxLength = 18
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 558
    Height = 322
    Hint = 'Duplo clique para selecionar o produto'
    Align = alClient
    DataSource = DtSrcPROD
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPROD'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 345
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Visible = True
      end>
  end
  object SQLQryPROD: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CODPROD, NOME, PRECO, DTCADASTRO, DTULTALTER'
      '  FROM PRODUTO '
      ' WHERE CODPROD = 0')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 272
    Top = 232
  end
  object DtStPrvdrPROD: TDataSetProvider
    DataSet = SQLQryPROD
    Left = 280
    Top = 240
  end
  object ClntDtStPROD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrPROD'
    Left = 288
    Top = 248
    object ClntDtStPRODCODPROD: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPROD'
      Required = True
      Precision = 10
      Size = 0
    end
    object ClntDtStPRODNOME: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'NOME'
      Size = 60
    end
    object ClntDtStPRODPRECO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object ClntDtStPRODDTCADASTRO: TSQLTimeStampField
      FieldName = 'DTCADASTRO'
    end
    object ClntDtStPRODDTULTALTER: TSQLTimeStampField
      FieldName = 'DTULTALTER'
    end
  end
  object DtSrcPROD: TDataSource
    DataSet = ClntDtStPROD
    Left = 296
    Top = 256
  end
end
