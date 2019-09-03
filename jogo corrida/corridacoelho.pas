unit corridacoelho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TFormCorrida = class(TForm)
    pnCorrida: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Lblresultado: TLabel;
    Label5: TLabel;
    LblNumeroJogadas: TLabel;
    Label7: TLabel;
    Lblnumeroacertos: TLabel;
    Label9: TLabel;
    Lblnumeroerros: TLabel;
    Imagecarro1: TImage;
    imagemcarro2: TImage;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCorrida: TFormCorrida;
  aposta, contacerto,conterro,cont : integer;

implementation

{$R *.dfm}

procedure TFormCorrida.FormCreate(Sender: TObject);
begin
cont:=0;
contacerto:=0;
Lblnumeroacertos.Caption:= inttostr(contacerto);
Lblnumeroerros.caption:=inttostr(conterro);
LblNumeroJogadas.Caption:=inttostr(cont);
timer1.enabled:=false;
end;

procedure TFormCorrida.Button1Click(Sender: TObject);
begin
 imagecarro1.left:=118;
 imagemcarro2.Left:=188;
 cont:= cont +1;
 LblNumeroJogadas.caption := intToStr(cont);
 aposta:=strtoint(InputBox('',' qual voce acha que vai ganhar? digite 1 para azul e 2 para vermelho',''));
 timer1.Enabled:= true;

end;

procedure TFormCorrida.Timer1Timer(Sender: TObject);
var pos1,pos2:integer;
begin

        Randomize;
        pos1:= randomrange(1, 50);
        Randomize;
        pos2 := randomrange(1,50);
        imagecarro1.left:=imagecarro1.Left+pos1;
        imagemcarro2.left:=imagemcarro2.Left+pos2;
        if (imagecarro1.Left>=560) then
                begin
                    Lblresultado.caption:= ' azul!!!!!!!';
                    if aposta =1 then
                        contacerto:=contacerto+1
                        else
                         contaerro:= contaerro+1;
                    timer1.enabled:=false;
                        end
                else if (imagemcarro2.left>=560) then
                 begin
                  Lblresultado.Caption:= 'vermelho!!!!';
                  if aposta=2 then
                   contacerto:=contacerto+1;
                  else
                   contaerro= contaerro+1;
                  timer1.enabled:=false;
                 end;
                 Lblnumeroacertos.caption:= inttostr(contacerto);
                 Lblnumeroerros.caption:=inttostr(contaerro);


end;

procedure TFormCorrida.Button2Click(Sender: TObject);
begin
cont:=0;
contacerto:=0;
contaerro:=0;
Lblnumeroacertos.caption:= inttostr(contacerto);
Lblnumeroerros.caption:= inttostr(contaerro);
LblNumeroJogadas.Caption:=inttostr(cont);
end;

end.
