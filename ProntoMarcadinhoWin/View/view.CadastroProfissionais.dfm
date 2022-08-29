object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 562
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 650
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitHeight = 25
    end
    object Button2: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
      ExplicitLeft = 129
      ExplicitTop = 16
      ExplicitHeight = 25
    end
    object Button3: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 2
      ExplicitLeft = 210
      ExplicitTop = 16
      ExplicitHeight = 25
    end
    object Button4: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 3
      ExplicitLeft = 291
      ExplicitTop = 16
      ExplicitHeight = 25
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 712
    Height = 505
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 312
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 24
      Top = 6
      Width = 29
      Height = 13
      Caption = 'NOME'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 24
      Top = 52
      Width = 62
      Height = 13
      Caption = 'SOBRENOME'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 98
      Width = 115
      Height = 13
      Caption = 'HORARIO_MIN_MANHA'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 190
      Top = 98
      Width = 117
      Height = 13
      Caption = 'HORARIO_MAX_MANHA'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 24
      Top = 192
      Width = 78
      Height = 13
      Caption = 'HORAUNITARIA'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 27
      Top = 144
      Width = 112
      Height = 13
      Caption = 'HORARIO_MIN_TARDE'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 193
      Top = 144
      Width = 114
      Height = 13
      Caption = 'HORARIO_MAX_TARDE'
      FocusControl = DBEdit7
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 25
      Width = 654
      Height = 21
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 71
      Width = 654
      Height = 21
      DataField = 'SOBRENOME'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 117
      Width = 134
      Height = 21
      DataField = 'HORARIO_MIN_MANHA'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 190
      Top = 117
      Width = 134
      Height = 21
      DataField = 'HORARIO_MAX_MANHA'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 24
      Top = 208
      Width = 134
      Height = 21
      DataField = 'HORAUNITARIA'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 24
      Top = 163
      Width = 134
      Height = 21
      DataField = 'HORARIO_MIN_TARDE'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 190
      Top = 163
      Width = 134
      Height = 21
      DataField = 'HORARIO_MAX_TARDE'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 248
      Width = 710
      Height = 256
      Align = alBottom
      DataSource = DataSource1
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.qryProfissionais
    Left = 128
    Top = 128
  end
end
