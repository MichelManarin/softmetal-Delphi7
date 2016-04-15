unit U_CadCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, StdCtrls, Mask, RzEdit, DBCtrls, RzDBEdit,
  RzLabel, ComCtrls, RzCmboBx, RzDBCmbo;

type
  TFrmCadCidades = class(TFrmObjetoCAD)
    DSCidades: TDataSource;
    CDSCidades: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLCidades: TSQLDataSet;
    SQLCidadesIDCIDADE: TIntegerField;
    SQLCidadesNOME_CID: TStringField;
    SQLCidadesUF_CID: TStringField;
    SQLCidadesSTATUS_CID: TStringField;
    CDSCidadesIDCIDADE: TIntegerField;
    CDSCidadesNOME_CID: TStringField;
    CDSCidadesUF_CID: TStringField;
    CDSCidadesSTATUS_CID: TStringField;
    Label1: TLabel;
    DBNOME: TRzDBEdit;
    Label2: TLabel;
    DBUF: TRzDBComboBox;
    procedure verificaestado;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure DBNOMEEnter(Sender: TObject);
    procedure DBNOMEExit(Sender: TObject);
    procedure DBUFEnter(Sender: TObject);
    procedure DBUFExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCidades: TFrmCadCidades;

implementation

uses UDM, Math, U_BusCidade, U_StatusCidade;

{$R *.dfm}

procedure TFrmCadCidades.BtnNovoClick(Sender: TObject);
begin
//Desligando os datasets
   CDSCidades.Close;  /// ou cdscli.active := false;
   SQLCidades.Close;

   //Zerando o parametro
   SQLCidades.ParamByName('PARCIDADE').AsInteger := 0;

   //Ativando os datasetws
   SQLCidades.Open; // ou sqlcli.active := true;
   CDSCidades.Open;

   //Inserindo um registro novo no final da entidade
   CDSCidades.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSCidadesSTATUS_CID.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDCIDADE) FROM CIDADES';
   DM.SqlAuxiliar.Open;
   CDSCidadesIDCIDADE.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSCidadesIDCIDADE.AsInteger);

  inherited;
    DBNOME.Enabled:=true;
    DBUF.Enabled:=TRUE;
  FocusControl(DBNOME);
   PANDADOS.Enabled:=True;
   DBUF.Enabled:=true;
   EdtBusca.Enabled:=false;
   if (DBUF.Items.Count=0) then
    begin
      DBUF.Items.Add('PR');
      DBUF.Items.Add('RS');
      DBUF.Items.Add('SC');
    end;


end;

procedure TFrmCadCidades.BtnCancelarClick(Sender: TObject);
begin

  CDSCidades.Cancel;
  CDSCidades.Close;
  SQLCidades.Close;

  DBNOME.Clear;
  DBUF.Clear;
  EdtBusca.Clear;
  DesabilitaEdicao;
  inherited;

end;

procedure TFrmCadCidades.BtnGravarClick(Sender: TObject);
begin
  If (CDSCidadesNOME_CID.AsString = '')  or (CDSCidadesUF_CID.AsString = '') or (CDSCidadesUF_CID.AsString = '') Then
   Begin
     ShowMessage('O Atributo em branco é Obrigatório...');
     PANDADOS.Enabled:= True;
     if (DBNOME.Text= '') then
      begin
           if DBNOME.CanFocus then FocusControl(DBNOME);
            Exit;
      end
      else
         begin
           if DBUF.CanFocus then FocusControl(DBUF);
            Exit;
        end;
 End

 else
    BEGIN
     verificaestado;
     END;
END;



procedure TFrmCadCidades.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT CIDADES.IDCIDADE, CIDADES.STATUS_CID FROM CIDADES ' +
                                                ' WHERE CIDADES.IDCIDADE = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDCIDADE').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_CID').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSCidades.Close;
                              SQLCidades.Close;
                              SQLCidades.ParamByName('PARCIDADE').AsInteger := StrToInt(Edtbusca.Text);
                              DBUF.Items.Add('PR');  DBUF.Items.Add('RS');  DBUF.Items.Add('SC');
                              DBUF.Text:=CDSCidadesUF_CID.AsString;
                              SQLCidades.Open;
                              CDSCidades.Open;
                            //  If(BtnCancelar.Enabled:=false)
                              CDSCidades.Edit;

                              If(BtnCancelar.Enabled=false) then
                              begin
                               HabilitaEdicao;
                             end;
                              DBNOME.Enabled:=True;
                              DBUF.Enabled:=true;

                            FocusControl(DBNOME);
                              
                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Cidade Desativada !');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Cidade Inexistente !');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada


  inherited;

