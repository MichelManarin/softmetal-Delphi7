unit U_BusCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, ComCtrls, RzRadChk;

type
  TFrmBusCid = class(TFrmObjetoBUS)
    NAMEBUS: TRzEdit;
    LblCODINICIAL: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    CODINICIAL: TRzEdit;
    CODFINAL: TRzEdit;
    Label3: TLabel;
    UFBUS: TRzEdit;
    DSCID: TDataSource;
    CDSCID: TClientDataSet;
    CDSCIDIDCIDADE: TIntegerField;
    CDSCIDNOME_CID: TStringField;
    CDSCIDUF_CID: TStringField;
    CDSCIDSTATUS_CID: TStringField;
    PROVIDER: TDataSetProvider;
    SQLCID: TSQLDataSet;
    SQLCIDIDCIDADE: TIntegerField;
    SQLCIDNOME_CID: TStringField;
    SQLCIDUF_CID: TStringField;
    SQLCIDSTATUS_CID: TStringField;
    CheckCod: TRzCheckBox;
    CheckNome: TRzCheckBox;
    CheckUF: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
    procedure CheckUFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusCid: TFrmBusCid;

implementation

uses U_CadCidade;

{$R *.dfm}

procedure TFrmBusCid.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND CIDADES.IDCIDADE >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CIDADES.IDCIDADE <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;
     IF (CheckNome.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CIDADES.NOME_CID = ' +
                                  QuotedStr(NAMEBUS.Text);

    END;
    IF (CheckUF.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CIDADES.UF_CID >= ' +
                                  QuotedStr(UFBUS.Text);

    END;



    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CIDADES.IDCIDADE';
      1: SqlOrdem := ' ORDER BY CIDADES.NOME_CID';
      3: SqlOrdem := ' ORDER BY CIDADES.UF_CID';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CIDADES.STATUS_CID = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CIDADES.STATUS_CID = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCID.Close;
    SQLCID.Close;
    SQLCID.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCID.Open;
    CDSCID.Open;

end;

procedure TFrmBusCid.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCIDSTATUS_CID.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'CIDADES') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadCidades.SQLCidades.ParamByName('PARCIDADE').AsInteger := CDSCIDIDCIDADE.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
end;

procedure TFrmBusCid.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCID.CommandText;
end;

procedure TFrmBusCid.CheckCodClick(Sender: TObject);
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

procedure TFrmBusCid.CheckNomeClick(Sender: TObject);
begin
  inherited;
 if (CheckNome.Checked) then
     begin
     BtnBuscar.Enabled:= true;
     NAMEBUS.Enabled:= true;
     end
     else
      begin
        NAMEBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmBusCid.CheckUFClick(Sender: TObject);
begin
  inherited;
if (CheckUF.Checked) then
     begin
     UFBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        UFBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
