unit U_CadMaquina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, StdCtrls, Mask, RzEdit, RzPanel, RzButton, ExtCtrls,
  FMTBcd, SqlExpr, Provider, DB, DBClient, RzDBEdit, RzLabel, ComCtrls;

type
  TFrmCadMaquinas = class(TFrmObjetoCAD)
    DSMaquinas: TDataSource;
    CDSMaquinas: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLMaquinas: TSQLDataSet;
    SQLMaquinasIDMAQUINA: TIntegerField;
    SQLMaquinasDESC_MAQ: TStringField;
    SQLMaquinasNUMSERIE_MAQ: TStringField;
    SQLMaquinasSTATUS_MAQ: TStringField;
    CDSMaquinasIDMAQUINA: TIntegerField;
    CDSMaquinasDESC_MAQ: TStringField;
    CDSMaquinasNUMSERIE_MAQ: TStringField;
    CDSMaquinasSTATUS_MAQ: TStringField;
    DBDESCR: TRzDBEdit;
    Label1: TLabel;
    DBNUMERODESERIE: TRzDBEdit;
    Label2: TLabel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure DBNUMERODESERIEEnter(Sender: TObject);
    procedure DBNUMERODESERIEExit(Sender: TObject);
    procedure DBDESCREnter(Sender: TObject);
    procedure DBDESCRExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadMaquinas: TFrmCadMaquinas;

implementation

uses UDM, U_BusCondicao, U_BusMaquina, U_StatusMaq;

{$R *.dfm}

procedure TFrmCadMaquinas.BtnNovoClick(Sender: TObject);
begin

//Desligando os datasets
   CDSMaquinas.Close;  /// ou cdscli.active := false;
   SQLMaquinas.Close;

   //Zerando o parametro
   SQLMaquinas.ParamByName('PARMAQ').AsInteger := 0;

   //Ativando os datasetws
   SQLMaquinas.Open; // ou sqlcli.active := true;
   CDSMaquinas.Open;

   //Inserindo um registro novo no final da entidade
   CDSMaquinas.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSMaquinasSTATUS_MAQ.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDMAQUINA) FROM MAQUINAS';
   DM.SqlAuxiliar.Open;
   CDSMaquinasIDMAQUINA.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSMaquinasIDMAQUINA.AsInteger);
  inherited;
   HabilitaEdicao;
   DBNUMERODESERIE.Enabled:=true;
   DBDESCR.Enabled:=true;
   FocusControl(DBNUMERODESERIE);
   EdtBusca.Enabled:=false;


end;

procedure TFrmCadMaquinas.BtnCancelarClick(Sender: TObject);
begin
   CDSMaquinas.Cancel;
   CDSMaquinas.Close;
   SQLMaquinas.Close;

   EdtBusca.Clear;
   DBNUMERODESERIE.Clear;
   DBDESCR.Clear;
   DesabilitaEdicao;
  inherited;

end;

procedure TFrmCadMaquinas.BtnGravarClick(Sender: TObject);
begin

If (CDSMaquinasDESC_MAQ.AsString = '') or  (CDSMaquinasNUMSERIE_MAQ.AsString = '')Then
   Begin
     ShowMessage('O Atributo em branco é Obrigatório...');
     PANDADOS.Enabled:= True;
     if (DBDESCR.Text= '') then
      begin
           if DBDESCR.CanFocus then FocusControl(DBDESCR);
            Exit;
      end
      else
         begin
           if DBNUMERODESERIE.CanFocus then FocusControl(DBNUMERODESERIE);
            Exit;
        end;
 End
  else
     begin
        CDSMaquinas.Post;

        //ApplyUpdates, aplica as alterações no BD  ........ Comit
        CDSMaquinas.ApplyUpdates(0);
        DBNUMERODESERIE.Clear;  DBDESCR.Clear;  DBNUMERODESERIE.Enabled:=False;
        DBDESCR.Enabled:=False;
        EdtBusca.Clear;
    end;
  inherited;

end;

procedure TFrmCadMaquinas.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBNUMERODESERIE.Enabled:=True;
                  DBDESCR.Enabled:=True;

              End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT MAQUINAS.IDMAQUINA, MAQUINAS.STATUS_MAQ FROM MAQUINAS ' +
                                                ' WHERE MAQUINAS.IDMAQUINA = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDMAQUINA').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_MAQ').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSMaquinas.Close;
                              SQLMaquinas.Close;
                              SQLMaquinas.ParamByName('PARMAQ').AsInteger := StrToInt(Edtbusca.Text);
                              SQLMaquinas.Open;
                              CDSMaquinas.Open;

                              CDSMaquinas.Edit;

                              HabilitaEdicao;
                              DBNUMERODESERIE.Enabled:=True;
                               DBDESCR.Enabled:=True;

                            FocusControl(DBNUMERODESERIE);
                              
                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Maquina Desativada !');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Maquina Inexistente !');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada


  inherited;

end;

procedure TFrmCadMaquinas.BtnBuscarClick(Sender: TObject);
begin
  inherited;
   SQLMaquinas.ParamByName('PARMAQ').AsInteger := 0;
  Application.CreateForm(TFrmBusMaq,FrmBusMaq);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusMaq.QuemChama := 'MAQUINAS';

  FrmBusMaq.ShowModal;
  FrmBusMaq.Free;

  IF (SQLMaquinas.ParamByName('PARMAQ').AsInteger > 0 ) THEN
    BEGIN
      SQLMaquinas.Open;
      CDSMaquinas.Open;

      CDSMaquinas.Edit;
      EdtBusca.Text := IntToStr(CDSMaquinasIDMAQUINA.Asinteger);
      HabilitaEdicao;
    END;

end;

procedure TFrmCadMaquinas.BtnStatusClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TFrmStatusMaq,FrmStatusMaq);
  FrmStatusMaq.ShowModal;
  FrmStatusMaq.Free;
end;

procedure TFrmCadMaquinas.DBNUMERODESERIEEnter(Sender: TObject);
begin
  inherited;
DBNUMERODESERIE.Color:= clSilver;
end;

procedure TFrmCadMaquinas.DBNUMERODESERIEExit(Sender: TObject);
begin
  inherited;
DBNUMERODESERIE.Color:= clWindow;
CDSMaquinasNUMSERIE_MAQ.AsString:= trim (CDSMaquinasNUMSERIE_MAQ.AsString);
end;

procedure TFrmCadMaquinas.DBDESCREnter(Sender: TObject);
begin
  inherited;

DBDESCR.Color:= clSilver;
end;

procedure TFrmCadMaquinas.DBDESCRExit(Sender: TObject);
begin
  inherited;

DBDESCR.Color:= clWindow;
CDSMaquinasDESC_MAQ.AsString:= trim (CDSMaquinasDESC_MAQ.AsString);
end;

end.
