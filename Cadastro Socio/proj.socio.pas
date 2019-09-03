unit proj.socio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFormprincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistena1: TMenuItem;
    Backup1: TMenuItem;
    Restaurar1: TMenuItem;
    Finalizar1: TMenuItem;
    sistemaFinalizar: TMenuItem;
    Socios: TMenuItem;
    sociosAteracao: TMenuItem;
    sociosConsulta: TMenuItem;
    sociosExcluso: TMenuItem;
    Atividades: TMenuItem;
    Matricula: TMenuItem;
    Relatorios: TMenuItem;
    Help: TMenuItem;
    MatriculaCadastro: TMenuItem;
    MatriculaExcluso: TMenuItem;
    MatriculaConsulta: TMenuItem;
    relatoriosSocios: TMenuItem;
    relatoriosAtividades: TMenuItem;
    relatoriosMatricula: TMenuItem;
    helpAjuda: TMenuItem;
    helpSobre: TMenuItem;
    popupmenuprincipal: TPopupMenu;
    Sistema1: TMenuItem;
    popupsistemaBackup: TMenuItem;
    popupsistemaRestarurar: TMenuItem;
    popupsistemaFinalizar: TMenuItem;
    popupSocios: TMenuItem;
    popupsociosAlterao: TMenuItem;
    popupsociosConsulta: TMenuItem;
    popupsociosExcluso: TMenuItem;
    Ativdades1: TMenuItem;
    popupMatricula: TMenuItem;
    popupmatriculaCadastro: TMenuItem;
    popupmatriculaExcluso: TMenuItem;
    popupmatriculaConsulta: TMenuItem;
    popupRelatorios: TMenuItem;
    popuprelatoriosSocios: TMenuItem;
    popuprelatoriosAtividades: TMenuItem;
    popuprelatoriosMatricula: TMenuItem;
    popupHelp: TMenuItem;
    popuphelpAjuda: TMenuItem;
    popuphelpSobre: TMenuItem;
    procedure sistemaFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formprincipal: TFormprincipal;

implementation

{$R *.dfm}

procedure TFormprincipal.sistemaFinalizarClick(Sender: TObject);
begin
Close;
end;

end.
