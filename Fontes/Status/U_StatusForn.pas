unit U_StatusForn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient;

type
  TFrmStatusForn = class(TFrmObjetoSTA)
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    CheckCod: TCheckBox;
    DSFORN: TDataSource;
    CDSFORN: TClientDataSet;
    CDSFORNIDFORNECEDOR: TIntegerField;
    CDSFORNRS_FORN: TStringField;
    CDSFORNNOMEFAN_FORN: TStringField;
    CDSFORNIE_FORN: TStringField;
    CDSFORNCNPJ_FORNE: TStringField;
    CDSFORNCPF_FORNE: TStringField;
    CDSFORNRG_FORNE: TStringField;
    CDSFORNTEL_FORN: TStringField;
    CDSFORNCELULAR_FORN: TStringField;
    CDSFORNEMAIL_FORN: TStringField;
    CDSFORNFAX_FORN: TStringField;
    CDSFORNHOMEPAGE_FORN: TStringField;
    CDSFORNCONTATO_FORN: TStringField;
    CDSFORNCOMPLE_FORN: TStringField;
    CDSFORNSTATUS_FORN: TStringField;
    PROVIDER: TDataSetProvider;
    SQLFORN: TSQLDataSet;
    SQLFORNIDFORNECEDOR: TIntegerField;
    SQLFORNRS_FORN: TStringField;
    SQLFORNNOMEFAN_FORN: TStringField;
    SQLFORNIE_FORN: TStringField;
    SQLFORNCNPJ_FORNE: TStringField;
    SQLFORNCPF_FORNE: TStringField;
    SQLFORNRG_FORNE: TStringField;
    SQLFORNTEL_FORN: TStringField;
    SQLFORNCELULAR_FORN: TStringField;
    SQLFORNEMAIL_FORN: TStringField;
    SQLFORNFAX_FORN: TStringField;
    SQLFORNHOMEPAGE_FORN: TStringField;
    SQLFORNCONTATO_FORN: TStringField;
    SQLFORNCOMPLE_FORN: TStringField;
    SQLFORNSTATUS_FORN: TStringField;
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
  FrmStatusForn: TFrmStatusForn;

implementation

{$R *.dfm}

procedure TFrmStatusForn.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND FORNECEDORES.IDFORNECEDOR >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND FORNECEDORES.IDFORNECEDOR <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY FORNECEDORES.IDFORNECEDOR';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND FORNECEDORES.STATUS_FORN = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND FORNECEDORES.STATUS_FORN = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSFORN.Close;
    SQLFORN.Close;
    SQLFORN.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLFORN.Open;
    CDSFORN.Open;

end;

procedure TFrmStatusForn.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSFORNSTATUS_FORN.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o Fornecedor?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSFORN.edit;
              CDSFORNSTATUS_FORN.Text := 'C';
              CDSFORN.Post;
              CDSFORN.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o Fornecedor ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSFORN.Edit;
            CDSFORNSTATUS_FORN.AsString := 'A';
            CDSFORN.Post;
            CDSFORN.ApplyUpdates(0);
         END;
                 end;
end;

procedure TFrmStatusForn.CheckCodClick(Sender: TObject);
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
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmStatusForn.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLFORN.CommandText;
end;

end.
