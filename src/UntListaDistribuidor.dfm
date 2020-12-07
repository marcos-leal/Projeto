object FrmListaDistribuidor: TFrmListaDistribuidor
  Left = 0
  Top = 0
  Caption = 'FrmListaDistribuidor'
  ClientHeight = 436
  ClientWidth = 714
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
    Width = 714
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -195
    ExplicitWidth = 830
  end
  object Image2: TImage
    Left = 0
    Top = 408
    Width = 714
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -195
    ExplicitTop = 271
    ExplicitWidth = 830
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 714
    Height = 72
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 14
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Transparent = True
    end
    object Label5: TLabel
      Left = 90
      Top = 20
      Width = 54
      Height = 13
      Caption = 'Distribuidor'
      Transparent = True
    end
    object Label6: TLabel
      Left = 356
      Top = 20
      Width = 25
      Height = 13
      Caption = 'CNPJ'
      Transparent = True
    end
    object CrrncyEdtCODIGO: TCurrencyEdit
      Left = 14
      Top = 35
      Width = 69
      Height = 21
      DisplayFormat = '0'
      TabOrder = 0
    end
    object EdtNOME: TEdit
      Left = 90
      Top = 35
      Width = 259
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object EdtCNPJ: TEdit
      Left = 356
      Top = 35
      Width = 126
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      MaxLength = 18
      ParentCtl3D = False
      TabOrder = 2
    end
    object BttnLOCALIZAR: TButton
      Left = 506
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Localizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BttnLOCALIZARClick
    end
    object BttnVERIFICAR: TButton
      Left = 610
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Verificar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BttnVERIFICARClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 113
    Width = 714
    Height = 295
    Align = alClient
    DataSource = FrmDistribuidor.DtSrcDISTRIB
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CODDISTRIB'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTCADASTRO'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTULTALTER'
        Width = 97
        Visible = True
      end>
  end
end
