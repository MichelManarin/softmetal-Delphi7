unit U_CadManuntencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, StdCtrls, Mask, RzEdit, RzPanel, RzButton, ExtCtrls,
  FMTBcd, DB, SqlExpr, Provider, DBClient, RzDBEdit, DBCtrls, RzLabel,
  ComCtrls, RzSpnEdt, RzDBSpin, RzRadGrp, RzDBRGrp, RzDTP, RzDBDTP,
  RzCmboBx, RzDBCmbo, Grids, DBGrids, RzDBGrid;

type
  TFrmCadManun = class(TFrmObjetoCAD)
    CDSManu: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLManu: TSQLDataSet;
    DSManu: TDataSource;
    Label9: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    DBOBSER: TRzDBEdit;
    DBIDMAQ: TRzDBEdit;
    DBIDFUN: TRzDBEdit;
    DBHORA: TRzDBEdit;
    DBDESC: TRzDBEdit;
    DBDATAMANU: TRzDBDateTimeEdit;
    DBTIPOMANU: TRzDBComboBox;
    Label7: TLabel;
    Label8: TLabel;
    GRIDMAQ: TRzDBGrid;
    PNLTABLE: TRzPanel;
    GRIDFuncionario: TRzDBGrid;
    SQLFUN: TSQLDataSet;
    PROVIDERfun: TDataSetProvider;
    CDSFUN: TClientDataSet;
    DSFUN: TDataSource;
    SQLFUNIDFUNCIONARIO: TIntegerField;
    SQLFUNNOME_FUN: TStringField;
    SQLFUNSTATUS_FUN: TStringField;
    CDSFUNIDFUNCIONARIO: TIntegerField;
    CDSFUNNOME_FUN: TStringField;
    CDSFUNSTATUS_FUN: TStringField;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    SQLMaquinas: TSQLDataSet;
    SQLMaquinasIDMAQUINA: TIntegerField;
    SQLMaquinasDESC_MAQ: TStringField;
    SQLMaquinasNUMSERIE_MAQ: TStringField;
    SQLMaquinasSTATUS_MAQ: TStringField;
    PROVIDERmaq: TDataSetProvider;
    CDSMaquinas: TClientDataSet;
    CDSMaquinasIDMAQUINA: TIntegerField;
    CDSMaquinasDESC_MAQ: TStringField;
    CDSMaquinasNUMSERIE_MAQ: TStringField;
    CDSMaquinasSTATUS_MAQ: TStringField;
    DSMaquinas: TDataSource;
    SQLManuIDMANUNTENCAO: TIntegerField;
    SQLManuIDMAQUINA: TIntegerField;
    SQLManuIDFUNCIONARIO: TIntegerField;
    SQLManuDESC_MANU: TStringField;
    SQLManuTIPO_MANU: TStringField;
    SQLManuDT_MANU: TDateField;
    SQLManuHR_MANU: TTimeField;
    SQLManuOBS_MANU: TStringField;
    SQLManuSTATUS_MANU: TStringField;
    SQLManuDESC_MAQ: TStringField;
    SQLManuNOME_FUN: TStringField;
    CDSManuIDMANUNTENCAO: TIntegerField;
    CDSManuIDMAQUINA: TIntegerField;
    CDSManuIDFUNCIONARIO: TIntegerField;
    CDSManuDESC_MANU: TStringField;
    CDSManuTIPO_MANU: TStringField;
    CDSManuDT_MANU: TDateField;
    CDSManuHR_MANU: TTimeField;
    CDSManuOBS_MANU: TStringField;
    CDSManuSTATUS_MANU: TStringField;
    CDSManuDESC_MAQ: TStringField;
    CDSManuNOME_FUN: TStringField;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure CDSManuIDFUNCIONARIOValidate(Sender: TField);
    procedure cadmaqClick(Sender: TObject);
    procedure buscamaqClick(Sender: TObject);
    procedure cadfunClick(Sender: TObject);
    procedure buscafunClick(Sender: TObject);
    procedure GRIDMAQDblClick(Sender: TObject);
    procedure GRIDFuncionarioDblClick(Sender: TObject);
    PROCEDURE HABILITACOMPONENTES;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadManun: TFrmCadManun;

implementation

