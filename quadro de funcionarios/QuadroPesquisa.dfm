object FormPesquisa: TFormPesquisa
  Left = 192
  Top = 117
  Width = 571
  Height = 355
  Caption = 'Pesquisar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Nome: TLabel
    Left = 8
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 95
    Height = 13
    Caption = 'Data de nascimento'
  end
  object Label2: TLabel
    Left = 8
    Top = 104
    Width = 20
    Height = 13
    Caption = 'CPF'
  end
  object Label3: TLabel
    Left = 304
    Top = 16
    Width = 79
    Height = 13
    Caption = 'Seleione o Leitor'
  end
  object editNome: TEdit
    Left = 56
    Top = 16
    Width = 217
    Height = 21
    TabOrder = 0
  end
  object editeData: TEdit
    Left = 112
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object editCPF: TEdit
    Left = 112
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object rbDisplay: TMemo
    Left = 16
    Top = 152
    Width = 265
    Height = 153
    Lines.Strings = (
      'rbDisplay')
    TabOrder = 3
  end
  object cbLeitor: TComboBox
    Left = 400
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object Binicialize: TButton
    Left = 400
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Inicialize'
    TabOrder = 5
    OnClick = BinicializeClick
  end
  object Bconecte: TButton
    Left = 400
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 6
  end
end
