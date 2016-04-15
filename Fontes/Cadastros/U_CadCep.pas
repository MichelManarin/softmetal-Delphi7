unit U_CadCep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, StdCtrls, Mask, RzEdit, RzDBEdit, DBCtrls,
  ComCtrls, RzLabel, RzCmboBx, RzDBCmbo;

type
  TFrmCadCep = class(TFrmObjetoCAD)
    Label2: TLabel;
    Label4: TLabel;
    DBCEP_CEP: TRzDBEdit;
    DBIDBAIRRO: TRzDBEdit;
    Label5: TLabel;
    Label8: TLabel;
    DBNOMEBAIRRO: TRzDBEdit;
    DBIDCIDADE: TRzDBEdit;
    Label6: TLabel;
    Label9: TLabel;
    DBNOMECIDADE: TRzDBEdit;
    Label1: TLabel;
    DBLOGRADOUROCEP: TRzDBEdit;
    BtnBuscaBairro: TRzButton;
    BtnCadBairro: TRzButton;
    BtnBuscaCidade: TRzBitBtn;
    BtnCadCidade: TRzBitBtn;
    DBIDTIPOLOG: TRzDBEdit;
    DBTIPOLOG: TRzDBEdit;
    Label3: TLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    SQLCEPS: TSQLDataSet;
    PROVIDER: TDataSetProvider;
    CDSCEPS: TClientDataSet;
    DSCEPS: TDataSource;
    SQLCEPSIDCEP_CEP: TIntegerField;
    SQLCEPSCEP_CEP: TStringField;
    SQLCEPSLOG_CEP: TStringField;
    SQLCEPSIDBAIRRO: TIntegerField;
    SQLCEPSIDCIDADE: TIntegerField;
    SQLCEPSIDTIPOLOG: TIntegerField;
    SQLCEPSSTATUS_CEP: TStringField;
    SQLCEPSNOME_LOG: TStringField;
    SQLCEPSNOME_BAIRRO: TStringField;
    SQLCEPSNOME_CID: TStringField;
    CDSCEPSIDCEP_CEP: TIntegerField;
    CDSCEPSCEP_CEP: TStringField;
    CDSCEPSLOG_CEP: TStringField;
    CDSCEPSIDBAIRRO: TIntegerField;
    CDSCEPSIDCIDADE: TIntegerField;
    CDSCEPSIDTIPOLOG: TIntegerField;
    CDSCEPSSTATUS_CEP: TStringField;
    CDSCEPSNOME_LOG: TStringField;
    CDSCEPSNOME_BAIRRO: TStringField;
    CDSCEPSNOME_CID: TStringField;
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure CDSCepsIDBAIRROValidate(Sender: TField);
    procedure CDSCepsIDCIDADEValidate(Sender: TField);
    procedure BtnCadBairroClick(Sender: TObject);
    procedure BtnCadCidadeClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure CDSCepsIDTIPOLOGValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCep: TFrmCadCep;

implementation

uses UDM, U_BusCep, U_StatusCep, U_BusBairro, U_BusCidade, U_CadBairro,
  U_CadCidade, U_CadTipoLog, Math;

{$R *.dfm}


procedure TFrmCadCep.BtnBuscarClick(Sender: TObject);
begin
  inherited;
SQLCeps.ParamByName('PARCEP').AsInteger := 0;
  Application.CreateForm(TFrmBusCep,FrmBusCep);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusCep.QuemChama := 'CEPS';

  FrmBusCep.ShowModal;
  FrmBusCep.Free;

  IF (SQLCeps.ParamByName('PARCEP').AsInteger > 0 ) THEN
    BEGIN
      SQLCeps.Open;
      CDSCeps.Open;

      CDSCeps.Edit;
      EdtBusca.Text := IntToStr(CDSCepsIDCEP_CEP.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadCep.BtnStatusClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmStatusCep,FrmStatusCep);
  FrmStatusCep.ShowModal;
  FrmStatusCep.Free;

end;

