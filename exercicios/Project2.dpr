program Project2;

uses
  Forms,
  exercicios in 'exercicios.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
