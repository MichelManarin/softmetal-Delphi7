unit U_CadTipoLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, ExtCtrls, ComCtrls, StdCtrls, Mask, RzEdit, RzLabel,
  RzPanel, RzButton, FMTBcd, RzDBEdit, DB, SqlExpr, Provider, DBClient;

type
  TFrmCadTipoLog = class(TFrmObjetoCAD)
    DSTL: TDataSource;
    CDSTL: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLTL: TSQLDataSet;
    SQLTLIDTIPOLOG: TIntegerField;
    SQLTLNOME_LOG: TStringField;
    SQLTLSTATUS_LOG: TStringField;
    CDSTLIDTIPOLOG: TIntegerField;
    CDSTLNOME_LOG: TStringField;
    CDSTLSTATUS_LOG: TStringField;
    Label1: TLabel;
    DBNOME: TRzDBEdit;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTipoLog: TFrmCadTipoLog;

implementation

uses UDM, U_BusTipoLog, U_StatusTipoLog;

{$R *.dfm}

procedure TFrmCadTipoLog.BtnNovoClick(Sender: TObject);
begin

  //Desligando os datasets
   CDSTL.Close;  /// ou cdscli.active := false;
   SQLTL.Close;

   //Zerando o parametro
   SQLTL.ParamByName('PARTIPOLOG').AsInteger := 0;

   //Ativando os datasets
   SQLTL.Open; // ou sqlcli.active := true;
   CDSTL.Open;

   //Inserindo um registro novo no final da entidade
   CDSTL.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSTLSTATUS_LOG.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDTIPOLOG) FROM TIPOLOG';
   DM.SqlAuxiliar.Open;
   CDSTLIDTIPOLOG.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSTLIDTIPOLOG.AsInteger);

  inherited;
     DBNOME.Enabled:=true;
   FocusControl(DBNOME);
   EdtBusca.Enabled:=false;

end;

procedure TFrmCadTipoLog.BtnCancelarClick(Sender: TObject);
begin
CDSTL.Cancel;
   CDSTL.Close;
   SQLTL.Close;
   DBNOME.Clear;
   EdtBusca.Clear;
   DesabilitaEdicao;
  inherited;

end;

procedure TFrmCadTipoLog.BtnGravarClick(Sender: TObject);
begin
  inherited;
If (CDSTLNOME_LOG.AsString = '') Then
   Begin
     ShowMessage('O Atributo Nome é Obrigatório...');
     PANDADOS.Enabled:= True;
     DBNOME.Enabled:= true;
     if DBNOME.CanFocus then FocusControl(DBNOME);

     Exit;
   End
 else
  begin
      //Post salva as alterações no DataSet
      CDSTL.Post;

      //ApplyUpdates, aplica as alterações no BD  ........ Comit
      CDSTL.ApplyUpdates(0);
      EdtBusca.Clear;
      DBNOME.Clear;
      PANDADOS.Enabled:= false;

  end;
end;

procedure TFrmCadTipoLog.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBNOME.Enabled:=True;
              End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT TIPOLOG.IDTIPOLOG, TIPOLOG.NOME_LOG,TIPOLOG.STATUS_LOG FROM TIPOLOG ' +
                                                ' WHERE TIPOLOG.IDTIPOLOG = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDTIPOLOG').AsInteger > 0) Then
                    Begin
                      
                 
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_LOG').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSTL.Close;
                              SQLTL.Close;
                              SQLTL.ParamByName('PARTIPOLOG').AsInteger := StrToInt(Edtbusca.Text);
                              SQLTL.Open;
                              CDSTL.Open;

                              CDSTL.Edit;
                              If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;
                               DBNOME.Enabled:=True;
                              end;

                            FocusControl(DBNOME);

                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Tipo Logradouro Desativado');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Tipo Logradouro Inexistente');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada

  inherited;

end;

procedure TFrmCadTipoLog.BtnBuscarClick(Sender: TObject);
begin
  inherited;
   SQLTL.ParamByName('PARTIPOLOG').AsInteger := 0;
  Application.CreateForm(TFrmBusTipoLog,FrmBusTipoLog);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusTipoLog.QuemChama := 'BAIRROS';

  FrmBusTipoLog.ShowModal;
  FrmBusTipoLog.Free;

  IF (SQLTL.ParamByName('PARTIPOLOG').AsInteger > 0 ) THEN
    BEGIN
      SQLTL.Open;
      CDSTL.Open;

      CDSTL.Edit;
      EdtBusca.Text := IntToStr(CDSTLIDTIPOLOG.Asinteger);
      HabilitaEdicao;
    END;

end;

procedure TFrmCadTipoLog.BtnStatusClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TFrmStatusTipoLog,FrmStatusTipoLog);
 FrmStatusTipoLog.ShowModal;
  FrmStatusTipoLog.Free;
end;

end.
