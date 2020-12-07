object FrmListaProdutor: TFrmListaProdutor
  Left = 0
  Top = 0
  Caption = 'FrmListaProdutor'
  ClientHeight = 389
  ClientWidth = 717
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
    Width = 717
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitLeft = -195
    ExplicitWidth = 830
  end
  object Image2: TImage
    Left = 0
    Top = 361
    Width = 717
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -195
    ExplicitTop = 271
    ExplicitWidth = 830
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 717
    Height = 320
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 72
      Width = 715
      Height = 215
      Align = alClient
      DataSource = FrmProdutor.DtSrcPRODUTOR
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
          FieldName = 'CODPRODUTOR'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 302
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPFCNPJ'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTCADASTRO'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTULTALTER'
          Width = 98
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 715
      Height = 71
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
        Left = 88
        Top = 20
        Width = 42
        Height = 13
        Caption = 'Produtor'
        Transparent = True
      end
      object Label6: TLabel
        Left = 352
        Top = 20
        Width = 48
        Height = 13
        Caption = 'CPF/CNPJ'
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
        Left = 88
        Top = 35
        Width = 259
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
      end
      object EdtCPFCNPJ: TEdit
        Left = 352
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
    object Panel3: TPanel
      Left = 1
      Top = 287
      Width = 715
      Height = 32
      Align = alBottom
      TabOrder = 2
      object BttnLIMITECRED: TButton
        Left = 552
        Top = 3
        Width = 133
        Height = 25
        Caption = 'Limite de cr'#233'dito '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BttnLIMITECREDClick
      end
    end
  end
end
