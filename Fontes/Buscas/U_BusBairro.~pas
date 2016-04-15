unit U_BusBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoBUS, Grids, DBGrids, RzDBGrid, RzButton, RzRadGrp,
  RzPanel, ExtCtrls, StdCtrls, Mask, RzEdit, FMTBcd, SqlExpr, DB, DBClient,
  Provider, RzRadChk, ComCtrls, RpRender, RpRenderPDF, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave;

type
  TFrmBusBairros = class(TFrmObjetoBUS)
    LblCODINICIAL: TLabel;
    NOME: TRzEdit;
    Label2: TLabel;
    Label1: TLabel;
    CODFINAL: TRzEdit;
    CODINICIAL: TRzEdit;
    DSBairros: TDataSource;
    PROVIDER: TDataSetProvider;
    CDSBairros: TClientDataSet;
    CDSBairrosIDBAIRRO: TIntegerField;
    CDSBairrosNOME_BAIRRO: TStringField;
    CDSBairrosSTATUS_BAIRRO: TStringField;
    SQLBairros: TSQLDataSet;
    SQLBairrosIDBAIRRO: TIntegerField;
    SQLBairrosNOME_BAIRRO: TStringField;
    SQLBairrosSTATUS_BAIRRO: TStringField;
    CheckCod: TRzCheckBox;
    CheckNome: TRzCheckBox;
    RvDataSetConnection1: TRvDataSetConnection;
    RvProject1: TRvProject;
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CheckCodClick(Sender: TObject);
    procedure CheckNomeClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBusBairros: TFrmBusBairros;

implementation

uses U_CadBairro;

{$R *.dfm}

procedure TFrmBusBairros.BtnBuscarClick(Sender: TObject);
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
    CDSBairros.Close;
    SQLBairros.Close;
    SQLBairros.CommandText := SqlInicial + SqlFiltro + SqlOrdem;
    SQLBairros.Open;
    CDSBairros.Open;

    IF CDSBairros.RecordCount = 0 THEN
       begin
            ShowMessage('Nenhum Bairro Encontrado');
             IF (CheckCod.Checked) THEN  FocusControl(CODINICIAL) ELSE
                BEGIN
               IF  (CheckNome.Checked) THEN
               FocusControl(NOME);
                END;
       end;
end;

procedure TFrmBusBairros.FormCreate(Sender: TObject);
begin
  inherited;
SqlInicial := SQLBairros.CommandText;
end;

procedure TFrmBusBairros.GridDblClick(Sender: TObject);
begin
 IF (CDSBairrosSTATUS_BAIRRO.AsString = 'A') THEN //VERIFICANDO SE O CLIENTE ESTÁ ATIVO
    BEGIN
      IF (QuemChama = 'BAIRROS') THEN
        BEGIN
           //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadBairros.SQLBairros.ParamByName('PARBAIRRO').AsInteger := CDSBairrosIDBAIRRO.AsInteger;
           CLOSE;
        END
      ELSE IF (QUEMCHAMA = 'NOTAFISCAL') THEN
        BEGIN
            ///RETORNAR PARA O FORM DE NF

        END;
    END;
    end;
procedure TFrmBusBairros.CheckCodClick(Sender: TObject);
begin


     {   IF (CheckCod.Checked) and (CheckNome.Checked) THEN
            BEGIN
             CODINICIAL.Enabled:= True;
             CODFINAL.Enabled:= True;
             NOME.Enabled:= true;
             BtnBuscar.Enabled:= true;
             BtnImprimir.Enabled:= true;
            END

              else
                begin }
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

            //  end


end;

procedure TFrmBusBairros.CheckNomeClick(Sender: TObject);
begin

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

procedure TFrmBusBairros.BtnImprimirClick(Sender: TObject);
begin
  inherited;
              IF (MessageDlg('Deseja realmente imprimir relatorio ?',mtConfirmation,[MBYES,MBNO],0) = MRYES) THEN
                BEGIN
                    RvProject1.Close;
                    caminho:= ExtractFilePath(Application.ExeName) + '\Relatórios\Relbair.rav';
                    ShowMessage(caminho);
                    RvProject1.ProjectFile := caminho;
                    RvProject1.Open;
                    RvProject1.Execute;

              END;

end;

end.
