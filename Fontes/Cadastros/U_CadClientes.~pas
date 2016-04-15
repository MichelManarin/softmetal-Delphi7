unit U_CadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, StdCtrls, Mask, RzEdit, RzLabel, ComCtrls,
  RzCmboBx, RzDBEdit, RzRadGrp, RzDBRGrp, DBCtrls,Jpeg,ClipBrd, ExtDlgs,
  RzDBCmbo;

type
  TFrmCadClien = class(TFrmObjetoCAD)
    DSCLIEN: TDataSource;
    CDSCLIEN: TClientDataSet;
    PROVIDER: TDataSetProvider;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel6: TRzLabel;
    CDSCLIENIDCLIENTE: TIntegerField;
    CDSCLIENRS_CLIEN: TStringField;
    CDSCLIENNOMEFAN_CLIEN: TStringField;
    CDSCLIENCPF_CLIEN: TStringField;
    CDSCLIENCNPJ_CLIEN: TStringField;
    CDSCLIENIE_CLIEN: TStringField;
    CDSCLIENRG_CLIEN: TStringField;
    CDSCLIENTELRES_CLIEN: TStringField;
    CDSCLIENTELCEL_CLIEN: TStringField;
    CDSCLIENDTANASC_CLIEN: TDateField;
    CDSCLIENDTCAD_CLIEN: TDateField;
    CDSCLIENEMAIL_CLIEN: TStringField;
    CDSCLIENFAX_CLIEN: TStringField;
    CDSCLIENTELCOM_CLIEN: TStringField;
    CDSCLIENSEXO_CLIEN: TStringField;
    CDSCLIENOBS_CLIEN: TStringField;
    CDSCLIENSTATUS_CLIEN: TStringField;
    CDSCLIENCOMPLEMENTO_CLIEN: TStringField;
    CDSCLIENIDCEP_CEP: TIntegerField;
    CDSCLIENNOME_CID: TStringField;
    CDSCLIENNOME_BAIRRO: TStringField;
    SQLClien: TSQLDataSet;
    SQLClienIDCLIENTE: TIntegerField;
    SQLClienRS_CLIEN: TStringField;
    SQLClienNOMEFAN_CLIEN: TStringField;
    SQLClienCPF_CLIEN: TStringField;
    SQLClienCNPJ_CLIEN: TStringField;
    SQLClienIE_CLIEN: TStringField;
    SQLClienRG_CLIEN: TStringField;
    SQLClienTELRES_CLIEN: TStringField;
    SQLClienTELCEL_CLIEN: TStringField;
    SQLClienDTANASC_CLIEN: TDateField;
    SQLClienDTCAD_CLIEN: TDateField;
    SQLClienEMAIL_CLIEN: TStringField;
    SQLClienFAX_CLIEN: TStringField;
    SQLClienTELCOM_CLIEN: TStringField;
    SQLClienSEXO_CLIEN: TStringField;
    SQLClienOBS_CLIEN: TStringField;
    SQLClienSTATUS_CLIEN: TStringField;
    SQLClienCOMPLEMENTO_CLIEN: TStringField;
    SQLClienIDCEP_CEP: TIntegerField;
    SQLClienNOME_CID: TStringField;
    SQLClienNOME_BAIRRO: TStringField;
    DBIDCEP: TRzDBEdit;
    Label1: TLabel;
    DBNOMECID: TRzDBEdit;
    Label2: TLabel;
    DBNOMEBAIRRO: TRzDBEdit;
    Label3: TLabel;
    DBRS: TRzDBEdit;
    Label4: TLabel;
    DBNOMEFANTASIA: TRzDBEdit;
    Label5: TLabel;
    DBCPF: TRzDBEdit;
    Label6: TLabel;
    DBCNPJ: TRzDBEdit;
    Label7: TLabel;
    DBIE: TRzDBEdit;
    Label8: TLabel;
    DBRG: TRzDBEdit;
    Label9: TLabel;
    DBTELRESIDENCIAL: TRzDBEdit;
    Label10: TLabel;
    DBTELEFONECELULAR: TRzDBEdit;
    Label11: TLabel;
    DBDTANASC: TRzDBEdit;
    Label12: TLabel;
    RBDTC: TRzDBEdit;
    Label13: TLabel;
    DBFAX: TRzDBEdit;
    Label14: TLabel;
    DBTELEFONECOMERCIAL: TRzDBEdit;
    Label15: TLabel;
    DBOBSERVA: TRzDBEdit;
    Label16: TLabel;
    DBCOMPLEMENTO: TRzDBEdit;
    Label17: TLabel;
    DBEMAIL: TRzDBEdit;
    PanImagem: TPanel;
    DBImagemClien: TDBImage;
    SQLClienFOTO_CLIEN: TBlobField;
    CDSCLIENFOTO_CLIEN: TBlobField;
    CarregarImagem: TOpenPictureDialog;
    DBSEXO: TRzDBComboBox;
    Label18: TLabel;
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBImagemClienDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClien: TFrmCadClien;

