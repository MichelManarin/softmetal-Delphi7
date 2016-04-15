unit U_StatusCarg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, RzRadChk;

type
  TFrmStatusCar = class(TFrmObjetoSTA)
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSCARG: TDataSource;
    CDSCARG: TClientDataSet;
    CDSCARGIDCARGO: TIntegerField;
    CDSCARGNOME_CARGO: TStringField;
    CDSCARGSTATUS_CARGO: TStringField;
    PROVIDER: TDataSetProvider;
    SQLCARG: TSQLDataSet;
    SQLCARGIDCARGO: TIntegerField;
    SQLCARGNOME_CARGO: TStringField;
    SQLCARGSTATUS_CARGO: TStringField;
    CheckCod: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCODClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusCar: TFrmStatusCar;

implementation

{$R *.dfm}

procedure TFrmStatusCar.BtnBuscarClick(Sender: TObject);
begin
  inherited;
IF (CheckCOD.Checked ) THEN
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
      SqlFiltro :=  SqlFiltro +' AND CARGOS.IDCARGO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CARGOS.IDCARGO <=  ' +
                                  QuotedStr(CODFINAL.Text);
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
    CDSCARG.Close;
    SQLCARG.Close;
    SQLCARG.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCARG.Open;
    CDSCARG.Open;

end;

procedure TFrmStatusCar.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCARGSTATUS_CARGO.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o cargo?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSCARG.Edit;
              CDSCARGSTATUS_CARGO.Text := 'C';
              CDSCARG.Post;
              CDSCARG.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o cargo ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSCARG.Edit;
            CDSCARGSTATUS_CARGO.AsString := 'A';
            CDSCARG.Post;
            CDSCARG.ApplyUpdates(0);
         END;
                 end;

end;

procedure TFrmStatusCar.CheckCODClick(Sender: TObject);
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

procedure TFrmStatusCar.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCARG.CommandText;
end;

end.
