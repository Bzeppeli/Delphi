program corridacoelhoproj;

uses
  Forms,
  corridacoelho in 'corridacoelho.pas' {FormCorrida};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCorrida, FormCorrida);
  Application.Run;
end.
