object frmAgendamento: TfrmAgendamento
  Left = 0
  Top = 0
  Caption = 'Agendamento'
  ClientHeight = 612
  ClientWidth = 1054
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
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 177
    Height = 555
    Align = alLeft
    TabOrder = 1
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
    object Label4: TLabel
      Left = 25
      Top = 125
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object dbCliente: TDBLookupComboBox
      Left = 22
      Top = 88
      Width = 145
      Height = 21
      DataField = 'IDCLIENTE'
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsClientes
      TabOrder = 0
    end
    object rgTurno: TRadioGroup
      Left = 25
      Top = 187
      Width = 91
      Height = 105
      Caption = 'Turno'
      Items.Strings = (
        'Manha'
        'Tarde')
      TabOrder = 1
    end
    object dtData: TMaskEdit
      Left = 25
      Top = 144
      Width = 120
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object dbProfissionais: TDBLookupComboBox
      Left = 22
      Top = 42
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsProfissionais
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1054
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 970
    object Button3: TButton
      Left = 1
      Top = 1
      Width = 130
      Height = 55
      Align = alLeft
      Caption = 'Cancelar Marca'#231#227'o'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 131
      Top = 1
      Width = 128
      Height = 55
      Align = alLeft
      Caption = 'Marcar'
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 259
      Top = 1
      Width = 121
      Height = 55
      Align = alLeft
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = Button6Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 177
    Top = 57
    Width = 877
    Height = 555
    Align = alClient
    DataSource = dsAgenda
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDHORARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEDOPROFISSIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TURNO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLIENTE'
        Width = 64
        Visible = True
      end>
  end
  object dsAgenda: TDataSource
    DataSet = dados.qryAgenda
    Left = 528
    Top = 80
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
