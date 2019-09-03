object QuadroPesquisa: TQuadroPesquisa
  Left = 447
  Top = 137
  Width = 774
  Height = 562
  Caption = 'Pesquisa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 77
    Height = 13
    Caption = 'Busca por nome'
  end
  object Label2: TLabel
    Left = 24
    Top = 136
    Width = 36
    Height = 13
    Caption = 'Busca2'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 312
    Width = 737
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object EditNome: TEdit
    Left = 24
    Top = 96
    Width = 233
    Height = 21
    TabOrder = 1
  end
  object cbCodigo: TComboBox
    Left = 24
    Top = 168
    Width = 145
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'CODIGO'
    Items.Strings = (
      'CODIGO'
      'NOME')
  end
  object CaixaBusca: TEdit
    Left = 192
    Top = 168
    Width = 393
    Height = 21
    TabOrder = 3
    OnChange = CaixaBuscaChange
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:C:\DB\BDAPP1.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 720
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 720
    Top = 64
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
    Left = 720
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 720
    Top = 144
  end
end
