unit formprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BCadastro: TButton;
    BConsulta: TButton;
    BSair: TButton;
    procedure BCadastroClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.BCadastroClick(Sender: TObject);
begin
FormCadastro.show;
end;

procedure TForm1.BSairClick(Sender: TObject);
begin
application.terminate;
end;

end.
