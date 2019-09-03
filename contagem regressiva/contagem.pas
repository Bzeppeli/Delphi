unit contagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

  var
    contagem : integer;

begin
    contagem:=10;

    while contagem>=0 do
      begin
        showmessage(inttostr(contagem));
        contagem:= contagem -1;
      end;
end;

end.
