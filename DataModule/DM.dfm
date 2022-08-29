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
  end
end