implementation

uses U_BusCliente, U_StatusClien, UDM, UObjetoINI;

{$R *.dfm}

procedure TFrmCadClien.BtnBuscarClick(Sender: TObject);
begin
  inherited;
SQLCLIEN.ParamByName('PARCLIENTE').AsInteger := 0;
  Application.CreateForm(TFrmBusClien,FrmBusClien) ;

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusClien.QuemChama := 'BAIRROS';

  FrmBusClien.ShowModal;
  FrmBusClien.Free;

  IF (SQLCLIEN.ParamByName('PARCLIENTE').AsInteger > 0 ) THEN
    BEGIN
      SQLCLIEN.Open;
      CDSCLIEN.Open;

      CDSCLIEN.Edit;
      //EdtBusca.Text := IntToStr(CDSCLIENidcliente.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadClien.BtnStatusClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmStatusClien,FrmStatusClien);
  FrmStatusClien.ShowModal;
  FrmStatusClien.Free;
end;

procedure TFrmCadClien.BtnNovoClick(Sender: TObject);
begin
  inherited;
 If (MessageDlg('O cliente é Pessoa Física ?',mtConfirmation,[mbYes,mbno],0)  = mryes) Then
   Begin
      DBCPF.Enabled := True;
      DBRG.Enabled  := True;
      DBSEXO.Enabled :=true;
      DBCNPJ.Enabled:= False;
      DBIE.Enabled  := False;
      DBCNPJ.Color  := clSilver;
      DBIE.Color    := clsilver;
      DBCPF.Color   := clWindow;
      DBRG.Color    := clWindow;
   End
 Else
   Begin
      DBCPF.Enabled := False;
      DBSEXO.Enabled:= False;
      DBRG.Enabled  := False;
      DBCNPJ.Enabled:= True;
      DBIE.Enabled  := True;
      DBCNPJ.Color  := clWindow;
      DBIE.Color    := clwindow;
      DBCPF.Color   := clsilver;
      DBRG.Color    := clSilver;
   End;


//Desligando os datasets
   CDSCLIEN.Close;  /// ou cdscli.active := false;
   SQLClien.Close;

   //Zerando o parametro
   SQLClien.ParamByName('PARCLIENTE').AsInteger := 0;

   //Ativando os datasetws
   SQLClien.Open; // ou sqlcli.active := true;
   CDSCLIEN.Open;

   //Inserindo um registro novo no final da entidade
   CDSCLIEN.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSCLIENSTATUS_CLIEN.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDCLIENTE) FROM CLIENTES';
   DM.SqlAuxiliar.Open;
   CDSCLIENIDCLIENTE.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSCLIENIDCLIENTE.AsInteger);



  inherited;
    HabilitaEdicao;
    DBIDCEP.Enabled:=true;
    DBRS.Enabled:=true;
    DBTELRESIDENCIAL.Enabled:=true;
    DBTELEFONECELULAR.Enabled:=true;
    DBTELEFONECOMERCIAL.Enabled:=true;
    DBDTANASC.Enabled:=true;
    DBFAX.Enabled:=true;
    DBOBSERVA.Enabled:=true;
    DBCOMPLEMENTO.Enabled:=true;
    RBDTC.Text:= (datetostr(date));
    DBImagemClien.Enabled:=true;
  FocusControl(DBRS);
   EdtBusca.Enabled:=false;

   if (DBSEXO.Items.Count=0) then
    begin
      DBSEXO.Items.Add('F');
      DBSEXO.Items.Add('M');
    end;
