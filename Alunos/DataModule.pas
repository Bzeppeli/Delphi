unit DataModule;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBTable;

type
  TDataModule1 = class(TDataModule)
    DataCadastro: TDataSource;
    IBTabelaAluno: TIBTable;
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
