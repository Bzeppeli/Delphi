object FormPrincipal: TFormPrincipal
  Left = 192
  Top = 117
  Width = 928
  Height = 480
  Caption = 'Quadro de Funcionarios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    object MainFuncionario: TMenuItem
      Caption = 'Funcionarios'
      object Funcionario_Cadastro: TMenuItem
        Caption = 'Cadastro'
        OnClick = Funcionario_CadastroClick
      end
      object Funcionario_Pesquisa: TMenuItem
        Caption = 'Pesquisar'
        OnClick = Funcionario_PesquisaClick
      end
    end
    object MainHorario: TMenuItem
      Caption = 'Horario'
      object Horario_funcionario: TMenuItem
        Caption = 'Funcionario'
      end
    end
    object MainHelp: TMenuItem
      Caption = 'Help'
    end
    object MainSair: TMenuItem
      Caption = 'Sair'
      OnClick = MainSairClick
    end
  end
end
