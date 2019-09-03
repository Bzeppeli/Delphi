object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 2456
  Top = 26
  Height = 197
  Width = 215
  object DataCadastro: TDataSource
    DataSet = IBTabelaAluno
    Left = 8
    Top = 104
  end
  object IBTabelaAluno: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DATA DE NASCIMENTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NOTA 1'
        DataType = ftInteger
      end
      item
        Name = 'NOTA 2'
        DataType = ftInteger
      end
      item
        Name = 'MEDIA'
        DataType = ftInteger
      end
      item
        Name = 'FINAL'
        DataType = ftInteger
      end
      item
        Name = 'MEDIA FINAL'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'NEW_TABLE'
    Left = 8
    Top = 56
  end
  object IBTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 80
    Top = 104
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:C:\DB\BDAPP1.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ASCII')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 80
    Top = 56
  end
end
