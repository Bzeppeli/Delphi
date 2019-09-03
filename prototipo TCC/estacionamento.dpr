program estacionamento;

uses
  Forms,
  formprincipal in 'formprincipal.pas' {Form1},
  form_cadastro in 'form_cadastro.pas' {FormCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.Run;
end.
