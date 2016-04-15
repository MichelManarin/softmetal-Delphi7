unit U_BusFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, StdCtrls, SqlExpr, Provider, DB, DBClient,
  Mask, RzEdit, ComCtrls, RzRadChk;

type
  TFrmBusFun = class(TFrmObjetoBUS)
    DSFUN: TDataSource;
    CDSFUN: TClientDataSet;
    CDSFUNIDFUNCIONARIO: TIntegerField;
    CDSFUNNOME_FUN: TStringField;
    CDSFUNCPF_FUN: TStringField;
    CDSFUNRG_FUN: TStringField;
    CDSFUNCART_FUN: TStringField;
    CDSFUNDTANASC_FUN: TDateField;
    CDSFUNCOMP_FUN: TStringField;
    CDSFUNEMAIL_FUN: TStringField;
    CDSFUNSEXO_FUN: TStringField;
    CDSFUNFONE1_FUN: TStringField;
    CDSFUNFONE2_FUN: TStringField;
    CDSFUNOBS_FUN: TStringField;
    CDSFUNSTATUS_FUN: TStringField;
    PROVIDER: TDataSetProvider;
    SQLFUN: TSQLDataSet;
    SQLFUNIDFUNCIONARIO: TIntegerField;
    SQLFUNNOME_FUN: TStringField;
    SQLFUNCPF_FUN: TStringField;
    SQLFUNRG_FUN: TStringField;
    SQLFUNCART_FUN: TStringField;
    SQLFUNDTANASC_FUN: TDateField;
    SQLFUNCOMP_FUN: TStringField;
    SQLFUNEMAIL_FUN: TStringField;
    SQLFUNSEXO_FUN: TStringField;
    SQLFUNFONE1_FUN: TStringField;
    SQLFUNFONE2_FUN: TStringField;
    SQLFUNOBS_FUN: TStringField;
    SQLFUNSTATUS_FUN: TStringField;
    CODFINAL: TRzEdit;
    NOMEBUS: TRzEdit;
    CODINICIAL: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CPFBUS: TRzEdit;
    Label4: TLabel;
    RGBUS: TRzEdit;
    Label5: TLabel;
    CARTTBUS: TRzEdit;
    Label6: TLabel;
    CheckCod: TRzCheckBox;
    CheckNome: TRzCheckBox;
    CheckCPF: TRzCheckBox;
    CheckRG: TRzCheckBox;
    CheckCART: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
    procedure CheckCPFClick(Sender: TObject);
    procedure CheckRGClick(Sender: TObject);
    procedure CheckCARTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusFun: TFrmBusFun;

implementation

uses U_CadFuncionario;

{$R *.dfm}

procedure TFrmBusFun.BtnBuscarClick(Sender: TObject);
begin
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
      SqlFiltro :=  SqlFiltro +' AND FUNCIONARIOS.IDFUNCIONARIO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND FUNCIONARIOS.IDFUNCIONARIO <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY FUNCIONARIOS.IDFUNCIONARIO';
      1: SqlOrdem := ' ORDER BY FUNCIONARIOS.NOME_FUN';
      2: SqlOrdem := ' ORDER BY FUNCIONARIOS.DTANASC_FUN';
      3: SqlOrdem := ' ORDER BY FUNCIONARIOS.SEXO_FUN';
    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND FUNCIONARIOS.STATUS_FUN = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND AND FUNCIONARIOS.STATUS_FUN = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSFUN.Close;
    CDSFUN.Close;
    SQLFUN.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLFUN.Open;
    CDSFUN.Open;
end;

procedure TFrmBusFun.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLFUN.CommandText;
end;

procedure TFrmBusFun.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSFUNSTATUS_FUN.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'BAIRROS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadFun.SQLFUN.ParamByName('PARFUNCIONARIO').AsInteger := CDSFUNIDFUNCIONARIO.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
end;

procedure TFrmBusFun.CheckCodClick(Sender: TObject);
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

procedure TFrmBusFun.CheckNomeClick(Sender: TObject);
begin
  inherited;
if (CheckNome.Checked) then
     begin
     NOMEBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
       NOMEBUS.Enabled:=true;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmBusFun.CheckCPFClick(Sender: TObject);
begin
  inherited;
if (CheckCPF.Checked) then
     begin
     CPFBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        CPFBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmBusFun.CheckRGClick(Sender: TObject);
begin
  inherited;
  if (CheckRG.Checked) then
     begin
     RGBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
       RGBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;

end;

procedure TFrmBusFun.CheckCARTClick(Sender: TObject);
begin
  inherited;
if (CheckCART.Checked) then
     begin
     CARTTBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        CARTTBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
