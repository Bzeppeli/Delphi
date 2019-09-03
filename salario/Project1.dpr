program Project1;

uses
  Forms,
  salario in 'salario.pas' {Formprin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormprin, Formprin);
  Application.Run;
end.
