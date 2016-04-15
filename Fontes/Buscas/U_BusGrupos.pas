unit U_BusGrupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, FMTBcd, SqlExpr, Provider, DB, DBClient, ExtCtrls,
  ComCtrls, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp, RzPanel,
  StdCtrls, Mask, RzEdit, RzRadChk;

type
  TFrmBusGrup = class(TFrmObjetoBUS)
    DSGru: TDataSource;
    CDSGru: TClientDataSet;
    CDSGruIDGRUPO: TIntegerField;
    CDSGruNOME_GRU: TStringField;
    CDSGruDESC_GRU: TStringField;
    CDSGruSTATUS_GRU: TStringField;
    PROVIDER: TDataSetProvider;
    SQLGru: TSQLDataSet;
    SQLGruIDGRUPO: TIntegerField;
    SQLGruNOME_GRU: TStringField;
    SQLGruDESC_GRU: TStringField;
    SQLGruSTATUS_GRU: TStringField;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    LblCODINICIAL: TLabel;
    Label1: TLabel;
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
  FrmBusGrup: TFrmBusGrup;

implementation

uses U_CadGrupo;

{$R *.dfm}

procedure TFrmBusGrup.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND GRUPOS.IDGRUPO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND GRUPOS.IDGRUPO <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY GRUPOS.IDGRUPO';
      1: SqlOrdem := ' ORDER BY GRUPOS.NOME_GRU';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND GRUPOS.STATUS_GRU = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND GRUPOS.STATUS_GRU = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSGru.Close;
    SQLGru.Close;
    SQLGru.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLGru.Open;
    CDSGru.Open;

end;

procedure TFrmBusGrup.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSGruSTATUS_GRU.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'CONDICOES') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadGrup.SQLGru.ParamByName('PARGRUPO').AsInteger := CDSGruIDGRUPO.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
end;

procedure TFrmBusGrup.CheckCodClick(Sender: TObject);
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

procedure TFrmBusGrup.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLGru.CommandText;
end;

end.
