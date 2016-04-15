unit U_StatusMaq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, RzRadChk;

type
  TFrmStatusMaq = class(TFrmObjetoSTA)
    Label3: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSMAQ: TDataSource;
    CDSMAQ: TClientDataSet;
    CDSMAQIDMAQUINA: TIntegerField;
    CDSMAQDESC_MAQ: TStringField;
    CDSMAQNUMSERIE_MAQ: TStringField;
    CDSMAQSTATUS_MAQ: TStringField;
    PROVIDER: TDataSetProvider;
    SQLMAQ: TSQLDataSet;
    SQLMAQIDMAQUINA: TIntegerField;
    SQLMAQDESC_MAQ: TStringField;
    SQLMAQNUMSERIE_MAQ: TStringField;
    SQLMAQSTATUS_MAQ: TStringField;
    CheckCod: TRzCheckBox;
    procedure CheckCodClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusMaq: TFrmStatusMaq;

implementation

{$R *.dfm}

procedure TFrmStatusMaq.CheckCodClick(Sender: TObject);
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

procedure TFrmStatusMaq.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial:=SQLMAQ.CommandText;
end;

procedure TFrmStatusMaq.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND MAQUINAS.IDMAQUINA >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND MAQUINAS.IDMAQUINA <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY MAQUINAS.IDMAQUINA';
      1: SqlOrdem := ' ORDER BY MAQUINAS.DESC_MAQ';
      3: SqlOrdem := ' ORDER BY MAQUINAS.NUMSERIE_MAQ';

    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND MAQUINAS.STATUS_MAQ = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND MAQUINAS.STATUS_MAQ = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSMAQ.Close;
    SQLMAQ.Close;
    SQLMAQ.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLMAQ.Open;
    CDSMAQ.Open;

end;

procedure TFrmStatusMaq.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSMAQSTATUS_MAQ.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar a maquina?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSMAQ.Edit;
              CDSMAQSTATUS_MAQ.Text := 'C';
              CDSMAQ.Post;
              CDSMAQ.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar a maquina?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSMAQ.Edit;
            CDSMAQSTATUS_MAQ.AsString := 'A';
            CDSMAQ.Post;
            CDSMAQ.ApplyUpdates(0);
         END;
                 end;

end;

end.
