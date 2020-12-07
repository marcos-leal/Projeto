object FrmManuNegocAux: TFrmManuNegocAux
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FrmManuNegocAux'
  ClientHeight = 151
  ClientWidth = 415
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 415
    Height = 151
    Align = alClient
    TabOrder = 0
    object LblNUMNEGOC: TLabel
      Left = 26
      Top = 12
      Width = 146
      Height = 16
      Caption = 'N'#250'mero da negocia'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object RdGrpSTATUS: TRadioGroup
      Left = 26
      Top = 37
      Width = 364
      Height = 66
      BiDiMode = bdLeftToRight
      Caption = 'Status'
      Columns = 3
      Items.Strings = (
        'Aprovada'
        'Concluir'
        'Cancelada')
      ParentBiDiMode = False
      TabOrder = 0
    end
    object BttnFECHAR: TButton
      Left = 315
      Top = 109
      Width = 75
      Height = 25
      Caption = 'Voltar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BttnFECHARClick
    end
    object Button1: TButton
      Left = 26
      Top = 109
      Width = 75
      Height = 25
      Caption = 'Finalizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object SQLQryEXEC: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 304
    Top = 8
  end
  object SQLQryAUX: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtM0002.sqcORALOGIN
    Left = 200
    Top = 8
  end
end
