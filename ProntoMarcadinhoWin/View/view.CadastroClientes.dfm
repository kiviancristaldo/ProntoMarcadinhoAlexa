object frmCadastroClientes: TfrmCadastroClientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 458
  ClientWidth = 648
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
    Width = 648
    Height = 57
    Align = alTop
    TabOrder = 0
    object btInserir: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btInserirClick
      ExplicitLeft = -5
      ExplicitTop = 9
    end
    object btEditar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btEditarClick
    end
    object btCancelar: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btCancelarClick
    end
    object btGravar: TButton
      Left = 301
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btGravarClick
    end
    object btExcluir: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btExcluirClick
      ExplicitLeft = 220
      ExplicitTop = -4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 648
    Height = 401
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 29
      Height = 13
      Caption = 'NOME'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 62
      Height = 13
      Caption = 'SOBRENOME'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 16
      Top = 136
      Width = 93
      Height = 13
      Caption = 'DATANASCIMENTO'
      FocusControl = DBEdit4
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 200
      Width = 646
      Height = 200
      Align = alBottom
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 134
      Height = 21
      DataField = 'ID'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 654
      Height = 21
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 112
      Width = 654
      Height = 21
      DataField = 'SOBRENOME'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 152
      Width = 134
      Height = 21
      DataField = 'DATANASCIMENTO'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = dados.qryClientes
    Left = 320
    Top = 232
  end
end
