unit QuadroPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, AcsModule, ComCtrls, ExtCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MainFuncionario: TMenuItem;
    MainHorario: TMenuItem;
    MainHelp: TMenuItem;
    MainSair: TMenuItem;
    Funcionario_Cadastro: TMenuItem;
    Funcionario_Pesquisa: TMenuItem;
    Horario_funcionario: TMenuItem;
    procedure Funcionario_PesquisaClick(Sender: TObject);
    procedure MainSairClick(Sender: TObject);
    procedure Funcionario_CadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses QuadroPesquisa, Unit1;

{$R *.dfm}

procedure TFormPrincipal.Funcionario_PesquisaClick(Sender: TObject);
begin

FormPesquisa :=  TFormPesquisa.Create(Application);
FormPesquisa.Show;

end;

procedure TFormPrincipal.MainSairClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFormPrincipal.Funcionario_CadastroClick(Sender: TObject);
begin
FormCadastro := TFormCadastro.Create(Application);
FormCadastro.Show;
end;

end.
