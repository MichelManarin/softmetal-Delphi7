unit UDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd;

type
  TDM = class(TDataModule)
    conexao: TSQLConnection;
    SqlAuxiliar: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
