unit U_ListagemVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoLIST, ExtCtrls, ComCtrls, Grids, DBGrids, RzDBGrid,
  RzPanel, FMTBcd, DB, DBClient, Provider, SqlExpr, RzButton, RzRadGrp,
  RzDBRGrp;

type
  TFrmListVendas = class(TFrmObjetoLISTA)
    SQLVen: TSQLDataSet;
    PROVIDER: TDataSetProvider;
    CDSVen: TClientDataSet;
    DSVen: TDataSource;
    SQLVenIDNFVENDA: TIntegerField;
    SQLVenIDCLIENTE: TIntegerField;
    SQLVenIDFUNCIONARIO: TIntegerField;
    SQLVenIDCONDI_COND: TIntegerField;
    SQLVenSERIE_NFV: TStringField;
    SQLVenTIPO_NFV: TStringField;
    SQLVenDATA_NFV: TDateField;
    SQLVenVALOR_NFV: TBCDField;
    SQLVenDTENT_NFV: TDateField;
    SQLVenSTATUS_NFV: TStringField;
    CDSVenIDNFVENDA: TIntegerField;
    CDSVenIDCLIENTE: TIntegerField;
    CDSVenIDFUNCIONARIO: TIntegerField;
    CDSVenIDCONDI_COND: TIntegerField;
    CDSVenSERIE_NFV: TStringField;
    CDSVenTIPO_NFV: TStringField;
    CDSVenDATA_NFV: TDateField;
    CDSVenVALOR_NFV: TBCDField;
    CDSVenDTENT_NFV: TDateField;
    CDSVenSTATUS_NFV: TStringField;
    RGOP: TRzRadioGroup;
    procedure BtnListarTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListVendas: TFrmListVendas;

implementation

uses Math;

{$R *.dfm}

procedure TFrmListVendas.BtnListarTodosClick(Sender: TObject);
begin
  inherited;

CASE RGOP.ItemIndex OF
      0: SqlOrdem := ' ORDER BY NFVENDAS.DATA_NFV DESC';
      1: SqlOrdem := ' ORDER BY NFVENDAS.DATA_NFV ASC';
    END;


    CDSVen.Close;
    SQLVen.Close;
    sql:= SQLVen.CommandText;
    Sqlfinal := sql + SqlOrdem;
    SQLVen.CommandText := Sqlfinal;
    SQLVen.Open;
    CDSVen.Open;

end;

end.
