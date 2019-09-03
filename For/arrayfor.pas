unit arrayfor;

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
  nomes : array[0..4] of string;
  I : integer;

begin
    nomes[0] := 'joão';
    nomes[1] := 'maria';
    nomes[2] := 'jose';
    nomes[3] := 'fernanda';
    nomes[4] := 'alice';

    for i :=0 to 4 do
      begin
        showmessage(nomes[i]);
      end;
end;

end.
