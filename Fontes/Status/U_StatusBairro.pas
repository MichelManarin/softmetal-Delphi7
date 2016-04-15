unit U_StatusBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, SqlExpr, Provider, DB, DBClient, StdCtrls,
  Mask, RzEdit, RzRadChk;

type
  TFrmStatusBai = class(TFrmObjetoSTA)
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSBAIR: TDataSource;
    CDSBAIR: TClientDataSet;
    CDSBAIRIDBAIRRO: TIntegerField;
    CDSBAIRNOME_BAIRRO: TStringField;
    CDSBAIRSTATUS_BAIRRO: TStringField;
    PROVIDER: TDataSetProvider;
    SQLBAIR: TSQLDataSet;
    SQLBAIRIDBAIRRO: TIntegerField;
    SQLBAIRNOME_BAIRRO: TStringField;
    SQLBAIRSTATUS_BAIRRO: TStringField;
    NOME: TRzEdit;
    Label2: TLabel;
    CheckCod: TRzCheckBox;
    CheckNome: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusBai: TFrmStatusBai;

implementation

uses Math;

{$R *.dfm}

procedure TFrmStatusBai.BtnBuscarClick(Sender: TObject);
begin
  inherited;
     IF (CheckCod.Checked ) THEN
          begin
                if (CODINICIAL.Text='' ) then     CODINICIAL.Text:= '1';
                if (CODFINAL.Text='' ) then       CODFINAL.Text:= '999';
                end;



  //Montando a filtragem
  Sqlfiltro := ' WHERE 1=1 ';

  IF (CheckCod.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND BAIRROS.IDBAIRRO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND BAIRROS.IDBAIRRO <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;

    IF (CheckNome.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND BAIRROS.NOME_BAIRRO = ' +
                                  QuotedStr(NOME.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY BAIRROS.IDBAIRRO';
      1: SqlOrdem := ' ORDER BY BAIRROS.NOME_BAIRRO';
    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND BAIRROS.STATUS_BAIRRO = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND BAIRROS.STATUS_BAIRRO = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSBAIR.Close;
    SQLBAIR.Close;
    SQLBAIR.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLBAIR.Open;
    CDSBAIR.Open;

    IF CDSBAIR.RecordCount = 0 THEN
       begin
            ShowMessage('Nenhum Bairro Encontrado');
             IF (CheckCod.Checked) THEN  FocusControl(CODINICIAL) ELSE
                BEGIN
               IF  (CheckNome.Checked) THEN
               FocusControl(NOME);
                END;
       end;


end;

procedure TFrmStatusBai.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLBAIR.CommandText;
end;

procedure TFrmStatusBai.CheckCodClick(Sender: TObject);
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

procedure TFrmStatusBai.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSBAIRSTATUS_BAIRRO.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o Bairro?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSBAIR.Edit;
              CDSBAIRSTATUS_BAIRRO.Text := 'C';
              CDSBAIR.Post;
              CDSBAIR.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o Bairro ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSBAIR.Edit;
            CDSBAIRSTATUS_BAIRRO.AsString := 'A';
            CDSBAIR.Post;
            CDSBAIR.ApplyUpdates(0);
         END;
                 end;
end;

procedure TFrmStatusBai.CheckNomeClick(Sender: TObject);
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
          BtnBuscar.Enabled:= false;
        end;
end;

end.
