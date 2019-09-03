program AlunoProj1;

uses
  Forms,
  FormPrincipal in 'FormPrincipal.pas' {FormPrinc},
  QuadroCadastro in '..\..\..\..\..\..\..\..\DB\QuadroCadastro.pas' {FormCadastro},
  QuadroPesquisa1 in 'QuadroPesquisa1.pas' {QuadroPesquisa},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Locadora in '..\Locadora\Locadora.pas' {formPrinci1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrinc, FormPrinc);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TQuadroPesquisa, QuadroPesquisa);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TformPrinci1, formPrinci1);
  Application.Run;
end.
