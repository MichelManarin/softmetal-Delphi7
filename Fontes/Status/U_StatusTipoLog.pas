unit U_StatusTipoLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, ExtCtrls, Grids, DBGrids, RzDBGrid, RzPanel,
  RzRadGrp, RzButton, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls,
  Mask, RzEdit, RzRadChk;

type
  TFrmStatusTipoLog = class(TFrmObjetoSTA)
    SQLTL: TSQLDataSet;
    SQLTLIDTIPOLOG: TIntegerField;
    SQLTLNOME_LOG: TStringField;
    SQLTLSTATUS_LOG: TStringField;
    PROVIDER: TDataSetProvider;
    CDSTL: TClientDataSet;
    CDSTLIDTIPOLOG: TIntegerField;
    CDSTLNOME_LOG: TStringField;
    CDSTLSTATUS_LOG: TStringField;
    DSTL: TDataSource;
    PANDADOS: TPanel;
    Label1: TLabel;
    LblCODINICIAL: TLabel;
    RzRadioGroup1: TRzRadioGroup;
    RzRadioGroup2: TRzRadioGroup;
    RzCheckGroup1: TRzCheckGroup;
    CheckCod: TRzCheckBox;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    CODINICIAL: TRzEdit;
    CODFINAL: TRzEdit;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusTipoLog: TFrmStatusTipoLog;

implementation

{$R *.dfm}

procedure TFrmStatusTipoLog.RzBitBtn2Click(Sender: TObject);
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

procedure TFrmStatusTipoLog.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial:=SQLTL.CommandText;
end;

procedure TFrmStatusTipoLog.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSTLSTATUS_LOG.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o Tipo Logradouro?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSTL.Edit;
              CDSTLSTATUS_LOG.Text := 'C';
              CDSTL.Post;
              CDSTL.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o Tipo Logradouro ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSTL.Edit;
            CDSTLSTATUS_LOG.AsString := 'A';
            CDSTL.Post;
            CDSTL.ApplyUpdates(0);
         END;
                 end;
end;

procedure TFrmStatusTipoLog.CheckCodClick(Sender: TObject);
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
