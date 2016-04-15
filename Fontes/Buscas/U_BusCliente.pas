unit U_BusCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, SqlExpr, Provider, DB, DBClient, StdCtrls,
  Mask, RzEdit, ComCtrls, RzRadChk, RpRender, RpRenderPDF, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave;

type
  TFrmBusClien = class(TFrmObjetoBUS)
    Label3: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSCLIEN: TDataSource;
    CDSCLIEN: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLCLIEN: TSQLDataSet;
    CheckCod: TRzCheckBox;
    SQLCLIENIDCLIENTE: TIntegerField;
    SQLCLIENRS_CLIEN: TStringField;
    SQLCLIENNOMEFAN_CLIEN: TStringField;
    SQLCLIENCPF_CLIEN: TStringField;
    SQLCLIENCNPJ_CLIEN: TStringField;
    SQLCLIENIE_CLIEN: TStringField;
    SQLCLIENRG_CLIEN: TStringField;
    SQLCLIENTELRES_CLIEN: TStringField;
    SQLCLIENTELCEL_CLIEN: TStringField;
    SQLCLIENDTANASC_CLIEN: TDateField;
    SQLCLIENCOMPLEMENTO_CLIEN: TStringField;
    SQLCLIENEMAIL_CLIEN: TStringField;
    SQLCLIENFAX_CLIEN: TStringField;
    SQLCLIENTELCOM_CLIEN: TStringField;
    SQLCLIENSEXO_CLIEN: TStringField;
    SQLCLIENDTCAD_CLIEN: TDateField;
    SQLCLIENOBS_CLIEN: TStringField;
    SQLCLIENSTATUS_CLIEN: TStringField;
    CDSCLIENIDCLIENTE: TIntegerField;
    CDSCLIENRS_CLIEN: TStringField;
    CDSCLIENNOMEFAN_CLIEN: TStringField;
    CDSCLIENCPF_CLIEN: TStringField;
    CDSCLIENCNPJ_CLIEN: TStringField;
    CDSCLIENIE_CLIEN: TStringField;
    CDSCLIENRG_CLIEN: TStringField;
    CDSCLIENTELRES_CLIEN: TStringField;
    CDSCLIENTELCEL_CLIEN: TStringField;
    CDSCLIENDTANASC_CLIEN: TDateField;
    CDSCLIENCOMPLEMENTO_CLIEN: TStringField;
    CDSCLIENEMAIL_CLIEN: TStringField;
    CDSCLIENFAX_CLIEN: TStringField;
    CDSCLIENTELCOM_CLIEN: TStringField;
    CDSCLIENSEXO_CLIEN: TStringField;
    CDSCLIENDTCAD_CLIEN: TDateField;
    CDSCLIENOBS_CLIEN: TStringField;
    CDSCLIENSTATUS_CLIEN: TStringField;
    CheckNome: TRzCheckBox;
    CheckDtcad: TRzCheckBox;
    BUSNOME: TRzEdit;
    BUSCDT: TRzEdit;
    Label2: TLabel;
    Label4: TLabel;
    RVClien: TRvProject;
    SystemClien: TRvSystem;
    DSCClien: TRvDataSetConnection;
    PDF: TRvRenderPDF;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusClien: TFrmBusClien;

implementation

uses U_CadClientes, UObjetoINI;

{$R *.dfm}

procedure TFrmBusClien.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND CLIENTES.IDCLIENTE >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CLIENTES.IDCLIENTE <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;
     IF (CheckNome.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CLIENTES.NOMEFAN_CLIEN = ' +
                                  QuotedStr(BUSNOME.Text);

    END;
    IF (CheckDtcad.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CLIENTES.DTANASC_CLIEN >= ' +
                                  QuotedStr(BUSCDT.Text);

    END;



    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CLIENTES.IDCLIENTE';
      1: SqlOrdem := ' ORDER BY CLIENTES.NOMEFAN_CLIEN';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CLIENTES.STATUS_CLIEN = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CLIENTES.STATUS_CLIEN = ' + QuotedStr('D');
     END;
    //FIM DA QUEST�O DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCLIEN.Close;
    SQLCLIEN.Close;
    SQLCLIEN.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCLIEN.Open;
    CDSCLIEN.Open;

end;

procedure TFrmBusClien.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCLIEN.CommandText;
end;

procedure TFrmBusClien.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCLIENSTATUS_CLIEN.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE EST� ATIVO
    BEGIN
      IF (QuemChama = 'BAIRROS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadClien.SQLCLIEN.ParamByName('PARCLIENTE').AsInteger := CDSCLIENIDCLIENTE.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
end;

procedure TFrmBusClien.BtnImprimirClick(Sender: TObject);
var
caminho: STRING;
begin



if (CDSCLIEN.Active) and (CDSCLIEN.RecordCount > 0) then
      begin
        if (MessageDlg('Selecione "Yes" para o Modo Gr�fico ou "No" para o modo Texto !',mtConfirmation,[mbyes,mbno],0) = mryes) then
          begin

              IF (MessageDlg('Deseja Imprimir o Relat�rio em Modo Simplificado ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
                BEGIN
                    RVClien.Close;
                    caminho:= ExtractFilePath(Application.ExeName) + '\Relat�rios\Relacli.rav';
                    ShowMessage(caminho);
                    RVClien.ProjectFile := caminho;
                    RVClien.Open;
                    RVClien.Execute;

                END
              ELSE
                BEGIN
                    RVClien.Close;
                    CAMINHO:= ExtractFilePath(Application.ExeName) + '\Relat�rios\Relaclidet.rav';
                    RVClien.ProjectFile := caminho;
                    RVClien.Open;
                    RVClien.Execute;

                END;
          end
        else
          begin
            //Modo Texto
          end;
      end
    else
     begin
        ShowMessage('N�o Existem Clientes para Listar ! ');
       if BtnBuscar.CanFocus then FocusControl(BtnBuscar);
    end;

end;

procedure TFrmBusClien.CheckCodClick(Sender: TObject);
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

procedure TFrmBusClien.CheckNomeClick(Sender: TObject);
begin
  inherited;
if (CheckNome.Checked) then
     begin
     BUSNOME.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        BUSNOME.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
