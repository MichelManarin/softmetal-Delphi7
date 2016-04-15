unit U_StatusClien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, StdCtrls, SqlExpr, Provider, DB, DBClient,
  Mask, RzEdit, RzRadChk, RpRender, RpRenderPDF, RpCon, RpConDS, RpRave,
  RpDefine, RpBase, RpSystem;

type
  TFrmStatusClien = class(TFrmObjetoSTA)
    CheckCod: TCheckBox;
    DSCLIEN: TDataSource;
    CDSCLIEN: TClientDataSet;
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
    PROVIDER: TDataSetProvider;
    SQLCLIEN: TSQLDataSet;
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
    PANDADOS: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    RzRadioGroup1: TRzRadioGroup;
    RzRadioGroup2: TRzRadioGroup;
    RzCheckGroup1: TRzCheckGroup;
    RzCheckBox1: TRzCheckBox;
    CheckNome: TRzCheckBox;
    CheckDtcad: TRzCheckBox;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    BUSNOME: TRzEdit;
    BUSCDT: TRzEdit;
    SystemClien: TRvSystem;
    RVClien: TRvProject;
    DSCClien: TRvDataSetConnection;
    PDF: TRvRenderPDF;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure RzCheckBox1Click(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusClien: TFrmStatusClien;

implementation

{$R *.dfm}

procedure TFrmStatusClien.RzBitBtn2Click(Sender: TObject);
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
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCLIEN.Close;
    SQLCLIEN.Close;
    SQLCLIEN.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCLIEN.Open;
    CDSCLIEN.Open;

end;

procedure TFrmStatusClien.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCLIEN.CommandText;
end;

procedure TFrmStatusClien.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCLIENSTATUS_CLIEN.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o cliente?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSCLIEN.Edit;
              CDSCLIENSTATUS_CLIEN.Text := 'C';
              CDSCLIEN.Post;
              CDSCLIEN.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o cliente?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSCLIEN.Edit;
            CDSCLIENSTATUS_CLIEN.AsString := 'A';
            CDSCLIEN.Post;
            CDSCLIEN.ApplyUpdates(0);
         END;
                 end;

end;

procedure TFrmStatusClien.RzCheckBox1Click(Sender: TObject);
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

procedure TFrmStatusClien.CheckNomeClick(Sender: TObject);
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

procedure TFrmStatusClien.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
if (CDSCLIEN.Active) and (CDSCLIEN.RecordCount > 0) then
      begin
        if (MessageDlg('Selecione "Yes" para o Modo Gráfico ou "No" para o modo Texto !',mtConfirmation,[mbyes,mbno],0) = mryes) then
          begin

              IF (MessageDlg('Deseja Imprimir o Relatório em Modo Simplificado ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
                BEGIN
                    RVClieN.Close;
                    caminho:= ExtractFilePath(Application.ExeName) + '\Relatórios\Relacli.rav';
                    ShowMessage(caminho);
                    RVClien.ProjectFile := caminho;
                    RVClien.Open;
                    RVClien.Execute;

                END
              ELSE
                BEGIN
                    RVClien.Close;
                    CAMINHO:= ExtractFilePath(Application.ExeName) + '\Relatórios\Relaclidet.rav';
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
        ShowMessage('Não Existem Clientes para Listar ! ');
       if BtnBuscar.CanFocus then FocusControl(BtnBuscar);
    end;

end;

end.
