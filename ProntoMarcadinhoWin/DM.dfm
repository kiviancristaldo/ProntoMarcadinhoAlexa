object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 391
  Width = 530
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\ProntoMarcadinho\Banco\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 88
    Top = 56
  end
  object qryProfissionais: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from profissionais')
    Left = 152
    Top = 152
    object qryProfissionaisID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProfissionaisNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qryProfissionaisSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Origin = 'SOBRENOME'
      Required = True
      Size = 50
    end
    object qryProfissionaisHORARIO_MIN_MANHA: TTimeField
      FieldName = 'HORARIO_MIN_MANHA'
      Origin = 'HORARIO_MIN_MANHA'
    end
    object qryProfissionaisHORARIO_MAX_MANHA: TTimeField
      FieldName = 'HORARIO_MAX_MANHA'
      Origin = 'HORARIO_MAX_MANHA'
    end
    object qryProfissionaisHORAUNITARIA: TTimeField
      FieldName = 'HORAUNITARIA'
      Origin = 'HORAUNITARIA'
    end
    object qryProfissionaisHORARIO_MIN_TARDE: TTimeField
      FieldName = 'HORARIO_MIN_TARDE'
      Origin = 'HORARIO_MIN_TARDE'
    end
    object qryProfissionaisHORARIO_MAX_TARDE: TTimeField
      FieldName = 'HORARIO_MAX_TARDE'
      Origin = 'HORARIO_MAX_TARDE'
    end
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 248
    Top = 168
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection1
    Left = 352
    Top = 176
  end
end
