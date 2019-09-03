unit olamundo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    media: TButton;
    procedure Button1Click(Sender: TObject);
    procedure mediaClick(Sender: TObject);
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
begin
Showmessage('vai se lasca');
end;

procedure TForm1.mediaClick(Sender: TObject);
const
  Medianota = 7;
  Mediaexame = 5;

var
  nota1 : Integer;
  nota2 : Integer;
  nota3 : Integer;
  soma : Integer;
  media : Double;



begin
nota1 := 7;
nota2 := 6;
nota3 := 10;

media := (nota1+nota2+nota3)/3;

  if(media > Medianota) then
      showmessage('aprovado')
    else
      Showmessage('reprovado');



end;

end.

