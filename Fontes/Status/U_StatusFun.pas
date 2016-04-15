unit U_StatusFun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoSTAT, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, Provider, DB,
  DBClient, RzRadChk;

type
  TFrmStatusFun = class(TFrmObjetoSTA)
    Label1: TLabel;
    LblCODINICIAL: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSFUN: TDataSource;
    CDSFUN: TClientDataSet;
    CDSFUNIDFUNCIONARIO: TIntegerField;
    CDSFUNNOME_FUN: TStringField;
    CDSFUNCPF_FUN: TStringField;
    CDSFUNRG_FUN: TStringField;
    CDSFUNCART_FUN: TStringField;
    CDSFUNDTANASC_FUN: TDateField;
    CDSFUNCOMP_FUN: TStringField;
    CDSFUNEMAIL_FUN: TStringField;
    CDSFUNSEXO_FUN: TStringField;
    CDSFUNFONE1_FUN: TStringField;
    CDSFUNFONE2_FUN: TStringField;
    CDSFUNOBS_FUN: TStringField;
    CDSFUNSTATUS_FUN: TStringField;
    PROVIDER: TDataSetProvider;
    SQLFUN: TSQLDataSet;
    SQLFUNIDFUNCIONARIO: TIntegerField;
    SQLFUNNOME_FUN: TStringField;
    SQLFUNCPF_FUN: TStringField;
    SQLFUNRG_FUN: TStringField;
    SQLFUNCART_FUN: TStringField;
    SQLFUNDTANASC_FUN: TDateField;
    SQLFUNCOMP_FUN: TStringField;
    SQLFUNEMAIL_FUN: TStringField;
    SQLFUNSEXO_FUN: TStringField;
    SQLFUNFONE1_FUN: TStringField;
    SQLFUNFONE2_FUN: TStringField;
    SQLFUNOBS_FUN: TStringField;
    SQLFUNSTATUS_FUN: TStringField;
    CheckCod: TRzCheckBox;
    CheckNome: TRzCheckBox;
    CheckCPF: TRzCheckBox;
    CheckRG: TRzCheckBox;
    CheckCART: TRzCheckBox;
    CPFBUS: TRzEdit;
    Label4: TLabel;
    Label5: TLabel;
    RGBUS: TRzEdit;
    NOMEBUS: TRzEdit;
    Label3: TLabel;
    Label6: TLabel;
    CARTTBUS: TRzEdit;
    procedure CheckCodClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
    procedure CheckCPFClick(Sender: TObject);
    procedure CheckRGClick(Sender: TObject);
    procedure CheckCARTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatusFun: TFrmStatusFun;

implementation

{$R *.dfm}

procedure TFrmStatusFun.CheckCodClick(Sender: TObject);
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

procedure TFrmStatusFun.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND FUNCIONARIOS.IDFUNCIONARIO >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND FUNCIONARIOS.IDFUNCIONARIO <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;

    IF (CheckNome.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND FUNCIONARIOS.NOME_FUN >= ' +
                                  QuotedStr(NOMEBUS.Text);
    END;
     IF (CheckCPF.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND FUNCIONARIOS.CPF_FUN >= ' +
                                  QuotedStr(CPFBUS.Text);
    END;

     IF (CheckRG.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND FUNCIONARIOS.RG_FUN >= ' +
                                  QuotedStr(RGBUS.Text);
    END;
     IF (CheckCART.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND FUNCIONARIOS.CART_FUN >= ' +
                                  QuotedStr(CARTTBUS.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY FUNCIONARIOS.IDFUNCIONARIO';
    END;
   
     CASE RGsituacao.ItemIndex OF
      0: SqlFiltro := SqlFiltro + ' AND FUNCIONARIOS.STATUS_FUN = ' + QuotedStr('A');
      1: SqlFiltro := SqlFiltro + ' AND FUNCIONARIOPS.STATUS_FUN = ' + QuotedStr('D');
     END;
    //FIM DA QUESTÃO DO sTATUS


    //MONTANDO A CONSULTA SQL
    CDSFUN.Close;
    SQLFUN.Close;
    SQLFUN.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLFUN.Open;
    CDSFUN.Open;

end;

procedure TFrmStatusFun.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSFUNSTATUS_FUN.AsString = 'A') THEN
    BEGIN
      IF (MessageDlg('Deseja retirar o Funcionario?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
              CDSFUN.edit;
              CDSFUNSTATUS_FUN.Text := 'C';
              CDSFUN.Post;
              CDSFUN.ApplyUpdates(0);
         END;
    END
  ELSE
    BEGIN
      IF (MessageDlg('Deseja reativar o Funcionario ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
         BEGIN
            CDSFUN.Edit;
            CDSFUNSTATUS_FUN.AsString := 'A';
            CDSFUN.Post;
            CDSFUN.ApplyUpdates(0);
         END;
                 end;
end;

procedure TFrmStatusFun.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLFUN.CommandText;
end;

procedure TFrmStatusFun.CheckNomeClick(Sender: TObject);
begin
  inherited;
if (CheckNome.Checked) then
     begin
     NOMEBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
       NOMEBUS.Enabled:=true;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmStatusFun.CheckCPFClick(Sender: TObject);
begin
  inherited;
if (CheckCPF.Checked) then
     begin
     CPFBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        CPFBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmStatusFun.CheckRGClick(Sender: TObject);
begin
  inherited;
if (CheckRG.Checked) then
     begin
     RGBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
       RGBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;

end;

procedure TFrmStatusFun.CheckCARTClick(Sender: TObject);
begin
  inherited;
if (CheckCART.Checked) then
     begin
     CARTTBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        CARTTBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

end.
