unit U_CadGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, ExtCtrls, ComCtrls, StdCtrls, Mask, RzEdit, RzLabel,
  RzPanel, RzButton, FMTBcd, SqlExpr, Provider, DB, DBClient, RzDBEdit,
  DBCtrls;

type
  TFrmCadGrup = class(TFrmObjetoCAD)
    DSGru: TDataSource;
    CDSGru: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLGru: TSQLDataSet;
    SQLGruIDGRUPO: TIntegerField;
    SQLGruNOME_GRU: TStringField;
    SQLGruDESC_GRU: TStringField;
    SQLGruSTATUS_GRU: TStringField;
    CDSGruIDGRUPO: TIntegerField;
    CDSGruNOME_GRU: TStringField;
    CDSGruDESC_GRU: TStringField;
    CDSGruSTATUS_GRU: TStringField;
    Label1: TLabel;
    DBNOME: TRzDBEdit;
    Label2: TLabel;
    DBDESC: TRzDBEdit;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnGravarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  FrmCadGrup: TFrmCadGrup;

implementation

uses UDM, U_BusGrupos, U_StatusGrup;

{$R *.dfm}

procedure TFrmCadGrup.BtnNovoClick(Sender: TObject);
begin

//Desligando os datasets
   CDSGru.Close;  /// ou cdscli.active := false;
   SQLGru.Close;

   //Zerando o parametro
   SQLGru.ParamByName('PARGRUPO').AsInteger := 0;

   //Ativando os datasets
   SQLGru.Open; // ou sqlcli.active := true;
   CDSGru.Open;

   //Inserindo um registro novo no final da entidade
   CDSGru.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSGruSTATUS_GRU.AsString:= 'A';

   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDGRUPO) FROM GRUPOS';
   DM.SqlAuxiliar.Open;
   CDSGruIDGRUPO.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSGruIDGRUPO.AsInteger);

    inherited;
   // Configurando Campos
   HabilitaEdicao;

   DBNOME.Enabled:= TRUE;
   DBDESC.Enabled:= TRUE;

end;

procedure TFrmCadGrup.BtnCancelarClick(Sender: TObject);
begin

 //Cancelando a inclusão ou alteração do registro
  CDSGru.Cancel;
  //Desativandio os datasets
  CDSGru.Close;
  SQLGru.Close;
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

   DBNOME.Clear;
   DBDESC.Clear;
   EdtBusca.Enabled:=true;
   DBNOME.Enabled:=false;
   DBDESC.Enabled:=false;
   EdtBusca.Clear;


end;

procedure TFrmCadGrup.BtnGravarClick(Sender: TObject);
begin
  inherited;
	 If (CDSGruNOME_GRU.Text = '') OR (CDSGruDESC_GRU.Text ='')  Then
		   Begin
					 ShowMessage('O Atributo em branco é Obrigatório...');
					 PANDADOS.Enabled:= True;

                 HabilitaEdicao;
                 Exit;

       End
						else
								begin
								  //Post salva as alterações no DataSet
								  CDSGru.Post;

								  //ApplyUpdates, aplica as alterações no BD  ........ Comit
								  CDSGru.ApplyUpdates(0);
								  EdtBusca.Clear;
								  PANDADOS.Enabled:= false;

								   DBNOME.Clear;
								   DBDESC.Clear;
                    DBNOME.Enabled:=false;
                    DBDESC.Enabled:=false;
								
							  end;
                  inherited;
end;

procedure TFrmCadGrup.BtnGravarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
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
                  DM.SqlAuxiliar.CommandText := ' SELECT GRUPOS.IDGRUPO, GRUPOS.STATUS_GRU FROM GRUPOS ' +
                                                ' WHERE GRUPOS.IDGRUPO = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDGRUPO').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_GRU').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSGru.Close;
                              SQLGru.Close;
                              SQLGru.ParamByName('PARGRUPO').AsInteger := StrToInt(Edtbusca.Text);
                              SQLGru.Open;
                              CDSGru.Open;

                              CDSGru.Edit;
                              If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;
                               DBNOME.Enabled:=True;
                              end;

                            FocusControl(DBNOME);

                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Bairro Desativado');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Bairro Inexistente');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada

end;

procedure TFrmCadGrup.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
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
                  DM.SqlAuxiliar.CommandText := ' SELECT GRUPOS.IDGRUPO, GRUPOS.STATUS_GRU FROM GRUPOS ' +
                                                ' WHERE GRUPOS.IDGRUPO = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDGRUPO').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_GRU').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSGru.Close;
                              SQLGru.Close;
                              SQLGru.ParamByName('PARGRUPO').AsInteger := StrToInt(Edtbusca.Text);
                              SQLGru.Open;
                              CDSGru.Open;

                              CDSGru.Edit;
                              DBNOME.Enabled:=true;
                              DBDESC.Enabled:=true;




                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Grupo Desativado');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Grupo Inexistente');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada

  inherited;

end;

procedure TFrmCadGrup.BtnBuscarClick(Sender: TObject);
begin
  inherited;
SQLGru.ParamByName('PARGRUPO').AsInteger := 0;
  Application.CreateForm(TFrmBusGrup,FrmBusGrup);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusGrup.QuemChama := 'CONDICOES';

  FrmBusGrup.ShowModal;
  FrmBusGrup.Free;

  IF (SQLGru.ParamByName('PARGRUPO').AsInteger > 0 ) THEN
    BEGIN
      SQLGru.Open;
      CDSGru.Open;

      CDSGru.Edit;
      EdtBusca.Text := IntToStr(CDSGruIDGRUPO.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadGrup.BtnStatusClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmStatusGrup,FrmStatusGrup);
  FrmStatusGrup.ShowModal;
  FrmStatusGrup.Free;
end;

end.
