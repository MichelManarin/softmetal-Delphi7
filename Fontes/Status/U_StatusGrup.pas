unit U_StatusGrup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, ExtCtrls, RzPanel, Grids, DBGrids, RzDBGrid,
  RzButton, RzRadGrp, FMTBcd, DB, SqlExpr, Provider, DBClient, StdCtrls,
  Mask, RzEdit, RzRadChk;

type
  TFrmStatusGrup = class(TFrmObjetoSTA)
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
    DSGru: TDataSource;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CheckCod: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusGrup: TFrmStatusGrup;

implementation

{$R *.dfm}

procedure TFrmStatusGrup.BtnBuscarClick(Sender: TObject);
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

procedure TFrmStatusGrup.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSGruSTATUS_GRU.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o grupo?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSGru.Edit;
              CDSGruSTATUS_GRU.Text := 'C';
              CDSGru.Post;
              CDSGru.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o grupo ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSGru.Edit;
            CDSGruSTATUS_GRU.AsString := 'A';
            CDSGru.Post;
            CDSGru.ApplyUpdates(0);
         END;
                 end;
end;

procedure TFrmStatusGrup.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLGru.CommandText;
end;

procedure TFrmStatusGrup.CheckCodClick(Sender: TObject);
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
