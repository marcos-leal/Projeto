object FrmListaProdPreco: TFrmListaProdPreco
  Left = 0
  Top = 0
  Caption = 'FrmListaProdPreco'
  ClientHeight = 446
  ClientWidth = 729
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
    Width = 729
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -195
    ExplicitWidth = 830
  end
  object Image2: TImage
    Left = 0
    Top = 418
    Width = 729
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
    Width = 729
    Height = 72
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 714
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
      Width = 38
      Height = 13
      Caption = 'Produto'
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
      Width = 367
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
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
      TabOrder = 2
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
      TabOrder = 3
      OnClick = BttnVERIFICARClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 113
    Width = 729
    Height = 305
    Align = alClient
    DataSource = FrmProdutoPreco.DtSrcPRODUTO
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPROD'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTCADASTRO'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTULTALTER'
        Width = 95
        Visible = True
      end>
  end
end