procedure TFrmCadCep.BtnNovoClick(Sender: TObject);
begin
   //Desligando os datasets
   CDSCeps.Close;  /// ou cdscli.active := false;
   SQLCeps.Close;

   //Zerando o parametro
   SQLCeps.ParamByName('PARCEP').AsInteger := 0;

   //Ativando os datasets
   SQLCeps.Open; // ou sqlcli.active := true;
   CDSCeps.Open;

   //Inserindo um registro novo no final da entidade
   CDSCeps.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSCepsSTATUS_CEP.AsString:= 'A';

   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDCEP_CEP) FROM CEPS';
   DM.SqlAuxiliar.Open;
   CDSCepsIDCEP_CEP.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSCepsIDCEP_CEP.AsInteger);

   inherited;
   // Configurando Campos
   HabilitaEdicao;

   DBCEP_CEP.Enabled:= TRUE;
   DBIDTIPOLOG.Enabled:= TRUE;
   DBLOGRADOUROCEP.Enabled:= TRUE;
   DBIDBAIRRO.Enabled:= TRUE;
   DBIDCIDADE.Enabled:= TRUE;

   IF DBCEP_CEP.CanFocus THEN FocusControl(DBCEP_CEP);
   EdtBusca.Enabled:=false;
   BtnBuscaBairro.Enabled:= true;
   BtnBuscaCidade.Enabled:= true;
   BtnCadBairro.Enabled:= true;
   BtnCadCidade.Enabled:= true;


end;

