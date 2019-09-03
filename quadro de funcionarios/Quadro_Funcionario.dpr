program Quadro_Funcionario;

uses
  Forms,
  QuadroPrincipal in 'QuadroPrincipal.pas' {FormPrincipal},
  QuadroPesquisa in 'QuadroPesquisa.pas' {FormPesquisa},
  QuadroCadastro in 'QuadroCadastro.pas' {FormCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormPesquisa, FormPesquisa);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.Run;
end.
