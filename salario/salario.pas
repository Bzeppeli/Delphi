unit salario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormprin = class(TForm)
    salario: TButton;
    procedure salarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formprin: TFormprin;

implementation

{$R *.dfm}

procedure TFormprin.salarioClick(Sender: TObject);
  const
    salariomensal = 937;
    tributomensal = salariomensal*10/100;
   var
    rendanual : double;

begin
    rendanual := tributomensal*12;
    showmessage(');
end;

end.
