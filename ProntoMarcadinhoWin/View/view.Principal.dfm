object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pronto Marcadinho'
  ClientHeight = 241
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 1
    Top = -3
    Width = 169
    Height = 121
    Caption = 'Cadastro de Profissionais'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = -3
    Width = 169
    Height = 121
    Caption = 'Cadastro de Clientes'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 1
    Top = 112
    Width = 169
    Height = 121
    Caption = 'Agenda'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 168
    Top = 112
    Width = 169
    Height = 121
    Caption = 'Marcar Consulta'
    TabOrder = 3
    OnClick = Button4Click
  end
end
