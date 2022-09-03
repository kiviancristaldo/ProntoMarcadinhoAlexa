object frmGerarAgenda: TfrmGerarAgenda
  Left = 0
  Top = 0
  Caption = 'Gerar Agenda'
  ClientHeight = 129
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 23
    Width = 54
    Height = 13
    Caption = 'Profissional'
  end
  object dbProfissional: TDBLookupComboBox
    Left = 22
    Top = 42
    Width = 145
    Height = 21
    KeyField = 'ID'
    ListField = 'NOME'
    ListSource = DataSource1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 184
    Top = 42
    Width = 89
    Height = 25
    Caption = 'Gerar Agenda'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = dados.qryProfissionais
    Left = 160
    Top = 72
  end
end
