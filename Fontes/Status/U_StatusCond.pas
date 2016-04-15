unit U_StatusCond;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, RzRadChk;

type
  TFrmStatusCond = class(TFrmObjetoSTA)
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSCOND: TDataSource;
    CDSCOND: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLCOND: TSQLDataSet;
    SQLCONDIDCONDI_COND: TIntegerField;
    SQLCONDDESCRI_COND: TStringField;
    SQLCONDNUMPAR_COND: TIntegerField;
    SQLCONDDIASPRI_COND: TIntegerField;
    SQLCONDDIASENTRE_COND: TIntegerField;
    SQLCONDPERJUROS_COND: TBCDField;
    SQLCONDOBS_COND: TStringField;
    SQLCONDSTATUS_COND: TStringField;
    CDSCONDIDCONDI_COND: TIntegerField;
    CDSCONDDESCRI_COND: TStringField;
    CDSCONDNUMPAR_COND: TIntegerField;
    CDSCONDDIASPRI_COND: TIntegerField;
    CDSCONDDIASENTRE_COND: TIntegerField;
    CDSCONDPERJUROS_COND: TBCDField;
    CDSCONDOBS_COND: TStringField;
    CDSCONDSTATUS_COND: TStringField;
    CheckCOd: TRzCheckBox;
    procedure CheckCodClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusCond: TFrmStatusCond;

implementation

{$R *.dfm}

procedure TFrmStatusCond.CheckCodClick(Sender: TObject);
begin
  inherited;
if (CheckCOd.Checked) then
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

procedure TFrmStatusCond.BtnBuscarClick(Sender: TObject);
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
  SqlFiltro := ' WHERE 1=1 ';

  IF (CheckCod.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CONDICOES.IDCONDI_COND >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CONDICOES.IDCONDI_COND <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CONDICOES.IDCONDI_COND';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CONDICOES.STATUS_COND = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CONDICOES.STATUS_COND = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCOND.Close;
    SQLCOND.Close;
    SQLCOND.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCOND.Open;
    CDSCOND.Open;

end;

procedure TFrmStatusCond.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCONDSTATUS_COND.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar a condição?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSCOND.Edit;
              CDSCONDSTATUS_COND.Text := 'C';
              CDSCOND.Post;
              CDSCOND.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar a condição ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSCOND.Edit;
            CDSCONDSTATUS_COND.AsString := 'A';
            CDSCOND.Post;
            CDSCOND.ApplyUpdates(0);
         END;
                 end;
end;

procedure TFrmStatusCond.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCOND.CommandText;
end;

end.
