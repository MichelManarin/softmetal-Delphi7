unit U_StatusCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, StdCtrls, Mask, RzEdit, SqlExpr, Provider, DB,
  DBClient, RzRadChk;

type
  TFrmStatusCid = class(TFrmObjetoSTA)
    DSCID: TDataSource;
    CDSCID: TClientDataSet;
    CDSCIDIDCIDADE: TIntegerField;
    CDSCIDNOME_CID: TStringField;
    CDSCIDUF_CID: TStringField;
    CDSCIDSTATUS_CID: TStringField;
    PROVIDER: TDataSetProvider;
    SQLCID: TSQLDataSet;
    SQLCIDIDCIDADE: TIntegerField;
    SQLCIDNOME_CID: TStringField;
    SQLCIDUF_CID: TStringField;
    SQLCIDSTATUS_CID: TStringField;
    LblCODINICIAL: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    CheckCOD: TRzCheckBox;
    CheckUF: TRzCheckBox;
    CheckNome: TRzCheckBox;
    Label2: TLabel;
    NAMEBUS: TRzEdit;
    UFBUS: TRzEdit;
    Label3: TLabel;
    procedure CheckCodClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
    procedure CheckUFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusCid: TFrmStatusCid;

implementation

{$R *.dfm}

procedure TFrmStatusCid.CheckCodClick(Sender: TObject);
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

procedure TFrmStatusCid.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND CIDADES.IDCIDADE >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CIDADES.IDCIDADE <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CIDADES.IDCIDADE';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CIDADES.STATUS_CID = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CIDADES.STATUS_CID = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCID.Close;
    SQLCID.Close;
    SQLCID.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCID.Open;
    CDSCID.Open;

end;

procedure TFrmStatusCid.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCID.CommandText;
end;

procedure TFrmStatusCid.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCIDSTATUS_CID.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar a cidade?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSCID.Edit;
              CDSCIDSTATUS_CID.Text := 'C';
              CDSCID.Post;
              CDSCID.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar a cidade ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSCID.Edit;
            CDSCIDSTATUS_CID.AsString := 'A';
            CDSCID.Post;
            CDSCID.ApplyUpdates(0);
         END;
                 end;
end;

procedure TFrmStatusCid.CheckNomeClick(Sender: TObject);
begin
  inherited;
 if (CheckNome.Checked) then
     begin
     BtnBuscar.Enabled:= true;
     NAMEBUS.Enabled:= true;
     end
     else
      begin
        NAMEBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmStatusCid.CheckUFClick(Sender: TObject);
begin
  inherited;
if (CheckUF.Checked) then
     begin
     UFBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        UFBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
