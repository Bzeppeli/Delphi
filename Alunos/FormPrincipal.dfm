object FormPrinc: TFormPrinc
  Left = 192
  Top = 117
  Width = 928
  Height = 480
  Caption = 'Cadastro Alunos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Top = 16
    object MainAlunos: TMenuItem
      Caption = '&Alunos'
      object MainCadastro: TMenuItem
        Caption = '&Cadastro'
        OnClick = MainCadastroClick
      end
      object MainPesquisa: TMenuItem
        Caption = 'Pesquisa'
      end
    end
    object MainMaterias: TMenuItem
      Caption = '&Materias'
      object MainProfessores: TMenuItem
        Caption = 'Professores'
      end
      object MainHorario: TMenuItem
        Caption = 'Horario'
      end
    end
    object MainSobre: TMenuItem
      Caption = 'Sobre'
      object MainAjuda: TMenuItem
        Caption = 'Ajuda'
      end
      object MainCoprights: TMenuItem
        Caption = 'Coprights'
      end
    end
    object MainSair: TMenuItem
      Caption = '&Sair'
      OnClick = MainSairClick
    end
  end
end