uses UDM, U_BusManuntencao, U_StatusManu, U_CadMaquina, U_BusMaquina,
  U_CadFuncionario, U_BusFuncionario;

{$R *.dfm}

procedure TFrmCadManun.BtnNovoClick(Sender: TObject);
begin

//Desligando os datasets
   CDSManu.Close;  /// ou cdscli.active := false;
   SQLManu.Close;
   CDSFUN.close;
   SQLFUN.close;
   CDSMaquinas.close;
   SQLMaquinas.close;

   //Zerando o parametro
   SQLManu.ParamByName('PARMANUNTENCAO').AsInteger := 0;

   //Ativando os datasetws
   SQLManu.Open; // ou sqlcli.active := true;
   CDSManu.Open;
   SQLFUN.Open;
   CDSFUN.Open;
   SQLMaquinas.Open;
   CDSMaquinas.Open;

   //Inserindo um registro novo no final da entidade
   CDSManu.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSManuSTATUS_MANU.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDMANUNTENCAO) FROM MANUNTENCAO';
   DM.SqlAuxiliar.Open;
   CDSManuIDMANUNTENCAO.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSManuIDMANUNTENCAO.AsInteger);

  inherited;
   DBDATAMANU.Enabled:=true; DBTIPOMANU.Enabled:=true;
   DBDESC.Enabled:=true;  DBOBSER.Enabled:=true;
   DBHORA.Enabled:=true;


   GRIDMAQ.Enabled:=true;
   GRIDFuncionario.Enabled:=true;


   FocusControl(DBDATAMANU);
   PANDADOS.Enabled:=True;

   EdtBusca.Enabled:=false;

end;

procedure TFrmCadManun.BtnCancelarClick(Sender: TObject);
begin
CDSManu.Cancel;
   CDSManu.Close;
   SQLManu.Close;
   EdtBusca.Clear;
   EdtBusca.Enabled:=true;
   DBIDMAQ.Enabled:=False;  DBIDFUN.Enabled:=False;   DBHORA.Enabled:=False;
   DBDATAMANU.Enabled:=False; DBTIPOMANU.Enabled:=False;  DBDESC.Enabled:=False;
   DBOBSER.Enabled:=False;

  inherited;

  CDSFUN.close;
  SQLFUN.close;

  CDSMaquinas.close;
  SQLMaquinas.close;


end;

procedure TFrmCadManun.BtnGravarClick(Sender: TObject);
begin
If (CDSManuIDMAQUINA.AsString = '') Then
   Begin
     ShowMessage('O atributo maquina é Obrigatório...');
     DBIDMAQ.SetFocus;
     Exit;
   End;



  //Post salva as alterações no DataSet
  CDSManu.Post;

  //ApplyUpdates, aplica as alterações no BD  ........ Comit
  CDSManu.ApplyUpdates(0);
   DBIDMAQ.Clear;
   DBIDFUN.Clear;
   DBDATAMANU.Clear;
   DBDESC.Clear;
   DBOBSER.Clear;
  EdtBusca.Clear;


  CDSFUN.close;
  SQLFUN.close;

  CDSMaquinas.close;
  SQLMaquinas.close;



  inherited;

end;

procedure TFrmCadManun.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBIDMAQ.Enabled:=True;
                  DBIDFUN.Enabled:=True;
                  DBDATAMANU.Enabled:=True;
                  DBTIPOMANU.Enabled:=True;
                  DBDESC.Enabled:=True;
                  DBOBSER.Enabled:=True;
                  DBHORA.Enabled:=True;

                                End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT MANUNTENCAO.IDMANUNTENCAO, MANUNTENCAO.STATUS_MANU FROM MANUNTENCAO ' +
                                                ' WHERE MANUNTENCAO.IDMANUNTENCAO = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDMANUNTENCAO').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_MANU').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSManu.Close;
                              SQLManu.Close;
                              SQLManu.ParamByName('PARMANUNTENCAO').AsInteger := StrToInt(Edtbusca.Text);
                              SQLManu.Open;
                              CDSManu.Open;

                              CDSManu.Edit;

                              HabilitaEdicao;
                              DBIDMAQ.Enabled:=True;
                              GRIDMAQ.Enabled:=TRUE;
                              GRIDFuncionario.Enabled:=TRUE;
                              DBTIPOMANU.Enabled:=True;
                              DBDESC.Enabled:=True;
                              DBOBSER.Enabled:=True;
                              DBHORA.Enabled:=True;
                              DBIDMAQ.Enabled:=FALSE;
                              FocusControl(DBDESC);
                              CDSFUN.close;
                              SQLFUN.close;
                              CDSMaquinas.close;
                              SQLMaquinas.close;
                              SQLFUN.Open;
                              CDSFUN.Open;
                              SQLMaquinas.Open;
                              CDSMaquinas.OPEN;
                              
                              
                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Manuntenção Desativada !');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Manunteção Inexistente !');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada



  inherited;

