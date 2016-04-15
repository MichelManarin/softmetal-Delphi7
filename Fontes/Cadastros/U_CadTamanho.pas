unit U_CadTamanho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient;

type
  TFrmCadTam = class(TFrmObjetoCAD)
    DSTAM: TDataSource;
    CDSTAM: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLTAM: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTam: TFrmCadTam;

implementation

{$R *.dfm}

end.
