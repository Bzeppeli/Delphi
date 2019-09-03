unit exercicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    contfor: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure contforClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.contforClick(Sender: TObject);
var
  cont : array[0..5] of integer;
  I : integer;

begin
  cont[0] := 1;
  cont[1] := 2;
  cont[2] := 3;
  cont[3] := 4;
  cont[4] := 5;

      for I:=4 downto 0 do
        begin
          showmessage(inttostr(cont[i]));
        end;

end;

procedure TForm1.Button1Click(Sender: TObject);

var
  a : integer;

begin
    a :=0;
      while a>=0 do
      begin
        //a := a +1;
        if(a mod 2) = 1  then
          showmessage(inttostr(a))
           //a := a + 1
          else if (a mod 2) = 0 then
              a:= a+1;
              showmessage(inttostr(a))
       end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i : integer;
  //a : array[0..10] of integer;
begin

  for i:=0 to 10 do
    begin
      if(i mod 2) = 1 then
      showmessage(inttostr(i));
    end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
   a : integer;
begin
  a:= 0;
  while a <= 10 do
    begin
    if (a mod 2) = 1 then
      showmessage(inttostr(a));
      a:= a+1;
     end;
end;

procedure TForm1.Button4Click(Sender: TObject);

const
final= 10;

var
  inicial : integer;

begin
   inicial := -1;

    repeat
      inicial:= inicial+1;
      if (inicial mod 2) = 1 then
        showmessage(inttostr(inicial));
      until inicial = final;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i : integer;
begin
    for i:=0 to 10 do
    begin
      if(i mod 2) = 1 then
      showmessage(inttostr(i))
       else if i=5 then
        break;
    end;
end;

end.
