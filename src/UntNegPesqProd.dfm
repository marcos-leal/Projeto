object FrmNegPesqProd: TFrmNegPesqProd
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FrmNegPesqProd'
  ClientHeight = 450
  ClientWidth = 578
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
    Width = 578
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -95
    ExplicitWidth = 730
  end
  object Image2: TImage
    Left = 0
    Top = 422
    Width = 578
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitTop = 271
    ExplicitWidth = 574
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 578
    Height = 64
    Align = alTop
    TabOrder = 0
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
    object BttnLOCALIZAR: TButton
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
      OnClick = BttnLOCALIZARClick
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
    Width = 578
    Height = 317
    Hint = 'Duplo clique para selecionar o produto'
    Align = alClient
    DataSource = DtSrcPRODUTO
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 337
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Visible = True
      end>
  end
  object SQLQryPRODUTO: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CODPROD, NOME, PRECO, DTCADASTRO, DTULTALTER'
      '  FROM PRODUTO '
      ' WHERE CODPROD = 0')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 308
    Top = 232
  end
  object ClntDtStPRODUTO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrPRODUTO'
    Left = 324
    Top = 248
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
      FieldName = 'DTCADASTRO'
    end
    object ClntDtStPRODUTODTULTALTER: TSQLTimeStampField
      FieldName = 'DTULTALTER'
    end
  end
  object DtStPrvdrPRODUTO: TDataSetProvider
    DataSet = SQLQryPRODUTO
    Left = 316
    Top = 240
  end
  object DtSrcPRODUTO: TDataSource
    DataSet = ClntDtStPRODUTO
    Left = 340
    Top = 256
  end
end
