program Exemplo_preencher;

uses
  Forms,
  Form_Principal in 'Form_Principal.pas' {Form1},
  Form_Relatorio in 'Form_Relatorio.pas' {FormRelatorio},
  Form_Cadastro in 'Form_Cadastro.pas' {FormCadastro},
  Form_Consulta in 'Form_Consulta.pas' {FormConsulta};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormRelatorio, FormRelatorio);
  Application.CreateForm(TFormCadastro, FormCadastro);
  Application.CreateForm(TFormConsulta, FormConsulta);
  Application.Run;
end.
