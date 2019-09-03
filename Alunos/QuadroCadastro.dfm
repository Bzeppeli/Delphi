object FormCadastro: TFormCadastro
  Left = 480
  Top = 121
  Width = 841
  Height = 375
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 376
    Top = 16
    Width = 97
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Nota 1'
  end
  object Label4: TLabel
    Left = 136
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Nota 2'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 104
    Width = 817
    Height = 201
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object CadastroEditNome: TEdit
    Left = 40
    Top = 16
    Width = 305
    Height = 21
    TabOrder = 1
  end
  object CadastroNascimentoEdit: TEdit
    Left = 480
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object CadastroNota1Edit: TEdit
    Left = 48
    Top = 56
    Width = 73
    Height = 21
    TabOrder = 3
  end
  object CadastroNota2Edit: TEdit
    Left = 184
    Top = 56
    Width = 73
    Height = 21
    TabOrder = 4
  end
  object IBTabelaAluno: TIBTable
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
    Left = 800
    Top = 64
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = '127.0.0.1:C:\DB\BDAPP1.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ASCII')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 800
    Top = 32
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 800
  end
  object DataSource1: TDataSource
    DataSet = IBTabelaAluno
    Left = 800
    Top = 96
  end
end
