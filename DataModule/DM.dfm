object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 236
  Width = 406
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\ProntoMarcadinho\Banco\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 256
    Top = 112
  end
  object qrAgenda: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from agenda')
    Left = 56
    Top = 48
    object qrAgendaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrAgendaIDPROFISSIONAL: TIntegerField
      FieldName = 'IDPROFISSIONAL'
      Origin = 'IDPROFISSIONAL'
      Required = True
    end
    object qrAgendaDIA: TDateField
      FieldName = 'DIA'
      Origin = 'DIA'
      Required = True
    end
    object qrAgendaHORARIO: TTimeField
      FieldName = 'HORARIO'
      Origin = 'HORARIO'
    end
    object qrAgendaIDCLIENTE: TTimeField
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
    end
  end
  object qrProfissionais: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from profissionais')
    Left = 168
    Top = 48
    object qrProfissionaisID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrProfissionaisNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qrProfissionaisSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Origin = 'SOBRENOME'
      Required = True
      Size = 50
    end
    object qrProfissionaisHORARIO_MIN_MANHA: TTimeField
      FieldName = 'HORARIO_MIN_MANHA'
      Origin = 'HORARIO_MIN_MANHA'
    end
    object qrProfissionaisHORARIO_MAX_MANHA: TTimeField
      FieldName = 'HORARIO_MAX_MANHA'
      Origin = 'HORARIO_MAX_MANHA'
    end
    object qrProfissionaisHORAUNITARIA: TTimeField
      FieldName = 'HORAUNITARIA'
      Origin = 'HORAUNITARIA'
    end
    object qrProfissionaisHORARIO_MIN_TARDE: TTimeField
      FieldName = 'HORARIO_MIN_TARDE'
      Origin = 'HORARIO_MIN_TARDE'
    end
    object qrProfissionaisHORARIO_MAX_TARDE: TTimeField
      FieldName = 'HORARIO_MAX_TARDE'
      Origin = 'HORARIO_MAX_TARDE'
    end
  end
  object qrClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes')
    Left = 160
    Top = 168
  end
end
