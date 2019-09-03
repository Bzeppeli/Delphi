program ativepassa1;

uses
  Forms,
  p2pativepass in 'p2pativepass.pas' {FormActivPass};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormActivPass, FormActivPass);
  Application.Run;
end.
