unit U_BusMaquina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, ComCtrls, RzRadChk;

type
  TFrmBusMaq = class(TFrmObjetoBUS)
    CODFINAL: TRzEdit;
    NSBUS: TRzEdit;
    DESCBUS: TRzEdit;
    CODINICIAL: TRzEdit;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DSMAQ: TDataSource;
    CDSMAQ: TClientDataSet;
    CDSMAQIDMAQUINA: TIntegerField;
    CDSMAQDESC_MAQ: TStringField;
    CDSMAQNUMSERIE_MAQ: TStringField;
    CDSMAQSTATUS_MAQ: TStringField;
    PROVIDER: TDataSetProvider;
    SQLMAQ: TSQLDataSet;
    SQLMAQIDMAQUINA: TIntegerField;
    SQLMAQDESC_MAQ: TStringField;
    SQLMAQNUMSERIE_MAQ: TStringField;
    SQLMAQSTATUS_MAQ: TStringField;
    CheckCod: TRzCheckBox;
    CheckDes: TRzCheckBox;
    CheckNS: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure CheckDesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusMaq: TFrmBusMaq;

implementation

uses U_CadMaquina;

{$R *.dfm}

procedure TFrmBusMaq.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND MAQUINAS.IDMAQUINA >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND MAQUINAS.IDMAQUINA <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY MAQUINAS.IDMAQUINA';
      1: SqlOrdem := ' ORDER BY MAQUINAS.DESC_MAQ';
      3: SqlOrdem := ' ORDER BY MAQUINAS.NUMSERIE_MAQ';

    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND MAQUINAS.STATUS_MAQ = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND MAQUINAS.STATUS_MAQ = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSMAQ.Close;
    SQLMAQ.Close;
    SQLMAQ.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLMAQ.Open;
    CDSMAQ.Open;

end;

procedure TFrmBusMaq.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLMAQ.CommandText;
end;

procedure TFrmBusMaq.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSMAQSTATUS_MAQ.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'MAQUINAS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadMaquinas.SQLMaquinas.ParamByName('PARMAQ').AsInteger := CDSMAQIDMAQUINA.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;

end;

procedure TFrmBusMaq.CheckCodClick(Sender: TObject);
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

procedure TFrmBusMaq.CheckDesClick(Sender: TObject);
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

end.
