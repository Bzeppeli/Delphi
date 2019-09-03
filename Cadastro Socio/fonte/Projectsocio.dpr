program Projectsocio;

uses
  Forms,
  proj.socio in '..\proj.socio.pas' {Formprincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormprincipal, Formprincipal);
  Application.Run;
end.
