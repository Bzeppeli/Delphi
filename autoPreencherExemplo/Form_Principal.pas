unit Form_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BCadastro: TButton;
    BConsulta: TButton;
    BRelatorio: TButton;
    BSair: TButton;
    procedure BCadastroClick(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure BRelatorioClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Form_Consulta, Form_Cadastro, Form_Relatorio;

{$R *.dfm}

procedure TForm1.BCadastroClick(Sender: TObject);
begin
FormCadastro.showmodal;
end;

procedure TForm1.BConsultaClick(Sender: TObject);
begin
FormConsulta.showmodal;
end;

procedure TForm1.BRelatorioClick(Sender: TObject);
begin
FormRelatorio.showmodal;
end;

procedure TForm1.BSairClick(Sender: TObject);
begin
Application.terminate;
end;

end.
