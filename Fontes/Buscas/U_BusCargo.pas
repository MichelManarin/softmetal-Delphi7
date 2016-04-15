unit U_BusCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, ComCtrls, RzRadChk, RpDefine, RpCon, RpConDS;

type
  TFrmBusCargos = class(TFrmObjetoBUS)
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    NOME: TRzEdit;
    LblCODINICIAL: TLabel;
    CheckCOD: TRzCheckBox;
    CheckNome: TRzCheckBox;
    SQLCargos: TSQLDataSet;
    SQLCargosIDCARGO: TIntegerField;
    SQLCargosNOME_CARGO: TStringField;
    SQLCargosSTATUS_CARGO: TStringField;
    PROVIDER: TDataSetProvider;
    CDSCargos: TClientDataSet;
    CDSCargosIDCARGO: TIntegerField;
    CDSCargosNOME_CARGO: TStringField;
    CDSCargosSTATUS_CARGO: TStringField;
    DSCargos: TDataSource;
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckCODClick(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
    procedure CODINICIALKeyPress(Sender: TObject; var Key: Char);
    procedure CODFINALKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusCargos: TFrmBusCargos;

implementation

uses U_CadCargo, U_CadFuncionario;

{$R *.dfm}

procedure TFrmBusCargos.BtnBuscarClick(Sender: TObject);
begin
  inherited;
IF (CheckCOD.Checked ) THEN
          begin
                if (CODINICIAL.Text='' ) then  CODINICIAL.Text:= '1';
                if (CODFINAL.Text='' ) then  CODFINAL.Text:= '999';
           end;
  //Montando a filtragem
  Sqlfiltro := ' WHERE 1=1 ';

  IF (CheckCod.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CARGOS.IDCARGO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CARGOS.IDCARGO <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;
       IF (CheckNome.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CARGOS.NOME_CARGO = ' +
                                  QuotedStr(NOME.Text);

    END;

    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CARGOS.IDCARGO';
      1: SqlOrdem := ' ORDER BY CARGOS.NOME_CARGO';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CARGOS.STATUS_CARGO = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CARGOS.STATUS_CARGO = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCargos.Close;
    SQLCargos.Close;
    SQLCargos.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCargos.Open;
    CDSCargos.Open;

        IF CDSCargos.RecordCount = 0 THEN
       begin
            ShowMessage('Nenhum Cargo Encontrado');
             IF (CheckCod.Checked) THEN IF CODINICIAL.CanFocus THEN FocusControl(CODINICIAL) ELSE
                BEGIN
               IF  (CheckNome.Checked) THEN
               FocusControl(NOME);
                END;
       end;


end;

procedure TFrmBusCargos.GridDblClick(Sender: TObject);
begin
  inherited;
 IF (CDSCargosSTATUS_CARGO.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'CARGOS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadCargos.SQLCargos.ParamByName('PARCARGO').AsInteger := CDSCargosIDCARGO.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'FUNCIONARIOS') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF
            FrmCadFun.CDSCARGOSIDCARGO.Text:=('PARCARGO');

        END;
    END;
end;

procedure TFrmBusCargos.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCargos.CommandText;
end;

procedure TFrmBusCargos.CheckCODClick(Sender: TObject);
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
        CODINICIAL.Clear;
        CODFINAL.Clear;
        BtnBuscar.Enabled:= false;
        
       end;

end;

procedure TFrmBusCargos.CheckNomeClick(Sender: TObject);
begin
  inherited;
 if (CheckNome.Checked) then
     begin
     BtnBuscar.Enabled:= true;
     NOME.Enabled:= true;
     end
     else
      begin
        NOME.Enabled:= false;
        NOME.Clear;
        BtnBuscar.Enabled:= false;

       end;

end;

procedure TFrmBusCargos.CODINICIALKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if NOT (key IN ['0'..'9',#8, #13]) then
key := #0;
end;

procedure TFrmBusCargos.CODFINALKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if NOT (key IN ['0'..'9',#8, #13]) then
key := #0;
end;

end.