procedure TFrmCadCep.CDSCepsIDBAIRROValidate(Sender: TField);
begin
  inherited;
  DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText :=' SELECT '+
                                ' BAIRROS.STATUS_BAIRRO, '+
                                ' BAIRROS.NOME_BAIRRO    '+
                                ' FROM BAIRROS           '+
                                ' WHERE BAIRROS.IDBAIRRO = '+ QuotedStr(CDSCepsIDBAIRRO.AsString);

   DM.SqlAuxiliar.Open;

   IF(DM.SqlAuxiliar.FieldByName('STATUS_BAIRRO').AsString<>'A') and(DM.SqlAuxiliar.FieldByName('STATUS_BAIRRO').AsString<>null)  THEN
     BEGIN
     ShowMessage('ATENÇÃO' + #13+ #10 + 'BAIRRO DESATIVADO');
     Exit;
   END;

   CDSCepsNOME_BAIRRO.AsString   := DM.SQLAuxiliar.FIELDBYNAME('NOME_BAIRRO').AsString;
end;


procedure TFrmCadCep.CDSCepsIDCIDADEValidate(Sender: TField);
begin
  inherited;
DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText :=' SELECT '+
                                ' CIDADES.STATUS_CID,   '+
                                ' CIDADES.NOME_CID      '+
                                ' FROM CIDADES          '+
                                ' WHERE CIDADES.IDCIDADE = '+ QuotedStr(CDSCepsIDCIDADE.AsString);

   DM.SqlAuxiliar.Open;

     IF(DM.SqlAuxiliar.FieldByName('STATUS_CID').AsString<>'A') AND
     (DM.SqlAuxiliar.FieldByName('STATUS_CID').AsString<>'')  THEN
     BEGIN
     ShowMessage('ATENÇÃO' + #13+ #10 + 'CIDADE DESATIVADA');
     Exit;
   END;

   CDSCepsNOME_CID.AsString   := DM.SQLAuxiliar.FIELDBYNAME('NOME_CID').AsString;

end;

procedure TFrmCadCep.BtnCadBairroClick(Sender: TObject);
begin
Application.CreateForm(TFrmCadBairros, FrmCadBairros);
FrmCadBairros.ShowModal;
FrmCadBairros.free;
end;

procedure TFrmCadCep.BtnCadCidadeClick(Sender: TObject);
begin
Application.CreateForm(TFrmCadCidades, FrmCadCidades);
FrmCadCidades.ShowModal;
FrmCadCidades.free;

end;

procedure TFrmCadCep.BtnCancelarClick(Sender: TObject);
begin
  //Cancelando a inclusão ou alteração do registro
  CDSCeps.Cancel;
  //Desativandio os datasets
  CDSCeps.Close;
  SQLCeps.Close;
  PANDADOS.Enabled:=false;
  //Herança
  inherited;

   {DBCEP_CEP.Enabled:= TRUE;
   DBTIPOLOGRADOURO.Enabled:= TRUE;
   DBLOGRADOUROCEP.Enabled:= TRUE;
   DBIDBAIRRO.Enabled:= TRUE;
   DBIDCIDADE.Enabled:= TRUE;}
   //EdtBusca.Enabled:=false;
   //BtnBuscaBairro.Enabled:= true;
   //BtnBuscaCidade.Enabled:= true;
   //BtnCadBairro.Enabled:= true;
   //BtnCadCidade.Enabled:= true;
     DesabilitaEdicao;

   DBCEP_CEP.Clear;
   DBIDTIPOLOG.Clear;
   DBLOGRADOUROCEP.Clear;
   DBIDBAIRRO.Clear;
   DBIDCIDADE.Clear;
   DBNOMEBAIRRO.Clear;
   DBNOMECIDADE.Clear;
   EdtBusca.Clear;


end;

procedure TFrmCadCep.BtnGravarClick(Sender: TObject);
begin
		 If (CDSCepsCEP_CEP.AsString = '') or (CDSCEPSNOME_LOG.AsString = '') or (CDSCepsIDBAIRRO.AsString = '') or (CDSCepsIDCIDADE.AsString = '') Then
		   Begin
					 ShowMessage('O Atributo em branco é Obrigatório...');
					 PANDADOS.Enabled:= True;
					 If (DBCEP_CEP.Text = '')then  if DBCEP_CEP.CanFocus then FocusControl(DBCEP_CEP)
               else
                   If (DBIDTIPOLOG.Text = '')then  FocusControl(DBIDTIPOLOG)
                 else
                    If (DBLOGRADOUROCEP.Text = '')then    FocusControl(DBLOGRADOUROCEP)
                 else
                    If (DBIDBAIRRO.Text = '')then   FocusControl(DBIDBAIRRO)
                 else
                      If (DBIDCIDADE.Text = '')then  FocusControl(DBIDCIDADE);
                 HabilitaEdicao;
                 Exit;

       End
						else
								begin
								  //Post salva as alterações no DataSet
								  CDSCeps.Post;

								  //ApplyUpdates, aplica as alterações no BD  ........ Comit
								  CDSCeps.ApplyUpdates(0);
								  EdtBusca.Clear;
								  PANDADOS.Enabled:= false;

								   DBCEP_CEP.Clear;
								   DBIDTIPOLOG.Clear;
								   DBLOGRADOUROCEP.Clear;
								   DBIDBAIRRO.Clear;
								   DBIDCIDADE.Clear;
								   DBNOMEBAIRRO.Clear;
								   DBNOMECIDADE.Clear;
								   DesabilitaEdicao;
								  inherited;
							  end;
          end;

procedure TFrmCadCep.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key = VK_RETURN ) Then
   Begin
        If (Trim(EdtBusca.Text) = '' ) Then
              Begin
                  HabilitaEdicao;
                     DBCEP_CEP.Enabled:=true; DBIDCIDADE.Enabled:=true;
                     DBIDBAIRRO.Enabled:=true;DBIDTIPOLOG.Enabled:=true;


              End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin

                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT CEPS.IDCEP_CEP, CEPS.STATUS_CEP FROM CEPS ' +
                                                ' WHERE CEPS.IDCEP_CEP = ' + QuotedStr(EdtBusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDCEP_CEP').AsInteger> 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_CEP').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSCEPS.Close;
                              SQLCEPS.Close;
                              SQLCEPS.ParamByName('PARCEP').AsInteger := StrToInt(EdtBusca.Text);
                              SQLCEPS.Open;
                              CDSCEPS.Open;

                              CDSCEPS.Edit;
                                If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;

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

procedure TFrmCadCep.CDSCepsIDTIPOLOGValidate(Sender: TField);
begin
  DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText :=' SELECT '+
                                ' TIPOLOG.STATUS_LOG,   '+
                                ' TIPOLOG.NOME_LOG      '+
                                ' FROM TIPOLOG          '+
                                ' WHERE TIPOLOG.IDTIPOLOG = '+ QuotedStr(CDSCEPSIDTIPOLOG.AsString);

   DM.SqlAuxiliar.Open;

     IF(DM.SqlAuxiliar.FieldByName('STATUS_LOG').AsString<>'A') AND
        (DM.SqlAuxiliar.FieldByName('STATUS_LOG').AsString<>'')  THEN
     BEGIN
     ShowMessage('ATENÇÃO' + #13+ #10 + 'LOGRADOURO DESATIVADA');
     Exit;
   END;

   CDSCEPSNOME_LOG.AsString   := DM.SqlAuxiliar.FIELDBYNAME('NOME_LOG').AsString;
end;


end.