end;

procedure TFrmCadClien.BtnCancelarClick(Sender: TObject);
begin
CDSCLIEN.Cancel;
   CDSCLIEN.Close;
   SQLClien.Close;
   EdtBusca.Clear;
    DBIDCEP.Enabled:=FALSE;
    DBRS.Enabled:=FALSE;
    DBCPF.Enabled:=FALSE;
    DBCNPJ.Enabled:=FALSE;
    DBIE.Enabled:=FALSE;
    DBRG.Enabled:=FALSE;
    DBTELRESIDENCIAL.Enabled:=FALSE;
    DBTELEFONECELULAR.Enabled:=FALSE;
    DBTELEFONECOMERCIAL.Enabled:=FALSE;
    DBDTANASC.Enabled:=FALSE;
    DBFAX.Enabled:=FALSE;
    DBOBSERVA.Enabled:=FALSE;
    DBCOMPLEMENTO.Enabled:=FALSE;


  inherited;

end;

procedure TFrmCadClien.BtnGravarClick(Sender: TObject);
begin
  inherited;
If (CDSCLIENRS_CLIEN.AsString = '')  Then
   Begin
     ShowMessage('O atributo em branco é obrigatorio...');

     Exit;
   End;
    


  //Post salva as alterações no DataSet
  CDSCLIEN.Post;

  //ApplyUpdates, aplica as alterações no BD  ........ Comit
  CDSCLIEN.ApplyUpdates(0);
   {DBIDMAQ.Clear;
   DBIDFUN.Clear;
   DBDATAMANU.Clear;
   DBDESC.Clear;
   DBOBSER.Clear;
  EdtBusca.Clear;
  }


end;

procedure TFrmCadClien.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key = VK_Return ) Then
   Begin
        If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  HabilitaEdicao;
                     DBIDCEP.Enabled:=true;
                     DBRS.Enabled:=true;
                     DBTELRESIDENCIAL.Enabled:=true;
                     DBTELEFONECELULAR.Enabled:=true;
                     DBTELEFONECOMERCIAL.Enabled:=true;
                     DBDTANASC.Enabled:=true;
                     DBFAX.Enabled:=true;
                     DBOBSERVA.Enabled:=true;
                     DBCOMPLEMENTO.Enabled:=true;
                     DBImagemClien.Enabled:=true;
              End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin

                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT CLIENTES.IDCLIENTE, CLIENTES.STATUS_CLIEN FROM CLIENTES ' +
                                                ' WHERE CLIENTES.IDCLIENTE = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDCLIENTE').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_CLIEN').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSCLIEN.Close;
                              SQLClien.Close;
                              SQLClien.ParamByName('PARCLIENTE').AsInteger := StrToInt(Edtbusca.Text);
                              SQLClien.Open;
                              CDSCLIEN.Open;

                              CDSCLIEN.Edit;
                                If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;
                               DBRS.Enabled:=True;
                              end;

                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Cargo Desativado !');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Cargo Inexistente !');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
    end;//End do teste da tecla pressionada

  inherited;

end;

procedure TFrmCadClien.DBImagemClienDblClick(Sender: TObject);
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
        DBImagemClien.PasteFromClipboard;

        //liberando o objeto da memória(desmontando)
        Imagem.Free;
    end;
end;

end.
