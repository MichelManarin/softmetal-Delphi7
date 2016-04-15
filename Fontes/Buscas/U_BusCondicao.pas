unit U_BusCondicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls,
  Mask, RzEdit, ComCtrls, RzRadChk;

type
  TFrmBusCon = class(TFrmObjetoBUS)
    SQLCOND: TSQLDataSet;
    PROVIDER: TDataSetProvider;
    CDSCOND: TClientDataSet;
    DSCOND: TDataSource;
    DESCBUS: TRzEdit;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    PARCBUS: TRzEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    CheckCOD: TRzCheckBox;
    CheckDES: TRzCheckBox;
    CheckNP: TRzCheckBox;
    CDSCONDIDCONDI_COND: TIntegerField;
    CDSCONDDESCRI_COND: TStringField;
    CDSCONDNUMPAR_COND: TIntegerField;
    CDSCONDDIASPRI_COND: TIntegerField;
    CDSCONDDIASENTRE_COND: TIntegerField;
    CDSCONDPERJUROS_COND: TBCDField;
    CDSCONDOBS_COND: TStringField;
    CDSCONDSTATUS_COND: TStringField;
    SQLCONDIDCONDI_COND: TIntegerField;
    SQLCONDDESCRI_COND: TStringField;
    SQLCONDNUMPAR_COND: TIntegerField;
    SQLCONDDIASPRI_COND: TIntegerField;
    SQLCONDDIASENTRE_COND: TIntegerField;
    SQLCONDPERJUROS_COND: TBCDField;
    SQLCONDOBS_COND: TStringField;
    SQLCONDSTATUS_COND: TStringField;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure CheckDesClick(Sender: TObject);
    procedure CheckNPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusCon: TFrmBusCon;

implementation

uses U_CadCondicoes;

{$R *.dfm}

procedure TFrmBusCon.BtnBuscarClick(Sender: TObject);
begin
  inherited;
  //Montando a filtragem
 //Montando a filtragem
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
      SqlFiltro :=  SqlFiltro +' AND CONDICOES.IDCONDI_COND >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CONDICOES.IDCONDI_COND <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CONDICOES.IDCONDI_COND';
      1: SqlOrdem := ' ORDER BY CONDICOES.DESCRI_COND';
      2: SqlOrdem := ' ORDER BY CONDICOES.NUMPAR_COND';
    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CONDICOES.STATUS_COND = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CONDICOES.STATUS_COND = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCOND.Close;
    CDSCOND.Close;
    SQLCOND.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCOND.Open;
    CDSCOND.Open;

end;

procedure TFrmBusCon.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCOND.CommandText;
end;

procedure TFrmBusCon.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCONDSTATUS_COND.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'CONDICOES') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadCondicoes.SQLCOND.ParamByName('PARCONDI').AsInteger := CDSCONDIDCONDI_COND.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
end;

procedure TFrmBusCon.CheckCodClick(Sender: TObject);
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

procedure TFrmBusCon.CheckDesClick(Sender: TObject);
begin
  inherited;
if (CheckDes.Checked) then
     begin
     BtnBuscar.Enabled:= true;
     DESCBUS.Enabled:= true;
     end
     else
      begin
        DESCBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmBusCon.CheckNPClick(Sender: TObject);
begin
  inherited;
if (CheckNP.Checked) then
     begin
     BtnBuscar.Enabled:= true;
     PARCBUS.Enabled:= true;
     end
     else
      begin
      PARCBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