end;

procedure TFrmCadManun.BtnBuscarClick(Sender: TObject);
begin
  inherited;
  SQLManu.ParamByName('PARMANUNTENCAO').AsInteger := 0;
  Application.CreateForm(TFrmBusManun,FrmBusManun);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusManun.QuemChama := 'BAIRROS';

  FrmBusManun.ShowModal;
  FrmBusManun.Free;

  IF (SQLManu.ParamByName('PARMANUNTENCAO').AsInteger > 0 ) THEN
    BEGIN
      SQLManu.Open;
      CDSManu.Open;

      CDSManu.Edit;
      EdtBusca.Text := IntToStr(CDSManuIDMANUNTENCAO.Asinteger);
      HabilitaEdicao;
    END;

end;

procedure TFrmCadManun.BtnStatusClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmStatusManun,FrmStatusManun);
  FrmStatusManun.ShowModal;
  FrmStatusManun.Free;

end;

procedure TFrmCadManun.CDSManuIDFUNCIONARIOValidate(Sender: TField);
begin
 DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText :=' SELECT '+
                                ' FUNCIONARIOS.IDFUNCIONARIO,   '+
                                ' FUNCIONARIOS.NOME_FUN,  '+
                                ' FUNCIONARIOS.STATUS_FUN  '+
                                ' FROM FUNCIONARIOS         '+
                                ' WHERE FUNCIONARIOS.IDFUNCIONARIO = '+ QuotedStr(CDSManuIDFUNCIONARIO.AsString);

   DM.SqlAuxiliar.Open;

     IF(DM.SqlAuxiliar.FieldByName('STATUS_FUN').AsString<>'A') AND
     (DM.SqlAuxiliar.FieldByName('STATUS_FUN').AsString<>'')  THEN
     BEGIN
     ShowMessage('ATENÇÃO' + #13+ #10 + 'FUNCIONARIO DESATIVADA');
     Exit;
   END;

   //CDSManuNOME_FUN.AsString   := DM.SQLAuxiliar.FIELDBYNAME('NOME_FUN').AsString;


end;

procedure TFrmCadManun.cadmaqClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadMaquinas,FrmCadMaquinas);
FrmCadMaquinas.ShowModal;
FrmCadMaquinas.FREE;

end;

procedure TFrmCadManun.buscamaqClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmBusMaq,FrmBusMaq);
FrmBusMaq.ShowModal;
FrmBusMaq.FREE;

end;

procedure TFrmCadManun.cadfunClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadFun,FrmCadFun);
FrmCadFun.ShowModal;
FrmCadFun.FREE;

end;

procedure TFrmCadManun.buscafunClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmBusFun,FrmBusFun);
FrmBusFun.ShowModal;
FrmBusFun.FREE;

end;

procedure TFrmCadManun.GRIDMAQDblClick(Sender: TObject);
begin
  inherited;
DBIDMAQ.Text := CDSMaquinasIDMAQUINA.AsString;
  CDSManuIDMAQUINA.Text:= DBIDMAQ.text;
end;

procedure TFrmCadManun.GRIDFuncionarioDblClick(Sender: TObject);
begin
  inherited;
  DBIDFUN.Text := CDSFUNIDFUNCIONARIO.AsString;
  CDSManuIDFUNCIONARIO.Text:= DBIDFUN.text;
end;

procedure TFrmCadManun.HABILITACOMPONENTES;
begin

    DBDATAMANU.Enabled:=true; DBTIPOMANU.Enabled:=true;
   DBDESC.Enabled:=true;  DBOBSER.Enabled:=true;
   DBHORA.Enabled:=true; EdtBusca.Enabled:=FALSE;
end;

end.
