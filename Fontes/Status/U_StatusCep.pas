unit U_StatusCep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, StdCtrls, Mask, RzEdit, Grids, DBGrids, RzDBGrid,
  RzButton, RzRadGrp, RzPanel, ExtCtrls, FMTBcd, SqlExpr, Provider, DB,
  DBClient, RzRadChk;

type
  TFrmStatusCep = class(TFrmObjetoSTA)
    CheckCod: TRzCheckBox;
    PANDADOS: TPanel;
    LblCODINICIAL: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RzRadioGroup1: TRzRadioGroup;
    RzRadioGroup2: TRzRadioGroup;
    RzCheckGroup1: TRzCheckGroup;
    RzCheckBox1: TRzCheckBox;
    CheckCep: TRzCheckBox;
    CheckLo: TRzCheckBox;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    NAMEBUS: TRzEdit;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    TLbus: TRzEdit;
    LOUbus: TRzEdit;
    SQLCEP: TSQLDataSet;
    SQLCEPIDCEP_CEP: TIntegerField;
    SQLCEPCEP_CEP: TStringField;
    SQLCEPLOG_CEP: TStringField;
    SQLCEPIDBAIRRO: TIntegerField;
    SQLCEPIDCIDADE: TIntegerField;
    SQLCEPSTATUS_CEP: TStringField;
    PROVIDER: TDataSetProvider;
    CDSCEP: TClientDataSet;
    CDSCEPIDCEP_CEP: TIntegerField;
    CDSCEPCEP_CEP: TStringField;
    CDSCEPLOG_CEP: TStringField;
    CDSCEPIDBAIRRO: TIntegerField;
    CDSCEPIDCIDADE: TIntegerField;
    CDSCEPSTATUS_CEP: TStringField;
    DSCEP: TDataSource;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusCep: TFrmStatusCep;

implementation

{$R *.dfm}

procedure TFrmStatusCep.RzBitBtn2Click(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND CEPS.IDCEP_CEP >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND CEPS.IDCEP_CEP <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;
     IF (CheckCep.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CEPS.CEP_CEP = ' +
                                  QuotedStr(NAMEBUS.Text);

    END;
    IF (CheckLo.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND CEPS.LOG_CEP >= ' +
                                  QuotedStr(LOUbus.Text);

    END;



    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY CEPS.IDCEP_CEP';
      1: SqlOrdem := ' ORDER BY CEPS.CEP_CEP';
      2: SqlOrdem := ' ORDER BY CEPS.LOG_CEP';
    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND CEPS.STATUS_CEP = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND CEPS.STATUS_CEP = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSCEP.Close;
    SQLCEP.Close;
    SQLCEP.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLCEP.Open;
    CDSCEP.Open;

end;

procedure TFrmStatusCep.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLCEP.CommandText;
end;

procedure TFrmStatusCep.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSCEPSTATUS_CEP.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o Bairro?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSCEP.Edit;
              CDSCEPSTATUS_CEP.Text := 'C';
              CDSCEP.Post;
              CDSCEP.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o Bairro ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSCEP.Edit;
            CDSCEPSTATUS_CEP.AsString := 'A';
            CDSCEP.Post;
            CDSCEP.ApplyUpdates(0);
         END;
                 end;
end;

end.
