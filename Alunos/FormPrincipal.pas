unit FormPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TFormPrinc = class(TForm)
    MainMenu: TMainMenu;
    MainAlunos: TMenuItem;
    MainCadastro: TMenuItem;
    MainPesquisa: TMenuItem;
    MainMaterias: TMenuItem;
    MainProfessores: TMenuItem;
    MainHorario: TMenuItem;
    MainSobre: TMenuItem;
    MainAjuda: TMenuItem;
    MainCoprights: TMenuItem;
    MainSair: TMenuItem;
    procedure MainCadastroClick(Sender: TObject);
    procedure MainSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrinc: TFormPrinc;

implementation

uses QuadroCadastro;

{$R *.dfm}



procedure TFormPrinc.MainCadastroClick(Sender: TObject);
begin
FormCadastro:= TFormCadastro.Create(Application);
FormCadastro.Show;
end;

procedure TFormPrinc.MainSairClick(Sender: TObject);
begin
application.Terminate;
end;

end.
