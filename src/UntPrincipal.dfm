object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmPrincipal'
  ClientHeight = 390
  ClientWidth = 784
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
    Width = 784
    Height = 41
    Align = alTop
    AutoSize = True
    ExplicitTop = -6
    ExplicitWidth = 830
  end
  object Image2: TImage
    Left = 0
    Top = 362
    Width = 784
    Height = 28
    Align = alBottom
    AutoSize = True
    ExplicitLeft = -259
    ExplicitTop = 271
    ExplicitWidth = 894
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 784
    Height = 321
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 12
      Top = 46
      Width = 760
      Height = 105
      Caption = 'Cadastro'
      TabOrder = 0
      object BttnPRODUTOR: TButton
        Left = 33
        Top = 24
        Width = 183
        Height = 57
        Caption = 'P&rodutor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BttnPRODUTORClick
      end
      object BttnDISTRIBUIDOR: TButton
        Left = 289
        Top = 24
        Width = 183
        Height = 57
        Caption = '&Distribuidor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BttnDISTRIBUIDORClick
      end
      object BttnPRODUTO_PRECO: TButton
        Left = 545
        Top = 24
        Width = 183
        Height = 57
        Caption = '&Produto/Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BttnPRODUTO_PRECOClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 155
      Width = 760
      Height = 105
      Caption = 'Negocia'#231#227'o'
      TabOrder = 1
      object BttnNEGOCIACAO: TButton
        Left = 153
        Top = 24
        Width = 183
        Height = 57
        Caption = '&Negocia'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BttnNEGOCIACAOClick
      end
      object BttnMANTNEGOC: TButton
        Left = 433
        Top = 24
        Width = 183
        Height = 57
        Caption = '&Manuten'#231#227'o Negocia'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BttnMANTNEGOCClick
      end
    end
    object BttnFECHAR: TButton
      Left = 682
      Top = 290
      Width = 90
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BttnFECHARClick
    end
  end
  object SQLQryAUX: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT TRUNC(SYSDATE) AS DTHOJE '
      '  FROM DUAL')
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 672
    object SQLQryAUXDTHOJE: TSQLTimeStampField
      FieldName = 'DTHOJE'
    end
  end
  object SQLQryAUX1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 592
    Top = 1
  end
end
