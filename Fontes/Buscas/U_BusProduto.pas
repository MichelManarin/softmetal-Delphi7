unit U_BusProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, SqlExpr, Provider, DB, DBClient, StdCtrls,
  Mask, RzEdit, ComCtrls, RzRadChk;

type
  TFrmBusProd = class(TFrmObjetoBUS)
    DSPRO: TDataSource;
    CDSPRO: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLPRO: TSQLDataSet;
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    SQLPROIDPRODUTOFIN: TIntegerField;
    SQLPROPRECOCUSTO_PRODF: TBCDField;
    SQLPROPRECOMIN_PRODF: TBCDField;
    SQLPROPRECOMED_PRODF: TBCDField;
    SQLPROPRECOMAX_PRODF: TBCDField;
    SQLPRODESC_PRODF: TStringField;
    SQLPROOBS_PRODF: TStringField;
    SQLPROSTATUS_PRODF: TStringField;
    CDSPROIDPRODUTOFIN: TIntegerField;
    CDSPROPRECOCUSTO_PRODF: TBCDField;
    CDSPROPRECOMIN_PRODF: TBCDField;
    CDSPROPRECOMED_PRODF: TBCDField;
    CDSPROPRECOMAX_PRODF: TBCDField;
    CDSPRODESC_PRODF: TStringField;
    CDSPROOBS_PRODF: TStringField;
    CDSPROSTATUS_PRODF: TStringField;
    CheckCod: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusProd: TFrmBusProd;

implementation

uses U_CadProduto;

{$R *.dfm}

procedure TFrmBusProd.BtnBuscarClick(Sender: TObject);
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
    CDSPRO.Close;
    SQLPRO.Close;
    SQLPRO.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLPRO.Open;
    CDSPRO.Open;

end;

procedure TFrmBusProd.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSPROSTATUS_PRODF.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'BAIRROS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadProd.SQLPRO.ParamByName('PARPRODUTO').AsInteger := CDSPROIDPRODUTOFIN.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
end;

procedure TFrmBusProd.CheckCodClick(Sender: TObject);
begin
  inherited;
if (CheckCOD.Checked) then
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

procedure TFrmBusProd.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLPRO.CommandText;
end;

end.
