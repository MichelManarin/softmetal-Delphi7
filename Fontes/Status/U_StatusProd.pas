unit U_StatusProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, StdCtrls, Mask, RzEdit, SqlExpr, Provider, DB,
  DBClient, RzRadChk;

type
  TFrmStatusProd = class(TFrmObjetoSTA)
    DSPRO: TDataSource;
    CDSPRO: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLPRO: TSQLDataSet;
    CODFINAL: TRzEdit;
    Label1: TLabel;
    LblCODINICIAL: TLabel;
    CODINICIAL: TRzEdit;
    CheckCod: TRzCheckBox;
    SQLPROIDPRODUTOFIN: TIntegerField;
    SQLPROPRECOCUSTO_PRODF: TBCDField;
    SQLPROPRECOMIN_PRODF: TBCDField;
    SQLPROPRECOMED_PRODF: TBCDField;
    SQLPROPRECOMAX_PRODF: TBCDField;
    SQLPRODESC_PRODF: TStringField;
    SQLPROCODBARRA_PRODF: TStringField;
    SQLPROQTDMIN_PRODF: TBCDField;
    SQLPROQTDMAX_PRODF: TBCDField;
    SQLPROQTDEST_PRODF: TIntegerField;
    SQLPROTAMANHO_PRODF: TStringField;
    SQLPROOBS_PRODF: TStringField;
    SQLPROSTATUS_PRODF: TStringField;
    CDSPROIDPRODUTOFIN: TIntegerField;
    CDSPROPRECOCUSTO_PRODF: TBCDField;
    CDSPROPRECOMIN_PRODF: TBCDField;
    CDSPROPRECOMED_PRODF: TBCDField;
    CDSPROPRECOMAX_PRODF: TBCDField;
    CDSPRODESC_PRODF: TStringField;
    CDSPROCODBARRA_PRODF: TStringField;
    CDSPROQTDMIN_PRODF: TBCDField;
    CDSPROQTDMAX_PRODF: TBCDField;
    CDSPROQTDEST_PRODF: TIntegerField;
    CDSPROTAMANHO_PRODF: TStringField;
    CDSPROOBS_PRODF: TStringField;
    CDSPROSTATUS_PRODF: TStringField;
    procedure CheckCodClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusProd: TFrmStatusProd;

implementation

{$R *.dfm}

procedure TFrmStatusProd.CheckCodClick(Sender: TObject);
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

procedure TFrmStatusProd.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSPROSTATUS_PRODF.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o produto?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSPRO.Edit;
              CDSPROSTATUS_PRODF.Text := 'C';
              CDSPRO.Post;
              CDSPRO.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o produto?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSPRO.Edit;
              CDSPROSTATUS_PRODF.Text := 'A';
              CDSPRO.Post;
              CDSPRO.ApplyUpdates(0);
         END;
                 end;


end;

procedure TFrmStatusProd.BtnBuscarClick(Sender: TObject);
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

procedure TFrmStatusProd.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial:=SQLPRO.CommandText;
end;

end.
