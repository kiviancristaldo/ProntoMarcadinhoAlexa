object frmAgendamento: TfrmAgendamento
  Left = 0
  Top = 0
  Caption = 'Agendamento'
  ClientHeight = 574
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 57
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 301
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 3
    end
    object Button5: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 808
    Height = 517
    Align = alClient
    TabOrder = 1
    ExplicitTop = 62
    object Label1: TLabel
      Left = 22
      Top = 23
      Width = 54
      Height = 13
      Caption = 'Profissional'
    end
    object Label2: TLabel
      Left = 22
      Top = 69
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 240
      Width = 806
      Height = 276
      Align = alBottom
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 22
      Top = 42
      Width = 145
      Height = 21
      DataField = 'IDPROFISSIONAL'
      DataSource = dsAgenda
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsProfissionais
      TabOrder = 1
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 22
      Top = 88
      Width = 145
      Height = 21
      DataField = 'IDCLIENTE'
      DataSource = dsAgenda
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsClientes
      TabOrder = 2
    end
    object RadioGroup1: TRadioGroup
      Left = 22
      Top = 115
      Width = 91
      Height = 105
      Caption = 'Turno'
      Items.Strings = (
        'Manha'
        'Tarde')
      TabOrder = 3
    end
  end
  object dsAgenda: TDataSource
    DataSet = dados.qryAgenda
    Left = 288
    Top = 96
  end
  object dsProfissionais: TDataSource
    DataSet = dados.qryProfissionais
    Left = 464
    Top = 152
  end
  object dsClientes: TDataSource
    DataSet = dados.qryClientes
    Left = 352
    Top = 152
  end
end