end;

procedure TFrmCadCidades.BtnBuscarClick(Sender: TObject);
begin
  inherited;
SQLCidades.ParamByName('PARCIDADE').AsInteger := 0;
  Application.CreateForm(TFrmBusCid,FrmBusCid);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusCid.QuemChama := 'CIDADES';

  FrmBusCid.ShowModal;
  FrmBusCid.Free;

  IF (SQLCidades.ParamByName('PARCIDADE').AsInteger > 0 ) THEN
    BEGIN
      SQLCidades.Open;
      CDSCidades.Open;

      CDSCidades.Edit;
      EdtBusca.Text := IntToStr(CDSCidadesIDCIDADE.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadCidades.BtnStatusClick(Sender: TObject);
begin

 Application.CreateForm(TFrmStatusCid,FrmStatusCid);
  FrmStatusCid.ShowModal;
  FrmStatusCid.Free;
end;

procedure TFrmCadCidades.verificaestado;

begin
  If    (DBUF.Text = 'AC') OR (DBUF.Text = 'AL') OR (DBUF.Text = 'AP') OR (DBUF.Text = 'AM')
        OR (DBUF.Text ='BA')  OR (DBUF.Text = 'CE') OR (DBUF.Text = 'DF') OR (DBUF.Text = 'ES')
        OR (DBUF.Text ='GO') OR (DBUF.Text = 'MA') OR (DBUF.Text = 'MT') OR (DBUF.Text = 'MS')
        OR (DBUF.Text ='MG') OR (DBUF.Text = 'PA') OR (DBUF.Text = 'PB') OR (DBUF.Text = 'PR')
        OR (DBUF.Text ='PE') OR (DBUF.Text = 'PI') OR (DBUF.Text = 'RJ') OR (DBUF.Text = 'RN')
        OR (DBUF.Text ='RS') OR (DBUF.Text = 'RO') OR (DBUF.Text = 'RR') OR (DBUF.Text = 'SC')
        OR (DBUF.Text ='SP') OR (DBUF.Text = 'SE') OR (DBUF.Text = 'TO')
   Then
        Begin
            //Post salva as alterações no DataSet
      CDSCidades.Post;

      //ApplyUpdates, aplica as alterações no BD  ........ Comit
      CDSCidades.ApplyUpdates(0);
      EdtBusca.Clear;
      DBNOME.Clear;
      DBUF.Clear;
      PANDADOS.Enabled:= false;
      DesabilitaEdicao;
      inherited;
        end

 ELSE
    BEGIN
            ShowMessage('ESTADO INVÁLIDO');
            HabilitaEdicao;
            PANDADOS.Enabled:= True;
            DBNOME.Enabled:=True;
            DBUF.Enabled:=True;
            if DBUF.CanFocus then FocusControl(DBUF);
            Exit;
    END;

END;

procedure TFrmCadCidades.DBNOMEEnter(Sender: TObject);
begin
  inherited;
DBNOME.Color    := clsilver;

end;

procedure TFrmCadCidades.DBNOMEExit(Sender: TObject);
begin
  inherited;
DBNOME.Color    := clWindow;
 CDSCidadesNOME_CID.AsString:=Trim(CDSCidadesNOME_CID.AsString);

end;

procedure TFrmCadCidades.DBUFEnter(Sender: TObject);
begin
  inherited;
  DBUF.Color    := clsilver;
end;

procedure TFrmCadCidades.DBUFExit(Sender: TObject);
begin
  inherited;
DBUF.Color    := clWindow;
 CDSCidadesUF_CID.AsString:=Trim(CDSCidadesUF_CID.AsString);

end;

end.
