unit QuadroCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBTable, IBDatabase,
  ExtCtrls, DBCtrls, StdCtrls;

type
  TFormCadastro = class(TForm)
    DBGrid1: TDBGrid;
    IBTabelaAluno: TIBTable;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    Label1: TLabel;
    CadastroEditNome: TEdit;
    Label2: TLabel;
    CadastroNascimentoEdit: TEdit;
    Label3: TLabel;
    CadastroNota1Edit: TEdit;
    Label4: TLabel;
    CadastroNota2Edit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

end.
