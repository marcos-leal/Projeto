object FrmDistribuidor: TFrmDistribuidor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmDistribuidor'
  ClientHeight = 480
  ClientWidth = 814
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
    Width = 814
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -211
    ExplicitWidth = 846
  end
  object Image2: TImage
    Left = 0
    Top = 452
    Width = 814
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -211
    ExplicitTop = 271
    ExplicitWidth = 846
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 814
    Height = 411
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
        Caption = 'Listar Distribuidor'
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
        Width = 54
        Height = 13
        Caption = 'Distribuidor'
        FocusControl = DBEdit2
        Transparent = True
      end
      object Label3: TLabel
        Left = 464
        Top = 15
        Width = 25
        Height = 13
        Caption = 'CNPJ'
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
        DataField = 'CODDISTRIB'
        DataSource = DtSrcDISTRIB
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
        DataSource = DtSrcDISTRIB
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
        DataSource = DtSrcDISTRIB
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
        DataSource = DtSrcDISTRIB
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
        Width = 162
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'CNPJ'
        DataSource = DtSrcDISTRIB
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnExit = DBEdit3Exit
      end
    end
    object GroupBox3: TGroupBox
      Left = 9
      Top = 366
      Width = 795
      Height = 40
      TabOrder = 2
      object BttnFINALIZAR: TButton
        Left = 28
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
  object SQLQryDISTRIB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CODDISTRIB, CNPJ, NOME, DTCADASTRO, DTULTALTER'
      '  FROM DISTRIBUIDOR'
      ' WHERE CODDISTRIB = 0')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 640
    Top = 248
  end
  object DtStPrvdrDISTRIB: TDataSetProvider
    DataSet = SQLQryDISTRIB
    Left = 648
    Top = 256
  end
  object ClntDtStDISTRIB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrDISTRIB'
    AfterPost = ClntDtStDISTRIBAfterPost
    Left = 656
    Top = 264
    object ClntDtStDISTRIBCODDISTRIB: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODDISTRIB'
      Required = True
      Precision = 10
      Size = 0
    end
    object ClntDtStDISTRIBCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Required = True
      Size = 18
    end
    object ClntDtStDISTRIBNOME: TWideStringField
      DisplayLabel = 'Distribuidor'
      FieldName = 'NOME'
      Size = 60
    end
    object ClntDtStDISTRIBDTCADASTRO: TSQLTimeStampField
      DisplayLabel = 'Dt. Cadastro'
      FieldName = 'DTCADASTRO'
    end
    object ClntDtStDISTRIBDTULTALTER: TSQLTimeStampField
      DisplayLabel = 'Dt. Ult. Altera'#231#227'o'
      FieldName = 'DTULTALTER'
    end
  end
  object DtSrcDISTRIB: TDataSource
    DataSet = ClntDtStDISTRIB
    OnStateChange = DtSrcDISTRIBStateChange
    Left = 664
    Top = 272
  end
  object SQLQryAUX: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 528
    Top = 248
  end
end
