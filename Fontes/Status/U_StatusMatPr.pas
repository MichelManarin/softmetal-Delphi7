unit U_StatusMatPr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, DB, DBClient,
  Provider, RzRadChk;

type
  TFrmStatusMatPr = class(TFrmObjetoSTA)
    Label3: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSMP: TDataSource;
    PROVIDER: TDataSetProvider;
    CDSMP: TClientDataSet;
    CDSMPIDMATEIAPRIMA: TIntegerField;
    CDSMPPRECODECUSTO_MATP: TBCDField;
    CDSMPDESCRICAO_MATP: TStringField;
    CDSMPQTDMIN_MATP: TIntegerField;
    CDSMPQTDMAX_MATP: TIntegerField;
    CDSMPQTDEST_MATP: TBCDField;
    CDSMPOBS_MATP: TStringField;
    CDSMPSTATUS_MATP: TStringField;
    SQLMP: TSQLDataSet;
    SQLMPIDMATEIAPRIMA: TIntegerField;
    SQLMPPRECODECUSTO_MATP: TBCDField;
    SQLMPDESCRICAO_MATP: TStringField;
    SQLMPQTDMIN_MATP: TIntegerField;
    SQLMPQTDMAX_MATP: TIntegerField;
    SQLMPQTDEST_MATP: TBCDField;
    SQLMPOBS_MATP: TStringField;
    SQLMPSTATUS_MATP: TStringField;
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
  FrmStatusMatPr: TFrmStatusMatPr;

implementation

{$R *.dfm}

procedure TFrmStatusMatPr.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND MATERIA_PRIMA.IDMATEIAPRIMA >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND MATERIA_PRIMA.IDMATEIAPRIMA <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY MATERIA_PRIMA.IDMATEIAPRIMA';

    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND MATERIA_PRIMA.STATUS_MATP= ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND MATERIA_PRIMA.STATUS_MATP = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSMP.Close;
    SQLMP.Close;
    SQLMP.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLMP.Open;
    CDSMP.Open;


end;

procedure TFrmStatusMatPr.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSMPSTATUS_MATP.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar a materia prima?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSMP.Edit;
              CDSMPSTATUS_MATP.Text := 'C';
              CDSMP.Post;
              CDSMP.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar a materia prima?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSMP.Edit;
              CDSMPSTATUS_MATP.Text := 'A';
              CDSMP.Post;
              CDSMP.ApplyUpdates(0);
         END;
                 end;

end;

procedure TFrmStatusMatPr.CheckCodClick(Sender: TObject);
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

procedure TFrmStatusMatPr.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial:=SQLMP.CommandText;
end;

end.
