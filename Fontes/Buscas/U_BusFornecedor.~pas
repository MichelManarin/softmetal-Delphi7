unit U_BusFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, FMTBcd, SqlExpr, Provider, DB, DBClient, StdCtrls,
  Mask, RzEdit, ComCtrls, RzRadChk, RpRender, RpRenderPDF, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave;

type
  TFrmBusForn = class(TFrmObjetoBUS)
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
    NOMEFANBUS: TRzEdit;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ISBUS: TRzEdit;
    CheckCOD: TRzCheckBox;
    CheckDes: TRzCheckBox;
    CheckNP: TRzCheckBox;
    RvForn: TRvProject;
    RVSForn: TRvSystem;
    RVDS: TRvDataSetConnection;
    RvRenderPDF1: TRvRenderPDF;
    procedure BtnBuscarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckDesClick(Sender: TObject);
    procedure CheckNPClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusForn: TFrmBusForn;

implementation

uses U_CadFornecedor;

{$R *.dfm}

procedure TFrmBusForn.BtnBuscarClick(Sender: TObject);
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
      SqlFiltro :=  SqlFiltro +' AND FORNECEDORES.IDFORNECEDOR >= ' +
                                  QuotedStr(CODINICIAL.Text)    +
                                '  AND FORNECEDORES.IDFORNECEDOR <=  ' +
                                  QuotedStr(CODFINAL.Text);
    END;

     IF (CheckDes.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND FORNECEDORES.NOMEFAN_FORN = ' +
                                  QuotedStr(NOMEFANBUS.Text);
    END;
    IF (CheckNP.Checked ) THEN
    BEGIN
      SqlFiltro :=  SqlFiltro +' AND FORNECEDORES.IE_FORN = ' +
                                  QuotedStr(ISBUS.Text);
    END;


    CASE RGordenar.ItemIndex OF
      0: SqlOrdem := ' ORDER BY FORNECEDORES.IDFORNECEDOR';
      1: SqlOrdem := ' ORDER BY FORNECEDORES.NOMEFAN_FORN';
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

procedure TFrmBusForn.GridDblClick(Sender: TObject);
begin
  inherited;
IF (CDSFORNSTATUS_FORN.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'BAIRROS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadForn.SQLFornecedores.ParamByName('PARFORNECEDOR').AsInteger := CDSFORNIDFORNECEDOR.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
 

end;

procedure TFrmBusForn.CheckCodClick(Sender: TObject);
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

procedure TFrmBusForn.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLFORN.CommandText;
end;

procedure TFrmBusForn.CheckDesClick(Sender: TObject);
begin
  inherited;
if (CheckDes.Checked) then
     begin
     NOMEFANBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        NOMEFANBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;
end;

procedure TFrmBusForn.CheckNPClick(Sender: TObject);
begin
  inherited;
  if (CheckNP.Checked) then
     begin
     ISBUS.Enabled:= True;
     BtnBuscar.Enabled:= true;
     end
     else
      begin
        ISBUS.Enabled:= false;
        BtnBuscar.Enabled:= false;
       end;

end;

procedure TFrmBusForn.BtnImprimirClick(Sender: TObject);
var
caminho: STRING;
begin

if (CDSFORN.Active) and (CDSFORN.RecordCount > 0) then
      begin
        if (MessageDlg('Selecione "Yes" para o Modo Gráfico ou "No" para o modo Texto !',mtConfirmation,[mbyes,mbno],0) = mryes) then
          begin

              IF (MessageDlg('Deseja Imprimir o Relatório em Modo Simplificado ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
                BEGIN
        RvForn.Close;
                    caminho:= ExtractFilePath(Application.ExeName) + '\Relatórios\Relforn.rav';
                    RvForn.ProjectFile := caminho;
                    RvForn.Open;
                    RvForn.Execute;
                END
              ELSE
                BEGIN
                    RvForn.Close;
                    caminho:= ExtractFilePath(Application.ExeName) + '\Relatórios\Relforndet.rav';
                    RvForn.ProjectFile := caminho;
                    RvForn.Open;
                    RvForn.Execute;
                END;
          end
        else
          begin
            //Modo Texto
          end;
      end
    else
     begin
        ShowMessage('Não Existem Clientes para Listar ! ');
       if BtnBuscar.CanFocus then FocusControl(BtnBuscar);
    end;

end;

end.
