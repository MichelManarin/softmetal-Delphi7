unit U_StatusManu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, SqlExpr, Provider, DB, DBClient, StdCtrls,
  Mask, RzEdit, RzRadChk;

type
  TFrmStatusManun = class(TFrmObjetoSTA)
    DSMAN: TDataSource;
    CDSMAN: TClientDataSet;
    CDSMANIDMANUNTENCAO: TIntegerField;
    CDSMANIDMAQUINA: TIntegerField;
    CDSMANIDFUNCIONARIO: TIntegerField;
    CDSMANDESC_MANU: TStringField;
    CDSMANTIPO_MANU: TStringField;
    CDSMANDT_MANU: TDateField;
    CDSMANHR_MANU: TTimeField;
    CDSMANOBS_MANU: TStringField;
    CDSMANSTATUS_MANU: TStringField;
    PROVIDER: TDataSetProvider;
    SQLMAN: TSQLDataSet;
    SQLMANIDMANUNTENCAO: TIntegerField;
    SQLMANIDMAQUINA: TIntegerField;
    SQLMANIDFUNCIONARIO: TIntegerField;
    SQLMANDESC_MANU: TStringField;
    SQLMANTIPO_MANU: TStringField;
    SQLMANDT_MANU: TDateField;
    SQLMANHR_MANU: TTimeField;
    SQLMANOBS_MANU: TStringField;
    SQLMANSTATUS_MANU: TStringField;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    Label3: TLabel;
    Label1: TLabel;
    CheckCod: TRzCheckBox;
    procedure BtnBuscarClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusManun: TFrmStatusManun;

implementation

{$R *.dfm}

procedure TFrmStatusManun.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND MANUNTENCAO.IDMANUNTENCAO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND MANUNTENCAO.IDMANUNTENCAO <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY MANUNTENCAO.IDMANUNTENCAO';
      1: SqlOrdem := ' ORDER BY MANUNTENCAO.DESC_MANU';
      3: SqlOrdem := ' ORDER BY MANUNTENCAO.HR_MANU';
      4: SqlOrdem := ' ORDER BY MANUNTENCAO.DT_MANU';

    END;

     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND MANUNTENCAO.STATUS_MANU = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND MANUNTENCAO.STATUS_MANU = ' + QuotedStr('D');
     END;
    



    //MONTANDO A CONSULTA SQL
    CDSMAN.Close;
    SQLMAN.Close;
    SQLMAN.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLMAN.Open;
    CDSMAN.Open;

end;

procedure TFrmStatusManun.CheckCodClick(Sender: TObject);
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

procedure TFrmStatusManun.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSMANSTATUS_MANU.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar a manuntenção?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSMAN.Edit;
              CDSMANSTATUS_MANU.Text := 'C';
              CDSMAN.Post;
              CDSMAN.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar a manuntenção?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSMAN.Edit;
            CDSMANSTATUS_MANU.AsString := 'A';
            CDSMAN.Post;
            CDSMAN.ApplyUpdates(0);
         END;
                 end;

end;

procedure TFrmStatusManun.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial:=SQLMAN.CommandText;
end;

end.
