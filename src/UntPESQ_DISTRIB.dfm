object FrmPESQ_DISTRIB: TFrmPESQ_DISTRIB
  Left = 0
  Top = 0
  Caption = 'FrmPESQ_DISTRIB'
  ClientHeight = 463
  ClientWidth = 555
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
    Width = 555
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -95
    ExplicitWidth = 730
  end
  object Image2: TImage
    Left = 0
    Top = 435
    Width = 555
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -95
    ExplicitTop = 271
    ExplicitWidth = 730
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 555
    Height = 64
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 15
      Top = 5
      Width = 54
      Height = 13
      Caption = 'Distribuidor'
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
      Width = 234
      Height = 13
      Caption = 'Duplo clique na grid para selecionar o distribuidor'
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
      Left = 452
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
    Width = 555
    Height = 330
    Hint = 'Duplo clique para selecionar o distribuidor'
    Align = alClient
    DataSource = FrmLimiteCreditoProdutor.DtSrcPESQ_DISTRIB
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
        FieldName = 'CODDISTRIB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 314
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Width = 129
        Visible = True
      end>
  end
end
