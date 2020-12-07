object FrmNegPesqProdutor: TFrmNegPesqProdutor
  Left = 0
  Top = 0
  Caption = 'FrmNegPesqProdutor'
  ClientHeight = 429
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 574
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -95
    ExplicitWidth = 730
  end
  object Image2: TImage
    Left = 0
    Top = 401
    Width = 574
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitTop = 271
    ExplicitWidth = 626
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 574
    Height = 64
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 557
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
      Width = 223
      Height = 13
      Caption = 'Duplo clique na grid para selecionar o produtor'
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
    Width = 574
    Height = 296
    Hint = 'Duplo clique para selecionar o produtor'
    Align = alClient
    DataSource = DtSrcPRODUTOR
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
        FieldName = 'CODPRODUTOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 336
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPFCNPJ'
        Visible = True
      end>
  end
  object DtStPrvdrPRODUTOR: TDataSetProvider
    DataSet = SQLQryPRODUTOR
    Left = 197
    Top = 197
  end
  object ClntDtStPRODUTOR: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrPRODUTOR'
    Left = 210
    Top = 216
    object ClntDtStPRODUTORCODPRODUTOR: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPRODUTOR'
      Required = True
      Precision = 10
      Size = 0
    end
    object ClntDtStPRODUTORCPFCNPJ: TWideStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPFCNPJ'
      Required = True
      Size = 18
    end
    object ClntDtStPRODUTORNOME: TWideStringField
      DisplayLabel = 'Produtor'
      FieldName = 'NOME'
      Size = 60
    end
    object ClntDtStPRODUTORDTCADASTRO: TSQLTimeStampField
      FieldName = 'DTCADASTRO'
    end
    object ClntDtStPRODUTORDTULTALTER: TSQLTimeStampField
      FieldName = 'DTULTALTER'
    end
  end
  object SQLQryPRODUTOR: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CODPRODUTOR, CPFCNPJ, NOME, DTCADASTRO, DTULTALTER    '
      '  FROM PRODUTOR'
      ' WHERE CODPRODUTOR = 0')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 186
    Top = 184
  end
  object DtSrcPRODUTOR: TDataSource
    DataSet = ClntDtStPRODUTOR
    Left = 226
    Top = 232
  end
end
