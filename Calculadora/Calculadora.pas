unit Calculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Display: TEdit;
    B1: TButton;
    B2: TButton;
    B3: TButton;
    B4: TButton;
    B5: TButton;
    B6: TButton;
    B7: TButton;
    B8: TButton;
    B9: TButton;
    B10: TButton;
    B11: TButton;
    B12: TButton;
    B13: TButton;
    B14: TButton;
    B15: TButton;
    B16: TButton;
    B17: TButton;
    B18: TButton;
    B19: TButton;
    procedure B10Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure B3Click(Sender: TObject);
    procedure B4Click(Sender: TObject);
    procedure B5Click(Sender: TObject);
    procedure B6Click(Sender: TObject);
    procedure B7Click(Sender: TObject);
    procedure B8Click(Sender: TObject);
    procedure B9Click(Sender: TObject);
    procedure B11Click(Sender: TObject);
    procedure B12Click(Sender: TObject);
    procedure B13Click(Sender: TObject);
    procedure B14Click(Sender: TObject);
    procedure B15Click(Sender: TObject);
    procedure B16Click(Sender: TObject);
    procedure B18Click(Sender: TObject);
    procedure B17Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  valor1: integer;
  valor2 : integer;
  funcap : integer;

implementation

{$R *.dfm}

procedure TForm1.B10Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B10).Caption
end;

procedure TForm1.B1Click(Sender: TObject);
begin
 Display.Text := Display.Text + (Sender as B1).Caption
end;

procedure TForm1.B2Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B2).Caption
end;

procedure TForm1.B3Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B3).Caption
end;

procedure TForm1.B4Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B4).Caption
end;

procedure TForm1.B5Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B5).Caption
end;

procedure TForm1.B6Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B6).Caption
end;

procedure TForm1.B7Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B7).Caption
end;

procedure TForm1.B8Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B8).Caption
end;

procedure TForm1.B9Click(Sender: TObject);
begin
Display.Text := Display.Text + (Sender as B9).Caption
end;

procedure TForm1.B11Click(Sender: TObject);
begin
  valor1 := StrToFloat(Display.Text);
  Display.Text := '';
  funcao := 1;
end;

procedure TForm1.B12Click(Sender: TObject);
begin
  valor1 := StrToFloat(Display.Text);
  Display.Text := '';
  funcao := 2;
end;

procedure TForm1.B13Click(Sender: TObject);
begin
  valor1 := StrToFloat(Display.Text);
  Display.Text := '';
  funcao := 3;
end;

procedure TForm1.B14Click(Sender: TObject);
begin
  valor1 := StrToFloat(Display.Text);
  Display.Text := '';
  funcao := 4;
end;

procedure TForm1.B15Click(Sender: TObject);
begin
  Display.Text:='-'+Display.Text;
end;

procedure TForm1.B16Click(Sender: TObject);
begin
valor1 := StrToFloat(Display.Text);
  Display.Text := '';
  funcao := 2;
end;

procedure TForm1.B18Click(Sender: TObject);
begin
Display.Text:='';
end;

procedure TForm1.B17Click(Sender: TObject);
begin
var
  soma: real;
begin
  valor2:=StrToFloat(Display.Text);
  case (funcao) of
  1:
  begin
    soma:=valor1+valor2;
    Display.text:=FloatToStr(soma);
  end;
  2:
  begin
    soma:=valor1-valor2;
    Display.text:=FloatToStr(soma);
  end;
  3:
  begin
    soma:=valor1*valor2;
    Display.text:=FloatToStr(soma);
  end;
  4:
  begin
    if(valor2<>0)then
      begin
        soma:=valor1/valor2;
        Display.text:=FloatToStr(soma);
      end
    else
      begin
        SHowMessage('Divisão por zero!!');
        Display.Text:='ERRO';
      end
    end
end;
end;

end.
