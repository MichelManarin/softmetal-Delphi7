unit U_CadCondicoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, StdCtrls, Mask, RzEdit, RzDBEdit, DBCtrls,
  RzLabel, ComCtrls;

type
  TFrmCadCondicoes = class(TFrmObjetoCAD)
    DSCond: TDataSource;
    CDSCond: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLCond: TSQLDataSet;
    Label1: TLabel;
    DBDESCRICAO: TRzDBEdit;
    Label2: TLabel;
    DBQTDEPARC: TRzDBEdit;
    Label4: TLabel;
    DBDIASPRI: TRzDBEdit;
    Label5: TLabel;
    DBDIASENTRE: TRzDBEdit;
    Label6: TLabel;
    DBOBS: TRzDBEdit;
    Label3: TLabel;
    DBPERJUROS: TRzDBEdit;
    SQLCondIDCONDI_COND: TIntegerField;
    SQLCondDESCRI_COND: TStringField;
    SQLCondNUMPAR_COND: TIntegerField;
    SQLCondDIASPRI_COND: TIntegerField;
    SQLCondDIASENTRE_COND: TIntegerField;
    SQLCondPERJUROS_COND: TBCDField;
    SQLCondOBS_COND: TStringField;
    SQLCondSTATUS_COND: TStringField;
    CDSCondIDCONDI_COND: TIntegerField;
    CDSCondDESCRI_COND: TStringField;
    CDSCondNUMPAR_COND: TIntegerField;
    CDSCondDIASPRI_COND: TIntegerField;
    CDSCondDIASENTRE_COND: TIntegerField;
    CDSCondPERJUROS_COND: TBCDField;
    CDSCondOBS_COND: TStringField;
    CDSCondSTATUS_COND: TStringField;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure DBDESCRICAOEnter(Sender: TObject);
    procedure DBDESCRICAOExit(Sender: TObject);
    procedure DBQTDEPARCEnter(Sender: TObject);
    procedure DBQTDEPARCExit(Sender: TObject);
    procedure DBDIASPRIEnter(Sender: TObject);
    procedure DBDIASPRIExit(Sender: TObject);
    procedure DBDIASENTREEnter(Sender: TObject);
    procedure DBDIASENTREExit(Sender: TObject);
    procedure DBPERJUROSEnter(Sender: TObject);
    procedure DBPERJUROSExit(Sender: TObject);
    procedure DBOBSEnter(Sender: TObject);
    procedure DBOBSExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCondicoes: TFrmCadCondicoes;

implementation

uses UDM, U_BusCondicao, U_StatusCond;

{$R *.dfm}

procedure TFrmCadCondicoes.BtnNovoClick(Sender: TObject);
begin
//Desligando os datasets
   CDSCOND.Close;  /// ou cdscli.active := false;
   SQLCOND.Close;

   //Zerando o parametro
   SQLCOND.ParamByName('PARCONDI').AsInteger := 0;

   //Ativando os datasetws
   SQLCOND.Open; // ou sqlcli.active := true;
   CDSCOND.Open;

   //Inserindo um registro novo no final da entidade
   CDSCOND.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSCONDSTATUS_COND.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDCONDI_COND) FROM CONDICOES';
   DM.SqlAuxiliar.Open;
   CDSCondIDCONDI_COND.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSCondIDCONDI_COND.AsInteger);
  inherited;
    HabilitaEdicao;
    DBDESCRICAO.Enabled:=true;
    DBQTDEPARC.Enabled:=TRUE;
    DBDIASPRI.Enabled:=TRUE;
    DBDIASENTRE.Enabled:=TRUE;
    DBPERJUROS.Enabled:= True;
    DBOBS.Enabled:=TRUE;
     IF DBDESCRICAO.CanFocus THEN FocusControl(DBDESCRICAO);

     EdtBusca.Enabled:=false;

end;

procedure TFrmCadCondicoes.BtnCancelarClick(Sender: TObject);
begin
   CDSCOND.Cancel;
   CDSCOND.Close;
   SQLCOND.Close;

   DBDESCRICAO.Clear;
   DBQTDEPARC.Clear;
   DBDIASPRI.Clear;
   DBDIASENTRE.Clear;
   DBPERJUROS.Clear;
   EdtBusca.Clear;
   EdtBusca.Enabled:=true;
   DesabilitaEdicao;
   inherited;

end;

procedure TFrmCadCondicoes.BtnGravarClick(Sender: TObject);
begin
  inherited;
 If (CDSCondDESCRI_COND.AsString = '') OR(CDSCondNUMPAR_COND.AsString = '') OR (CDSCondDIASPRI_COND.AsString = '')
     OR (CDSCondDIASENTRE_COND.AsString = '') OR (CDSCondPERJUROS_COND.AsString = '')Then
   Begin
     ShowMessage('O Atributo em branco é Obrigatório...');
     PANDADOS.Enabled:= True;
			 If (DBDESCRICAO.Text = '')then  if DBDESCRICAO.CanFocus then FocusControl(DBDESCRICAO)
               else
                   If (DBQTDEPARC.Text = '')then  FocusControl(DBQTDEPARC)
                 else
                    If (DBDIASPRI.Text = '')then    FocusControl(DBDIASPRI)
                 else
                    If (DBDIASENTRE.Text = '')then   FocusControl(DBDIASENTRE)
                 else
                      If (DBPERJUROS.Text = '')then  FocusControl(DBPERJUROS);
                 HabilitaEdicao; 
                 Exit;

   End
 else
  begin
      //Post salva as alterações no DataSet
      CDSCond.Post;

      //ApplyUpdates, aplica as alterações no BD  ........ Comit
      CDSCond.ApplyUpdates(0);

      EdtBusca.Clear;
      DBDESCRICAO.Clear;
      DBQTDEPARC.Clear;
      DBDIASPRI.Clear;
      DBOBS.Clear;
      DBDIASENTRE.Clear;
      DBPERJUROS.Clear;
      EdtBusca.Clear;

      DesabilitaEdicao;
      EdtBusca.Enabled:=true;


      inherited;
  end;




