unit U_CadFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, Mask, RzEdit, RzDBEdit, DBCtrls, RzLabel,
  ComCtrls,Jpeg,ClipBrd, ExtDlgs;

type
  TFrmCadForn = class(TFrmObjetoCAD)
    SQLFornecedores: TSQLDataSet;
    PROVIDER: TDataSetProvider;
    CDSFornecedores: TClientDataSet;
    DSFornecedores: TDataSource;
    Label13: TLabel;
    DBCONTATO: TRzDBEdit;
    Label1: TLabel;
    DBRS: TRzDBEdit;
    Label2: TLabel;
    DBNOMEFAN: TRzDBEdit;
    Label10: TLabel;
    DBCOMPLEMENTO: TRzDBEdit;
    Label14: TLabel;
    DBHOMEPAGE: TRzDBEdit;
    Label12: TLabel;
    DBEMAIL: TRzDBEdit;
    DBTELEFONE: TRzDBEdit;
    Label11: TLabel;
    DBFAX: TRzDBEdit;
    Label8: TLabel;
    DBCPNJ: TRzDBEdit;
    Label5: TLabel;
    DBCPF: TRzDBEdit;
    Label6: TLabel;
    Label4: TLabel;
    DBIE: TRzDBEdit;
    Label7: TLabel;
    DBRG: TRzDBEdit;
    Label9: TLabel;
    DBCELULAR: TRzDBEdit;
    Label3: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBCEP_CEP: TRzDBEdit;
    SQLFornecedoresIDFORNECEDOR: TIntegerField;
    SQLFornecedoresIDCEP_CEP: TIntegerField;
    SQLFornecedoresNOMEFAN_FORN: TStringField;
    SQLFornecedoresCPF_FORNE: TStringField;
    SQLFornecedoresRG_FORNE: TStringField;
    SQLFornecedoresRS_FORN: TStringField;
    SQLFornecedoresIE_FORN: TStringField;
    SQLFornecedoresCNPJ_FORNE: TStringField;
    SQLFornecedoresTEL_FORN: TStringField;
    SQLFornecedoresCELULAR_FORN: TStringField;
    SQLFornecedoresFAX_FORN: TStringField;
    SQLFornecedoresEMAIL_FORN: TStringField;
    SQLFornecedoresCONTATO_FORN: TStringField;
    SQLFornecedoresHOMEPAGE_FORN: TStringField;
    SQLFornecedoresCOMPLE_FORN: TStringField;
    SQLFornecedoresSTATUS_FORN: TStringField;
    SQLFornecedoresNOME_CID: TStringField;
    SQLFornecedoresIDCIDADE: TIntegerField;
    SQLFornecedoresIDBAIRRO: TIntegerField;
    SQLFornecedoresNOME_BAIRRO: TStringField;
    SQLFornecedoresCEP_CEP: TStringField;
    CDSFornecedoresIDFORNECEDOR: TIntegerField;
    CDSFornecedoresIDCEP_CEP: TIntegerField;
    CDSFornecedoresNOMEFAN_FORN: TStringField;
    CDSFornecedoresCPF_FORNE: TStringField;
    CDSFornecedoresRG_FORNE: TStringField;
    CDSFornecedoresRS_FORN: TStringField;
    CDSFornecedoresIE_FORN: TStringField;
    CDSFornecedoresCNPJ_FORNE: TStringField;
    CDSFornecedoresTEL_FORN: TStringField;
    CDSFornecedoresCELULAR_FORN: TStringField;
    CDSFornecedoresFAX_FORN: TStringField;
    CDSFornecedoresEMAIL_FORN: TStringField;
    CDSFornecedoresCONTATO_FORN: TStringField;
    CDSFornecedoresHOMEPAGE_FORN: TStringField;
    CDSFornecedoresCOMPLE_FORN: TStringField;
    CDSFornecedoresSTATUS_FORN: TStringField;
    CDSFornecedoresNOME_CID: TStringField;
    CDSFornecedoresIDCIDADE: TIntegerField;
    CDSFornecedoresIDBAIRRO: TIntegerField;
    CDSFornecedoresNOME_BAIRRO: TStringField;
    CDSFornecedoresCEP_CEP: TStringField;
    DBIDCEP: TRzDBEdit;
    DBIDCIDADE: TRzDBEdit;
    DBIDBAIRRO: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    DBNOMEBAIRRO: TRzDBEdit;
    PanImagem: TPanel;
    DBImagemForn: TDBImage;
    SQLFornecedoresLOG_CEP: TStringField;
    CDSFornecedoresLOG_CEP: TStringField;
    CarregarImagem: TOpenPictureDialog;
    SQLFornecedoresFOTO_FORN: TBlobField;
    CDSFornecedoresFOTO_FORN: TBlobField;
    RzButton2: TRzButton;
    RzButton1: TRzButton;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    RzButton5: TRzButton;
    RzButton6: TRzButton;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure CDSFornecedoresIDCIDADEValidate(Sender: TField);
    procedure CDSFornecedoresIDBAIRROValidate(Sender: TField);
    procedure CDSFornecedoresIDCEP_CEPValidate(Sender: TField);
    procedure DBImagemFornDblClick(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton4Click(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadForn: TFrmCadForn;

implementation

uses UDM, U_BusFornecedor, U_StatusForn, U_CadCep, U_CadCidade,
  U_CadBairro, U_BusCep, U_BusBairro;

{$R *.dfm}

procedure TFrmCadForn.BtnNovoClick(Sender: TObject);
begin

//Desligando os datasets
   CDSFornecedores.Close;  /// ou cdscli.active := false;
   SQLFornecedores.Close;

   //Zerando o parametro
   SQLFornecedores.ParamByName('PARFORNECEDOR').AsInteger := 0;

   //Ativando os datasetws
   SQLFornecedores.Open; // ou sqlcli.active := true;
   CDSFornecedores.Open;

   //Inserindo um registro novo no final da entidade
   CDSFornecedores.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSFornecedoresSTATUS_FORN.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDFORNECEDOR) FROM FORNECEDORES';
   DM.SqlAuxiliar.Open;
   CDSFornecedoresIDFORNECEDOR.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSFornecedoresIDFORNECEDOR.AsInteger);



  inherited;
    HabilitaEdicao;
    DBNOMEFAN.Enabled:=true;
    DBRS.Enabled:=true;
    DBIE.Enabled:=true;
    DBCPNJ.Enabled:=true;
    DBCPF.Enabled:=true;
    DBTELEFONE.Enabled:=true;
    DBCELULAR.Enabled:=true;
    DBEMAIL.Enabled:=true;
    DBHOMEPAGE.Enabled:=true;
    DBFAX.Enabled:=true;
    DBCONTATO.Enabled:=true;
    DBCOMPLEMENTO.Enabled:=true;
    DBRG.Enabled:=true;
    DBImagemForn.Enabled:= true;
    DBIDCIDADE.Enabled:= true;
    DBIDBAIRRO.Enabled:= true;
    DBIDCEP.Enabled:= true;
    RzButton2.Enabled:=true;
    RzButton3.Enabled:=true;
    RzButton4.Enabled:=true;
    RzButton1.Enabled:=true;
    RzButton5.Enabled:=true;
    RzButton6.Enabled:=true;

  FocusControl(DBNOMEFAN);
   EdtBusca.Enabled:=false;


