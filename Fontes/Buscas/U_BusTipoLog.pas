unit U_BusTipoLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, ExtCtrls, ComCtrls, Grids, DBGrids, RzDBGrid,
  RzButton, RzRadGrp, RzPanel, FMTBcd, SqlExpr, Provider, DB, DBClient,
  StdCtrls, Mask, RzEdit, RzRadChk;

type
  TFrmBusTipoLog = class(TFrmObjetoBUS)
    DSTL: TDataSource;
    CDSTL: TClientDataSet;
    CDSTLIDTIPOLOG: TIntegerField;
    CDSTLNOME_LOG: TStringField;
    CDSTLSTATUS_LOG: TStringField;
    PROVIDER: TDataSetProvider;
    SQLTL: TSQLDataSet;
    SQLTLIDTIPOLOG: TIntegerField;
    SQLTLNOME_LOG: TStringField;
    SQLTLSTATUS_LOG: TStringField;
    CheckCod: TRzCheckBox;
    CODINICIAL: TRzEdit;
    CODFINAL: TRzEdit;
    Label1: TLabel;
    LblCODINICIAL: TLabel;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusTipoLog: TFrmBusTipoLog;

implementation

uses U_CadTipoLog;

{$R *.dfm}

procedure TFrmBusTipoLog.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND TIPOLOG.IDTIPOLOG >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND TIPOLOG.IDTIPOLOG <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY TIPOLOG.IDTIPOLOG';
    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND TIPOLOG.STATUS_LOG = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND TIPOLOG.STATUS_LOG = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSTL.Close;
    SQLTL.Close;
    SQLTL.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLTL.Open;
    CDSTL.Open;
end;

procedure TFrmBusTipoLog.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial:=SQLTL.CommandText;
end;

procedure TFrmBusTipoLog.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSTLSTATUS_LOG.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'BAIRROS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadTipoLog.SQLTL.ParamByName('PARTIPOLOG').AsInteger := CDSTLIDTIPOLOG.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
end;

procedure TFrmBusTipoLog.CheckCodClick(Sender: TObject);
begin
  inherited;
if (CheckCod.Checked) then
     begin
     CODFINAL.Enabled:= True;
     CODINICIAL.Enabled:= true;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        CODINICIAL.Enabled:= false;
        CODFINAL.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
