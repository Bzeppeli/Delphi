program Projectbasic;

uses
  Forms,
  basic in 'basic.pas' {FormPrincipalBasic},
  Unit1 in '..\quadro de funcionarios\Unit1.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipalBasic, FormPrincipalBasic);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