end;

procedure TFrmCadForn.BtnCancelarClick(Sender: TObject);
begin

   CDSFornecedores.Cancel;
   CDSFornecedores.Close;
   SQLFornecedores.Close;

   DBNOMEFAN.Clear;
   EdtBusca.Clear;
   EdtBusca.Enabled:=true;
   DBNOMEFAN.Enabled:=false;
   DBRS.Enabled:=false;
    DBIE.Enabled:=false;
    DBCPNJ.Enabled:=false;
    DBCPF.Enabled:=false;
    DBTELEFONE.Enabled:=false;
    DBCELULAR.Enabled:=false;
    DBEMAIL.Enabled:=false;
    DBHOMEPAGE.Enabled:=false;
    DBFAX.Enabled:=false;
    DBCONTATO.Enabled:=false;
    DBCOMPLEMENTO.Enabled:=false;
    DBRG.Enabled:=false;
    DBIDCIDADE.Enabled:= false;
    DBIDBAIRRO.Enabled:= false;
    DBIDCEP.Enabled:= false;

    DBImagemForn.Enabled:= false;
    DesabilitaEdicao;
    inherited;

end;

procedure TFrmCadForn.BtnGravarClick(Sender: TObject);
begin
If (CDSFornecedoresNOMEFAN_FORN.AsString = '') Then
   Begin
     ShowMessage('O Atributo Nome Fantasia é Obrigatório...');
     DBNOMEFAN.SetFocus;
     Exit;
   End;
       //  DM.SqlAuxiliar.Close;
            //    DM.SqlAuxiliar.CommandText := ' SELECT CARGOS.NOME_CARGO FROM CARGOS ' +
              //                                  ' WHERE CARGOS.NOME_CARGO = ' + QuotedStr(DBNOME_CARGO.Text);
           //     DM.SqlAuxiliar.Open;



  //Post salva as alterações no DataSet
  CDSFornecedores.Post;

  //ApplyUpdates, aplica as alterações no BD  ........ Comit
  CDSFornecedores.ApplyUpdates(0);
  //Limpando Campos
  DBNOMEFAN.Clear; DBRS.Clear; DBIE.Clear; DBCPNJ.Clear; DBCPF.Clear;  DBRS.Clear;
  DBRG.Clear; DBTELEFONE.Clear; DBCELULAR.Clear; DBEMAIL.Clear; DBHOMEPAGE.Clear;
  DBFAX.Clear; DBCOMPLEMENTO.Clear;  DBCONTATO.Clear;  EdtBusca.Clear; DBImagemForn.Enabled:= false;
  // Configurando Campos
   DBNOMEFAN.Enabled:=false;  DBRS.Enabled:=false;       DBIE.Enabled:=false;
   DBCPNJ.Enabled:=false;     DBCELULAR.Enabled:=false;  DBEMAIL.Enabled:=false;
   DBCPF.Enabled:=false;      DBHOMEPAGE.Enabled:=false; DBFAX.Enabled:=false;
   DBTELEFONE.Enabled:=false;  DBCONTATO.Enabled:=false; DBCOMPLEMENTO.Enabled:=false;
   DBRG.Enabled:=false;
   DBIDCIDADE.Enabled:= false;
    DBIDBAIRRO.Enabled:= false;
    DBIDCEP.Enabled:= false;

   DBImagemForn.CleanupInstance;
  inherited;


    DBImagemForn.Enabled:= false;
  DesabilitaEdicao;

