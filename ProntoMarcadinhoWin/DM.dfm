object dados: Tdados
  OldCreateOrder = False
  Height = 391
  Width = 530
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\ProntoMarcadinhoAPP\Banco\DADOSPM.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 40
    Top = 24
  end
  object qryProfissionais: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from profissionais')
    Left = 40
    Top = 88
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
  object qryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cliente')
    Left = 40
    Top = 144
    object qryClientesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qryClientesSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Origin = 'SOBRENOME'
      Required = True
      Size = 50
    end
    object qryClientesDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'DATANASCIMENTO'
      Required = True
    end
  end
  object qryAgenda: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT h.id as IDhorario,p.nome AS nomeDOprofissional ,d.TURNO ,' +
        ' d.DIA ,h.HORARIO, c.NOME AS nomeCLiente, d.id as IDDataETurnos'
      
        'FROM horarios h INNER JOIN DATAETURNOS d ON h.IDDATAETURNOS = d.' +
        'ID'
      
        'INNER JOIN PROFISSIONAIS p ON p.ID = d.IDPROFISSIONAL LEFT JOIN ' +
        'CLIENTE '
      'c ON c.ID = h.IDCLIENTE WHERE 1=1 ')
    Left = 48
    Top = 216
    object qryAgendaNOMEDOPROFISSIONAL: TStringField
      FieldName = 'NOMEDOPROFISSIONAL'
      Origin = 'NOMEDOPROFISSIONAL'
      Required = True
      Size = 50
    end
    object qryAgendaTURNO: TStringField
      FieldName = 'TURNO'
      Origin = 'TURNO'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryAgendaDIA: TDateField
      FieldName = 'DIA'
      Origin = 'DIA'
      Required = True
    end
    object qryAgendaHORARIO: TTimeField
      FieldName = 'HORARIO'
      Origin = 'HORARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAgendaNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Origin = 'NOMECLIENTE'
      Required = True
      Size = 50
    end
    object qryAgendaIDHORARIO: TIntegerField
      FieldName = 'IDHORARIO'
      Origin = 'ID'
      Required = True
    end
    object qryAgendaIDDATAETURNOS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDDATAETURNOS'
      Origin = 'ID'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
  end
  object qryAux: TFDQuery
    FilterOptions = [foCaseInsensitive]
    Connection = FDConnection1
    Left = 208
    Top = 128
  end
  object qryDataEturnos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from dataEturnos')
    Left = 200
    Top = 224
    object qryDataEturnosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDataEturnosIDPROFISSIONAL: TIntegerField
      FieldName = 'IDPROFISSIONAL'
      Origin = 'IDPROFISSIONAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDataEturnosTURNO: TStringField
      FieldName = 'TURNO'
      Origin = 'TURNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryDataEturnosDIA: TDateField
      FieldName = 'DIA'
      Origin = 'DIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qryHorarios: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM HORARIOS')
    Left = 336
    Top = 80
    object qryHorariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHorariosHORARIO: TTimeField
      FieldName = 'HORARIO'
      Origin = 'HORARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryHorariosIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
    end
    object qryHorariosIDDATAETURNOS: TIntegerField
      FieldName = 'IDDATAETURNOS'
      Origin = 'IDDATAETURNOS'
      Required = True
    end
  end
end
