object FrmLimiteCreditoProdutor: TFrmLimiteCreditoProdutor
  Left = 0
  Top = 0
  Caption = 'FrmLimiteCreditoProdutor'
  ClientHeight = 528
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 730
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitTop = -4
  end
  object Image2: TImage
    Left = 0
    Top = 500
    Width = 730
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -82
    ExplicitTop = 271
    ExplicitWidth = 717
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 730
    Height = 159
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 7
      Top = 2
      Width = 706
      Height = 71
      Caption = 'Produtor'
      TabOrder = 0
      object Label1: TLabel
        Left = 13
        Top = 18
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Transparent = True
      end
      object Label2: TLabel
        Left = 90
        Top = 18
        Width = 42
        Height = 13
        Caption = 'Produtor'
        Transparent = True
      end
      object Label3: TLabel
        Left = 430
        Top = 18
        Width = 48
        Height = 13
        Caption = 'CPF/CNPJ'
        Transparent = True
      end
      object DBEdit1: TDBEdit
        Left = 13
        Top = 32
        Width = 70
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        DataField = 'CODPRODUTOR'
        DataSource = FrmProdutor.DtSrcPRODUTOR
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
      object DBEdit2: TDBEdit
        Left = 90
        Top = 32
        Width = 331
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        DataField = 'NOME'
        DataSource = FrmProdutor.DtSrcPRODUTOR
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 430
        Top = 32
        Width = 111
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        DataField = 'CPFCNPJ'
        DataSource = FrmProdutor.DtSrcPRODUTOR
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 7
      Top = 75
      Width = 706
      Height = 72
      Caption = 'Distribuidor'
      TabOrder = 1
      object Label4: TLabel
        Left = 13
        Top = 17
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label5: TLabel
        Left = 109
        Top = 17
        Width = 54
        Height = 13
        Caption = 'Distribuidor'
        Transparent = True
      end
      object Label6: TLabel
        Left = 506
        Top = 17
        Width = 78
        Height = 13
        Caption = 'Limite de cr'#233'dito'
        Transparent = True
      end
      object Label7: TLabel
        Left = 377
        Top = 17
        Width = 25
        Height = 13
        Caption = 'CNPJ'
        Transparent = True
      end
      object SpeedButton1: TSpeedButton
        Left = 83
        Top = 33
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F88FFFFFFFFF
          FFFFF88FFFFFFFFFFFFF8777FFFFFFFFFFFF8877FFFFFFFFFFFFF8377FFFFFFF
          FFFFF8877FFFFFFFFFFFF88377FFFFFFFFFFFF8877FFFFFFFFFFFF88377FFFFF
          FFFFFFF8877FFFFFFFFFFFF8837888888FFFFFFF8878F7778FFFFFFF888888F8
          888FFFFFF887888887FFFFFFFF88FFFFFF8FFFFFFF7F888FFF7FFFFFF88F8FFF
          FF88FFFFFF88888FFF88FFFFF8888FFFFF88FFFFF8F88888FF87FFFFF88888FF
          FFF8FFFFF78888888887FFFFF88F888FFF88FFFFF88888888887FFFFF88FF888
          8F88FFFFFF8FF8888888FFFFFF88FF88888FFFFFFF7FF8888F7FFFFFFF888888
          888FFFFFFFF7F88887FFFFFFFFFF88888FFFFFFFFFFF87777FFF}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object CrrncyEdtCOD_DISTRIB: TCurrencyEdit
        Left = 10
        Top = 33
        Width = 69
        Height = 21
        DisplayFormat = '0'
        TabOrder = 0
        OnExit = CrrncyEdtCOD_DISTRIBExit
      end
      object EdtNOME_DISTRIB: TEdit
        Left = 109
        Top = 33
        Width = 262
        Height = 21
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object CrrncyEdtLIMITECRED: TCurrencyEdit
        Left = 507
        Top = 33
        Width = 79
        Height = 21
        DisplayFormat = ',0.00'
        TabOrder = 3
      end
      object Button1: TButton
        Left = 600
        Top = 33
        Width = 89
        Height = 25
        Caption = 'Finalizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Button1Click
      end
      object EdtCNPJ_DISTRIB: TEdit
        Left = 377
        Top = 33
        Width = 124
        Height = 21
        CharCase = ecUpperCase
        Color = 16702938
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 730
    Height = 300
    Align = alClient
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 728
      Height = 298
      Align = alClient
      Caption = 'Limite de cr'#233'dito do produtor'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 724
        Height = 281
        Align = alClient
        DataSource = DtSrcLIMITECRED
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'LIMITECRED'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODPRODUTOR'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTOR'
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODDISTRIB'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISTRIBUIDOR'
            Width = 253
            Visible = True
          end>
      end
    end
  end
  object SQLQryPESQ_DISTRIB: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CODDISTRIB, CNPJ, NOME, DTCADASTRO, DTULTALTER'
      '  FROM DISTRIBUIDOR'
      ' WHERE CODDISTRIB = 0')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 608
    Top = 272
  end
  object DtStPrvdrPESQ_DISTRIB: TDataSetProvider
    DataSet = SQLQryPESQ_DISTRIB
    Left = 616
    Top = 280
  end
  object ClntDtStPESQ_DISTRIB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrPESQ_DISTRIB'
    Left = 624
    Top = 288
    object ClntDtStPESQ_DISTRIBCODDISTRIB: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODDISTRIB'
      Required = True
      Precision = 10
      Size = 0
    end
    object ClntDtStPESQ_DISTRIBCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Required = True
      Size = 18
    end
    object ClntDtStPESQ_DISTRIBNOME: TWideStringField
      DisplayLabel = 'Distribuidor'
      FieldName = 'NOME'
      Size = 60
    end
    object ClntDtStPESQ_DISTRIBDTCADASTRO: TSQLTimeStampField
      FieldName = 'DTCADASTRO'
    end
    object ClntDtStPESQ_DISTRIBDTULTALTER: TSQLTimeStampField
      FieldName = 'DTULTALTER'
    end
  end
  object DtSrcPESQ_DISTRIB: TDataSource
    DataSet = ClntDtStPESQ_DISTRIB
    Left = 632
    Top = 296
  end
  object SQLQryEXEC: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 632
    Top = 360
  end
  object SQLQryLIMITECRED: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT LIMITECREDITO.CODPRODUTOR, PRODUTOR.NOME AS PRODUTOR, '
      
        '       LIMITECREDITO.CODDISTRIB, DISTRIBUIDOR.NOME AS DISTRIBUID' +
        'OR,'
      '       LIMITECREDITO.LIMITECRED'
      '  FROM LIMITECREDITO, PRODUTOR, DISTRIBUIDOR'
      ' WHERE PRODUTOR.CODPRODUTOR = LIMITECREDITO.CODPRODUTOR'
      '   AND DISTRIBUIDOR.CODDISTRIB = LIMITECREDITO.CODDISTRIB'
      '   AND LIMITECREDITO.CODPRODUTOR = 0')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 360
    Top = 272
  end
  object DtStPrvdrLIMITECRED: TDataSetProvider
    DataSet = SQLQryLIMITECRED
    Left = 368
    Top = 280
  end
  object ClntDtStLIMITECRED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DtStPrvdrLIMITECRED'
    Left = 376
    Top = 288
    object ClntDtStLIMITECREDCODPRODUTOR: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPRODUTOR'
      Required = True
      Precision = 10
      Size = 0
    end
    object ClntDtStLIMITECREDPRODUTOR: TWideStringField
      DisplayLabel = 'Produtor'
      FieldName = 'PRODUTOR'
      Size = 60
    end
    object ClntDtStLIMITECREDCODDISTRIB: TFMTBCDField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODDISTRIB'
      Required = True
      Precision = 10
      Size = 0
    end
    object ClntDtStLIMITECREDDISTRIBUIDOR: TWideStringField
      DisplayLabel = 'Distribuidor'
      FieldName = 'DISTRIBUIDOR'
      Size = 60
    end
    object ClntDtStLIMITECREDLIMITECRED: TFMTBCDField
      DisplayLabel = 'Limite de cr'#233'dito'
      FieldName = 'LIMITECRED'
      DisplayFormat = ',0.00'
      Precision = 12
      Size = 2
    end
  end
  object DtSrcLIMITECRED: TDataSource
    DataSet = ClntDtStLIMITECRED
    Left = 384
    Top = 296
  end
end
