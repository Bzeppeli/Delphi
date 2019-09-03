object Formprincipal: TFormprincipal
  Left = 192
  Top = 117
  Width = 928
  Height = 480
  Caption = 'Cadastro Socio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PopupMenu = popupmenuprincipal
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 32
    Top = 56
    object Sistena1: TMenuItem
      Caption = '&Sistema'
      object Backup1: TMenuItem
        Caption = '&Backup'
      end
      object Restaurar1: TMenuItem
        Caption = '&Restaurar'
      end
      object Finalizar1: TMenuItem
        Caption = '-'
      end
      object sistemaFinalizar: TMenuItem
        Caption = '&Finalizar'
        ShortCut = 16472
        OnClick = sistemaFinalizarClick
      end
    end
    object Socios: TMenuItem
      Caption = 'Socios'
      object sociosAteracao: TMenuItem
        Caption = '&Altera'#231#227'o'
      end
      object sociosConsulta: TMenuItem
        Caption = '&Consulta'
      end
      object sociosExcluso: TMenuItem
        Caption = '&Exclus'#227'o'
      end
    end
    object Atividades: TMenuItem
      Caption = 'Atividades'
    end
    object Matricula: TMenuItem
      Caption = '&Matricula'
      object MatriculaCadastro: TMenuItem
        Caption = 'Cadastro'
      end
      object MatriculaExcluso: TMenuItem
        Caption = '&Exclus'#227'o'
      end
      object MatriculaConsulta: TMenuItem
        Caption = '&Consulta'
      end
    end
    object Relatorios: TMenuItem
      Caption = '&Relatorios'
      object relatoriosSocios: TMenuItem
        Caption = '&Socios'
      end
      object relatoriosAtividades: TMenuItem
        Caption = '&Atividades'
      end
      object relatoriosMatricula: TMenuItem
        Caption = '&Matricula'
      end
    end
    object Help: TMenuItem
      Caption = '&Help'
      object helpAjuda: TMenuItem
        Caption = '&Ajuda'
      end
      object helpSobre: TMenuItem
        Caption = '&Sobre'
      end
    end
  end
  object popupmenuprincipal: TPopupMenu
    Left = 72
    Top = 56
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object popupsistemaBackup: TMenuItem
        Caption = 'Backup'
      end
      object popupsistemaRestarurar: TMenuItem
        Caption = 'Restaurar'
      end
      object popupsistemaFinalizar: TMenuItem
        Caption = 'Finalizar'
        OnClick = sistemaFinalizarClick
      end
    end
    object popupSocios: TMenuItem
      Caption = 'Socios'
      object popupsociosAlterao: TMenuItem
        Caption = 'Altera'#231#227'o'
      end
      object popupsociosConsulta: TMenuItem
        Caption = 'Consulta'
      end
      object popupsociosExcluso: TMenuItem
        Caption = 'Exclus'#227'o'
      end
    end
    object Ativdades1: TMenuItem
      Caption = 'Ativdades'
    end
    object popupMatricula: TMenuItem
      Caption = 'Matricula'
      object popupmatriculaCadastro: TMenuItem
        Caption = 'Cadastro'
      end
      object popupmatriculaExcluso: TMenuItem
        Caption = 'Exclus'#227'o'
      end
      object popupmatriculaConsulta: TMenuItem
        Caption = 'Consulta'
      end
    end
    object popupRelatorios: TMenuItem
      Caption = 'Relatorios'
      object popuprelatoriosSocios: TMenuItem
        Caption = 'Socios'
      end
      object popuprelatoriosAtividades: TMenuItem
        Caption = 'Atividades'
      end
      object popuprelatoriosMatricula: TMenuItem
        Caption = 'Matricula'
      end
    end
    object popupHelp: TMenuItem
      Caption = 'Help'
      object popuphelpAjuda: TMenuItem
        Caption = 'Ajuda'
      end
      object popuphelpSobre: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
end