end;

procedure TFrmCadCondicoes.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  inherited;
  If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBDESCRICAO.Enabled:=True;
                  DBQTDEPARC.Enabled:=True;
                  DBDIASPRI.Enabled:=True;
                  DBDIASENTRE.Enabled:=True;
                  DBPERJUROS.Enabled:= True;
                  DBOBS.Enabled:=True;

              End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT CONDICOES.IDCONDI_COND, CONDICOES.STATUS_COND FROM CONDICOES ' +
                                                ' WHERE CONDICOES.IDCONDI_COND = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDCONDI_COND').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_COND').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSCOND.Close;
                              SQLCOND.Close;
                              SQLCOND.ParamByName('PARCONDI').AsInteger := StrToInt(Edtbusca.Text);
                              SQLCOND.Open;
                              CDSCOND.Open;

                              CDSCOND.Edit;

                                If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;


                              DBDESCRICAO.Enabled:=True;
                              DBQTDEPARC.Enabled:=True;
                              DBDIASPRI.Enabled:=True;
                              DBDIASENTRE.Enabled:=True;
                              DBPERJUROS.Enabled:= True;
                              DBOBS.Enabled:=True;

                         if DBDESCRICAO.CanFocus then   FocusControl(DBDESCRICAO);
                          end;
                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Condição Desativada !');
                              Edtbusca.Clear;
                            if EdtBusca.CanFocus then FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Condição Inexistente !');
                        Edtbusca.Clear;
                       if EdtBusca.CanFocus then FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada



end;

procedure TFrmCadCondicoes.BtnBuscarClick(Sender: TObject);
begin
  inherited;
  SQLCOND.ParamByName('PARCONDI').AsInteger := 0;
  Application.CreateForm(TFrmBusCon,FrmBusCon);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusCon.QuemChama := 'CONDICOES';

  FrmBusCon.ShowModal;
  FrmBusCon.Free;

  IF (SQLCOND.ParamByName('PARCONDI').AsInteger > 0 ) THEN
    BEGIN
      SQLCOND.Open;
      CDSCOND.Open;

      CDSCOND.Edit;
      EdtBusca.Text := IntToStr(CDSCondIDCONDI_COND.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadCondicoes.BtnStatusClick(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TFrmStatusCond,FrmStatusCond);
  FrmStatusCond.ShowModal;
  FrmStatusCond.Free;
end;

procedure TFrmCadCondicoes.DBDESCRICAOEnter(Sender: TObject);
begin
  inherited;
DBDESCRICAO.Color    := clsilver;
end;

procedure TFrmCadCondicoes.DBDESCRICAOExit(Sender: TObject);
begin
  inherited;
DBDESCRICAO.Color    := clWindow;
 CDSCondDESCRI_COND.AsString:=Trim(CDSCondDESCRI_COND.AsString);

end;

procedure TFrmCadCondicoes.DBQTDEPARCEnter(Sender: TObject);
begin
  inherited;
DBQTDEPARC.Color    := clSilver;

end;

procedure TFrmCadCondicoes.DBQTDEPARCExit(Sender: TObject);
begin
  inherited;
DBQTDEPARC.Color    := clWindow;
 CDSCondNUMPAR_COND.AsString:=Trim(CDSCondNUMPAR_COND.AsString);

end;

procedure TFrmCadCondicoes.DBDIASPRIEnter(Sender: TObject);
begin
  inherited;
DBDIASPRI.Color    := clSilver;

end;

procedure TFrmCadCondicoes.DBDIASPRIExit(Sender: TObject);
begin
  inherited;
DBDIASPRI.Color    := clWindow;
 CDSCondDIASPRI_COND.AsString:=Trim(CDSCondDIASPRI_COND.AsString);

end;

procedure TFrmCadCondicoes.DBDIASENTREEnter(Sender: TObject);
begin
  inherited;
DBDIASENTRE.Color    := clSilver;

end;

procedure TFrmCadCondicoes.DBDIASENTREExit(Sender: TObject);
begin
  inherited;
DBDIASENTRE.Color    := clWindow;
 CDSCondDIASENTRE_COND.AsString:=Trim(CDSCondDIASENTRE_COND.AsString);

end;

procedure TFrmCadCondicoes.DBPERJUROSEnter(Sender: TObject);
begin
  inherited;
DBPERJUROS.Color    := clSilver;

end;

procedure TFrmCadCondicoes.DBPERJUROSExit(Sender: TObject);
begin
  inherited;
DBPERJUROS.Color    := clWindow;
 CDSCondPERJUROS_COND.AsString:=Trim(CDSCondPERJUROS_COND.AsString);

end;

procedure TFrmCadCondicoes.DBOBSEnter(Sender: TObject);
begin
  inherited;
DBOBS.Color    := clSilver;

end;

procedure TFrmCadCondicoes.DBOBSExit(Sender: TObject);
begin
  inherited;
DBOBS.Color    := clWindow;
 CDSCondOBS_COND.AsString:=Trim(CDSCondOBS_COND.AsString);

end;

end.
