object FormCadastro: TFormCadastro
  Left = 507
  Top = 120
  Width = 589
  Height = 359
  Caption = 'Cadastro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 200
    Width = 545
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 168
    Top = 144
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:C:\DB\PROTO_1.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 544
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 544
    Top = 40
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
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
        Size = 20
      end
      item
        Name = 'TELEFONE'
        DataType = ftInteger
      end
      item
        Name = 'ENDERE'#231'O'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end>
    StoreDefs = True
    TableName = 'CLIENTES'
    Left = 512
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 512
    Top = 40
  end
end
