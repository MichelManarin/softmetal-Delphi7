unit U_StatusProdFin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient;

type
  TFrmStatusProdFin = class(TFrmObjetoSTA)
    CheckCod: TCheckBox;
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSPF: TDataSource;
    CDSPF: TClientDataSet;
    CDSPFIDPRODUTOFIN: TIntegerField;
    CDSPFIDGRUPO: TIntegerField;
    CDSPFPRECOCUSTO_PRODF: TBCDField;
    CDSPFPRECOMIN_PRODF: TBCDField;
    CDSPFPRECOMED_PRODF: TBCDField;
    CDSPFPRECOMAX_PRODF: TBCDField;
    CDSPFDESC_PRODF: TStringField;
    CDSPFCODBARRA_PRODF: TStringField;
    CDSPFQTDMIN_PRODF: TBCDField;
    CDSPFQTDMAX_PRODF: TBCDField;
    CDSPFQTDEST_PRODF: TIntegerField;
    CDSPFTAMANHO_PRODF: TStringField;
    CDSPFOBS_PRODF: TStringField;
    CDSPFSTATUS_PRODF: TStringField;
    PROVIDER: TDataSetProvider;
    SQLPF: TSQLDataSet;
    SQLPFIDPRODUTOFIN: TIntegerField;
    SQLPFIDGRUPO: TIntegerField;
    SQLPFPRECOCUSTO_PRODF: TBCDField;
    SQLPFPRECOMIN_PRODF: TBCDField;
    SQLPFPRECOMED_PRODF: TBCDField;
    SQLPFPRECOMAX_PRODF: TBCDField;
    SQLPFDESC_PRODF: TStringField;
    SQLPFCODBARRA_PRODF: TStringField;
    SQLPFQTDMIN_PRODF: TBCDField;
    SQLPFQTDMAX_PRODF: TBCDField;
    SQLPFQTDEST_PRODF: TIntegerField;
    SQLPFTAMANHO_PRODF: TStringField;
    SQLPFOBS_PRODF: TStringField;
    SQLPFSTATUS_PRODF: TStringField;
    procedure CheckCodClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusProdFin: TFrmStatusProdFin;

implementation

{$R *.dfm}

procedure TFrmStatusProdFin.CheckCodClick(Sender: TObject);
begin
  inherited;
if (CheckCod.Checked) then
     begin
     CODINICIAL.Enabled:= True;
     CODFINAL.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        CODINICIAL.Enabled:= false;
        CODFINAL.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;

end;

procedure TFrmStatusProdFin.BtnBuscarClick(Sender: TObject);
begin
  inherited;
IF (CheckCod.Checked ) THEN
          begin
                if (CODINICIAL.Text='' ) then
                 CODINICIAL.Text:= '1';
                if (CODFINAL.Text='' ) then
                 CODFINAL.Text:= '999';
           end;
  //Montando a filtragem
  Sqlfiltro := ' WHERE 1=1 ';

  IF (CheckCod.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND PRODUTOFINAL.IDPRODUTOFIN >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND PRODUTOFINAL.IDPRODUTOFIN <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY PRODUTOFINAL.IDPRODUTOFIN';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND PRODUTOFINAL.STATUS_PRODF = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND PRODUTOFINAL.STATUS_PRODF = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSPF.Close;
    SQLPF.Close;
    SQLPF.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLPF.Open;
    CDSPF.Open;


end;

procedure TFrmStatusProdFin.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial:=SQLPF.CommandText;
end;

end.
