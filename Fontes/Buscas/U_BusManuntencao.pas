unit U_BusManuntencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, ComCtrls, RzRadChk;

type
  TFrmBusManun = class(TFrmObjetoBUS)
    DTBUS: TRzEdit;
    DESCBUS: TRzEdit;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DSMAN: TDataSource;
    CDSMAN: TClientDataSet;
    CDSMANIDMANUNTENCAO: TIntegerField;
    CDSMANIDMAQUINA: TIntegerField;
    CDSMANIDFUNCIONARIO: TIntegerField;
    CDSMANDESC_MANU: TStringField;
    CDSMANTIPO_MANU: TStringField;
    CDSMANDT_MANU: TDateField;
    CDSMANHR_MANU: TTimeField;
    CDSMANOBS_MANU: TStringField;
    CDSMANSTATUS_MANU: TStringField;
    PROVIDER: TDataSetProvider;
    SQLMAN: TSQLDataSet;
    SQLMANIDMANUNTENCAO: TIntegerField;
    SQLMANIDMAQUINA: TIntegerField;
    SQLMANIDFUNCIONARIO: TIntegerField;
    SQLMANDESC_MANU: TStringField;
    SQLMANTIPO_MANU: TStringField;
    SQLMANDT_MANU: TDateField;
    SQLMANHR_MANU: TTimeField;
    SQLMANOBS_MANU: TStringField;
    SQLMANSTATUS_MANU: TStringField;
    CheckCod: TRzCheckBox;
    CheckDesc: TRzCheckBox;
    CheckData: TRzCheckBox;
    CheckHora: TRzCheckBox;
    BUSHR: TRzEdit;
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckDescClick(Sender: TObject);
    procedure CheckDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusManun: TFrmBusManun;

implementation

uses U_CadManuntencao;

{$R *.dfm}

procedure TFrmBusManun.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND MANUNTENCAO.IDMANUNTENCAO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND MANUNTENCAO.IDMANUNTENCAO <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;

     IF (CheckDesc.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND MANUNTENCAO.DESC_MANU = ' +
                                  QuotedStr(DESCBUS.Text);
    END;
      IF (CheckData.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND MANUNTENCAO.DT_MANU = ' +
                                  QuotedStr(DTBUS.Text);
    END;
      IF (CheckHora.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND MANUNTENCAO.HR_MANU = ' +
                                  QuotedStr(BUSHR.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY MANUNTENCAO.IDMANUNTENCAO';
      1: SqlOrdem := ' ORDER BY MANUNTENCAO.DESC_MANU';
      3: SqlOrdem := ' ORDER BY MANUNTENCAO.HR_MANU';
      4: SqlOrdem := ' ORDER BY MANUNTENCAO.DT_MANU';

    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND MANUNTENCAO.STATUS_MANU = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND MANUNTENCAO.STATUS_MANU = ' + QuotedStr('D');
     END;
    



    //MONTANDO A CONSULTA SQL
    CDSMAN.Close;
    SQLMAN.Close;
    SQLMAN.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLMAN.Open;
    CDSMAN.Open;

end;

procedure TFrmBusManun.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSMANSTATUS_MANU.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'BAIRROS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadManun.SQLManu.ParamByName('PARMANUNTENCAO').AsInteger := CDSMANIDMANUNTENCAO.AsInteger;


            FrmCadManun.HABILITACOMPONENTES;






           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;


end;

procedure TFrmBusManun.CheckCodClick(Sender: TObject);
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

procedure TFrmBusManun.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLMAN.CommandText;
end;

procedure TFrmBusManun.CheckDescClick(Sender: TObject);
begin
  inherited;
if (CheckDesc.Checked) then
     begin
     DESCBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        DESCBUS.Enabled:=true;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmBusManun.CheckDataClick(Sender: TObject);
begin
  inherited;
if (CheckData.Checked) then
     begin
     DTBUS.Enabled:=true;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        DTBUS.Enabled:=false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
