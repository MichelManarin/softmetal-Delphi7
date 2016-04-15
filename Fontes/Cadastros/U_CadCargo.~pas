unit U_CadCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, StdCtrls, Mask, RzEdit, DBCtrls, RzDBEdit,
  RzLabel, ComCtrls;

type
  TFrmCadCargos = class(TFrmObjetoCAD)
    DSCargos: TDataSource;
    CDSCargos: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLCargos: TSQLDataSet;
    CDSCargosIDCARGO: TIntegerField;
    CDSCargosNOME_CARGO: TStringField;
    CDSCargosSTATUS_CARGO: TStringField;
    SQLCargosIDCARGO: TIntegerField;
    SQLCargosNOME_CARGO: TStringField;
    SQLCargosSTATUS_CARGO: TStringField;
    Label1: TLabel;
    DBNOME: TRzDBEdit;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure DBNOMEEnter(Sender: TObject);
    procedure DBNOMEExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCargos: TFrmCadCargos;

implementation

uses UDM, U_BusCargo, U_StatusCarg;

{$R *.dfm}

procedure TFrmCadCargos.BtnNovoClick(Sender: TObject);
begin
  //Desligando os datasets
   CDSCargos.Close;  /// ou cdscli.active := false;
   SQLCargos.Close;

   //Zerando o parametro
   SQLCargos.ParamByName('PARCARGO').AsInteger := 0;

   //Ativando os datasetws
   SQLCargos.Open; // ou sqlcli.active := true;
   CDSCargos.Open;

   //Inserindo um registro novo no final da entidade
   CDSCargos.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSCargosSTATUS_CARGO.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDCARGO) FROM CARGOS';
   DM.SqlAuxiliar.Open;
   CDSCargosIDCARGO.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSCargosIDCARGO.AsInteger);



  inherited;

      DBNOME.Enabled:=true;
  FocusControl(DBNOME);
   PANDADOS.Enabled:=True;

   EdtBusca.Enabled:=false;

end;

procedure TFrmCadCargos.BtnCancelarClick(Sender: TObject);
begin


  CDSCargos.Cancel;
   CDSCargos.Close;
   SQLCargos.Close;
   DBNOME.Clear;
   EdtBusca.Clear;
   EdtBusca.Enabled:=true;
   DBNOME.Enabled:=false;
  inherited;

end;

procedure TFrmCadCargos.BtnGravarClick(Sender: TObject);
begin
 
  If (CDSCargosNOME_CARGO.AsString = '') Then
   Begin
     ShowMessage('O Atributo em branco é Obrigatório...');
     PANDADOS.Enabled:= True;
     DBNOME.Enabled:= true;
     if DBNOME.CanFocus then FocusControl(DBNOME);

     Exit;
   End
 else
  begin
      //Post salva as alterações no DataSet
      CDSCargos.Post;

      //ApplyUpdates, aplica as alterações no BD  ........ Comit
      CDSCargos.ApplyUpdates(0);
      EdtBusca.Clear;
      DBNOME.Clear;
      PANDADOS.Enabled:= false;

      inherited;
  end;


end;

procedure TFrmCadCargos.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
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
                  DM.SqlAuxiliar.CommandText := ' SELECT CARGOS.IDCARGO, CARGOS.STATUS_CARGO FROM CARGOS ' +
                                                ' WHERE CARGOS.IDCARGO = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDCARGO').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_CARGO').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSCargos.Close;
                              SQLCargos.Close;
                              SQLCargos.ParamByName('PARCARGO').AsInteger := StrToInt(Edtbusca.Text);
                              SQLCargos.Open;
                              CDSCargos.Open;

                              CDSCargos.Edit;
                                If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;
                               DBNOME.Enabled:=True;
                              end;


                            FocusControl(DBNOME);

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
   End; //End do teste da tecla pressionada

  inherited;

end;

procedure TFrmCadCargos.BtnBuscarClick(Sender: TObject);
begin
  inherited;
  SQLCargos.ParamByName('PARCARGO').AsInteger := 0;
  Application.CreateForm(TFrmBusCargos,FrmBusCargos);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusCargos.QuemChama := 'CARGOS';

  FrmBusCargos.ShowModal;
  FrmBusCargos.Free;

  IF (SQLCargos.ParamByName('PARCARGO').AsInteger > 0 ) THEN
    BEGIN
      SQLCargos.Open;
      CDSCargos.Open;

      CDSCargos.Edit;
      EdtBusca.Text := IntToStr(CDSCargosIDCARGO.Asinteger);
      HabilitaEdicao;
      PANDADOS.Enabled:= True;
      DBNOME.Enabled:= True;
      IF DBNOME.CanFocus THEN FocusControl(DBNOME);
    END;

end;

procedure TFrmCadCargos.BtnStatusClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmStatusCar,FrmStatusCar);
 FrmStatusCar.ShowModal;
  FrmStatusCar.Free;
end;

procedure TFrmCadCargos.DBNOMEEnter(Sender: TObject);
begin
  inherited;
DBNOME.Color:= clSilver;
end;

procedure TFrmCadCargos.DBNOMEExit(Sender: TObject);
begin
  inherited;

DBNOME.Color:= clWindow;
CDSCargosNOME_CARGO.AsString:= TRIM (CDSCargosNOME_CARGO.AsString);
end;


end.