end;

procedure TFrmCadForn.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBNOMEFAN.Enabled:=True;
              End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT FORNECEDORES.IDFORNECEDOR, FORNECEDORES.STATUS_FORN FROM FORNECEDORES ' +
                                                ' WHERE FORNECEDORES.IDFORNECEDOR = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDFORNECEDOR').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_FORN').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSFornecedores.Close;
                              SQLFornecedores.ParamByName('PARFORNECEDOR').AsInteger := StrToInt(Edtbusca.Text);
                              SQLFornecedores.Open;
                              CDSFornecedores.Open;

                              CDSFornecedores.Edit;

                               If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;
                              end;
                             DBNOMEFAN.Enabled:=true;
    DBRS.Enabled:=true;
    DBIE.Enabled:=true;
    DBCPNJ.Enabled:=true;
    DBCPF.Enabled:=true;
    DBTELEFONE.Enabled:=true;
    DBCELULAR.Enabled:=true;
    DBEMAIL.Enabled:=true;
    DBHOMEPAGE.Enabled:=true;
    DBFAX.Enabled:=true;
    DBCONTATO.Enabled:=true;
    DBCOMPLEMENTO.Enabled:=true;
    DBRG.Enabled:=true;
    DBImagemForn.Enabled:= true;
    DBIDCIDADE.Enabled:= true;
    DBIDBAIRRO.Enabled:= true;
    DBIDCEP.Enabled:= true;


    DBImagemForn.Enabled:= true;

                            FocusControl(DBNOMEFAN);

                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Fornecedor Desativado !');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Fornecedor Inexistente !');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada


  inherited;

