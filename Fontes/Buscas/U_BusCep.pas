unit U_BusCep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, ComCtrls, RzRadChk;

type
  TFrmBusCep = class(TFrmObjetoBUS)
    LblCODINICIAL: TLabel;
    NAMEBUS: TRzEdit;
    Label2: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    TLbus: TRzEdit;
    LOUbus: TRzEdit;
    Label3: TLabel;
    Label4: TLabel;
    CheckCod: TRzCheckBox;
    CheckCep: TRzCheckBox;
    CheckLo: TRzCheckBox;
    SQLCEP: TSQLDataSet;
    PROVIDER: TDataSetProvider;
    CDSCEP: TClientDataSet;
    DSCEP: TDataSource;
    SQLCEPIDCEP_CEP: TIntegerField;
    SQLCEPCEP_CEP: TStringField;
    SQLCEPLOG_CEP: TStringField;
    SQLCEPSTATUS_CEP: TStringField;
    CDSCEPIDCEP_CEP: TIntegerField;
    CDSCEPCEP_CEP: TStringField;
    CDSCEPLOG_CEP: TStringField;
    CDSCEPSTATUS_CEP: TStringField;
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
  FrmBusCep: TFrmBusCep;

implementation

uses U_CadCep, U_CadFornecedor;

{$R *.dfm}

procedure TFrmBusCep.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND CEPS.IDCEP_CEP >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CEPS.IDCEP_CEP <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;
     IF (CheckCep.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CEPS.CEP_CEP = ' +
                                  QuotedStr(NAMEBUS.Text);

    END;
    IF (CheckLo.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CEPS.LOG_CEP >= ' +
                                  QuotedStr(LOUbus.Text);

    END;



    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CEPS.IDCEP_CEP';
      1: SqlOrdem := ' ORDER BY CEPS.CEP_CEP';
      2: SqlOrdem := ' ORDER BY CEPS.LOG_CEP';
    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CEPS.STATUS_CEP = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CEPS.STATUS_CEP = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCEP.Close;
    SQLCEP.Close;
    SQLCEP.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCEP.Open;
    CDSCEP.Open;

end;

procedure TFrmBusCep.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCEP.CommandText;
end;

procedure TFrmBusCep.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCEPSTATUS_CEP.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'CEPS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadCep.SQLCeps.ParamByName('PARCEP').AsInteger := CDSCEPIDCEP_CEP.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
       IF (QuemChama = 'BTNFORN') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadForn.SQLFornecedores.ParamByName('PARFORNECEDOR').AsInteger := CDSCEPIDCEP_CEP.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
end;

procedure TFrmBusCep.CheckCodClick(Sender: TObject);
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