end;

procedure TFrmCadForn.BtnBuscarClick(Sender: TObject);
begin
  inherited;
   SQLFornecedores.ParamByName('PARFORNECEDOR').AsInteger := 0;
  Application.CreateForm(TFrmBusForn,FrmBusForn);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusForn.QuemChama := 'BAIRROS';

  FrmBusForn.ShowModal;
  FrmBusForn.Free;

  IF (SQLFornecedores.ParamByName('PARFORNECEDOR').AsInteger > 0 ) THEN
    BEGIN
      SQLFornecedores.Open;
      CDSFornecedores.Open;

      CDSFornecedores.Edit;
      EdtBusca.Text := IntToStr(CDSFornecedoresIDFORNECEDOR.Asinteger);
      HabilitaEdicao;
       DBNOMEFAN.Enabled:=true;
    DBRS.Enabled:=true;
    DBIE.Enabled:=true;
    DBCPNJ.Enabled:=true;
    DBCPF.Enabled:=true;
    DBTELEFONE.Enabled:=true;
    DBCELULAR.Enabled:=true;
    DBEMAIL.Enabled:=true;
    DBHOMEPAGE.Enabled:=true;
    DBFAX.Enabled:=true;
    DBCONTATO.Enabled:=true;
    DBCOMPLEMENTO.Enabled:=true;
    DBRG.Enabled:=true;
    DBImagemForn.Enabled:= true;
    DBIDCIDADE.Enabled:= true;
    DBIDBAIRRO.Enabled:= true;
    DBIDCEP.Enabled:= true;

    END;

end;

procedure TFrmCadForn.BtnStatusClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TFrmStatusForn,FrmStatusForn);
  FrmStatusForn.ShowModal;
  FrmStatusForn.Free;
end;

procedure TFrmCadForn.CDSFornecedoresIDCIDADEValidate(Sender: TField);
begin
  inherited;
DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText :=' SELECT '+
                                ' CIDADES.IDCIDADE,   '+
                                ' CIDADES.NOME_CID,  '+
                                ' CIDADES.STATUS_CID '+
                                ' FROM CIDADES         '+
                                ' WHERE CIDADES.IDCIDADE = '+ QuotedStr(CDSFornecedoresIDCIDADE.AsString);

   DM.SqlAuxiliar.Open;

     IF(DM.SqlAuxiliar.FieldByName('STATUS_CID').AsString<>'A') AND
     (DM.SqlAuxiliar.FieldByName('STATUS_CID').AsString<>'')  THEN
     BEGIN
     ShowMessage('ATENÇÃO' + #13+ #10 + 'CIDADE DESATIVADA');
     Exit;
   END;

   CDSFornecedoresNOME_CID.AsString   := DM.SQLAuxiliar.FIELDBYNAME('NOME_CID').AsString;

end;

procedure TFrmCadForn.CDSFornecedoresIDBAIRROValidate(Sender: TField);
begin
  inherited;
DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText :=' SELECT '+
                                ' BAIRROS.IDBAIRRO,   '+
                                ' BAIRROS.NOME_BAIRRO,  '+
                                ' BAIRROS.STATUS_BAIRRO '+
                                ' FROM BAIRROS        '+
                                ' WHERE BAIRROS.IDBAIRRO = '+ QuotedStr(CDSFornecedoresIDBAIRRO.AsString);

   DM.SqlAuxiliar.Open;

     IF(DM.SqlAuxiliar.FieldByName('STATUS_BAIRRO').AsString<>'A') AND
     (DM.SqlAuxiliar.FieldByName('STATUS_BAIRRO').AsString<>'')  THEN
     BEGIN
     ShowMessage('ATENÇÃO' + #13+ #10 + 'BAIRRO DESATIVADA');
     Exit;
   END;

   CDSFornecedoresNOME_BAIRRO.AsString   := DM.SQLAuxiliar.FIELDBYNAME('NOME_BAIRRO').AsString;
end;

procedure TFrmCadForn.CDSFornecedoresIDCEP_CEPValidate(Sender: TField);
begin
  inherited;
  DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText :=' SELECT '+
                                ' CEPS.IDCEP_CEP,   '+
                                ' CEPS.CEP_CEP,  '+
                                ' CEPS.LOG_CEP,  '+
                                ' CEPS.STATUS_CEP '+
                                ' FROM CEPS        '+
                                ' WHERE CEPS.IDCEP_CEP = '+ QuotedStr(CDSFornecedoresIDCEP_CEP.AsString);

   DM.SqlAuxiliar.Open;

     IF(DM.SqlAuxiliar.FieldByName('STATUS_CEP').AsString<>'A') AND
     (DM.SqlAuxiliar.FieldByName('STATUS_CEP').AsString<>'')  THEN
     BEGIN
     ShowMessage('ATENÇÃO' + #13+ #10 + 'BAIRRO DESATIVADA');
     Exit;
   END;

   CDSFornecedoresCEP_CEP.AsString   := DM.SQLAuxiliar.FIELDBYNAME('CEP_CEP').AsString;
   CDSFornecedoresLOG_CEP.AsString   := DM.SQLAuxiliar.FIELDBYNAME('LOG_CEP').AsString;

end;

procedure TFrmCadForn.DBImagemFornDblClick(Sender: TObject);
var
  Imagem : TJpegImage;
begin
  //Carregando o diálogo OpenPictureDialog
  CarregarImagem.Execute;

  // Testando a existencia de um arquivo na propriedade filename do openpicturedialog
  If ( FileExists(CarregarImagem.FileName) = True ) Then
    Begin
        //Instanciando o objeto imagem na memória
        Imagem := TJPEGImage.Create();


        //carregando para o mesmo o arquivo setado na prorpiedade filename do openpicturedialog
        Imagem.LoadFromFile(CarregarImagem.FileName);

        //Copiando a imagem para a área de transferência
        ClipBoard.Assign(Imagem);

        //copiando da área de transfer~encia para o dbimage
        DBImagemForn.PasteFromClipboard;

        //liberando o objeto da memória(desmontando)
        Imagem.Free;
    end;

end;

procedure TFrmCadForn.RzButton2Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(tfrmcadcep,FrmCadCep);
FrmCadCep.ShowModal;
FrmCadCep.Free;
end;

procedure TFrmCadForn.RzButton3Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(tFrmCadCidades,FrmCadCidades);
FrmCadCidades.ShowModal;
FrmCadCidades.Free;
end;

procedure TFrmCadForn.RzButton4Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(tFrmCadBairros,FrmCadBairros);
FrmCadBairros.ShowModal;
FrmCadBairros.Free;
end;

procedure TFrmCadForn.RzButton1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(tFrmBusCep,FrmBusCep);
SQLFornecedores.ParamByName('PARFORNECEDOR').AsInteger := 0;
  FrmBusCep.QuemChama := 'BTNFORN';

FrmBusCep.ShowModal;
FrmBusCep.Free;
end;

procedure TFrmCadForn.RzButton6Click(Sender: TObject);
begin
  inherited;

Application.CreateForm(TFrmBusBairros,FrmBusBairros);
FrmBusBairros.ShowModal;
FrmBusBairros.Free;

end;

procedure TFrmCadForn.FormCreate(Sender: TObject);
begin
  inherited;
Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
end;

end.
