unit U_CadBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel,
  ComCtrls;

type
  TFrmCadBairros = class(TFrmObjetoCAD)
    DSBairros: TDataSource;
    CDSBairros: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLBairros: TSQLDataSet;
    CDSBairrosIDBAIRRO: TIntegerField;
    CDSBairrosNOME_BAIRRO: TStringField;
    CDSBairrosSTATUS_BAIRRO: TStringField;
    SQLBairrosIDBAIRRO: TIntegerField;
    SQLBairrosNOME_BAIRRO: TStringField;
    SQLBairrosSTATUS_BAIRRO: TStringField;
    Label1: TLabel;
    DBNOME: TRzDBEdit;
    RzLabel1: TRzLabel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBNOMEEnter(Sender: TObject);
    procedure DBNOMEExit(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadBairros: TFrmCadBairros;

implementation

uses UDM, Math, U_BusBairro, U_StatusCidade, U_StatusBairro;

{$R *.dfm}

procedure TFrmCadBairros.BtnNovoClick(Sender: TObject);
begin
   //Desligando os datasets
   CDSBairros.Close;  /// ou cdscli.active := false;
   SQLBairros.Close;

   //Zerando o parametro
   SQLBairros.ParamByName('PARBAIRRO').AsInteger := 0;

   //Ativando os datasets
   SQLBairros.Open; // ou sqlcli.active := true;
   CDSBairros.Open;

   //Inserindo um registro novo no final da entidade
   CDSBairros.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSBairrosSTATUS_BAIRRO.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDBAIRRO) FROM BAIRROS';
   DM.SqlAuxiliar.Open;
   CDSBairrosIDBAIRRO.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSBairrosIDBAIRRO.AsInteger);

   inherited;
   // Configurando Campos
   DBNOME.Enabled:=true;
   FocusControl(DBNOME);
   EdtBusca.Enabled:=false;
end;

procedure TFrmCadBairros.BtnCancelarClick(Sender: TObject);
begin
   CDSBairros.Cancel;
   CDSBairros.Close;
   SQLBairros.Close;
   DBNOME.Clear;
   EdtBusca.Clear;
   DesabilitaEdicao;
  inherited;
end;

procedure TFrmCadBairros.BtnGravarClick(Sender: TObject);
begin

  If (CDSBairrosNOME_BAIRRO.AsString = '') Then
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
      CDSBairros.Post;

      //ApplyUpdates, aplica as alterações no BD  ........ Comit
      CDSBairros.ApplyUpdates(0);
      EdtBusca.Clear;
      DBNOME.Clear;
      PANDADOS.Enabled:= false;

      inherited;
  end;
end;

procedure TFrmCadBairros.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
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
                  DM.SqlAuxiliar.CommandText := ' SELECT BAIRROS.IDBAIRRO, BAIRROS.STATUS_BAIRRO FROM BAIRROS ' +
                                                ' WHERE BAIRROS.IDBAIRRO = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDBAIRRO').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_BAIRRO').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSBairros.Close;
                              SQLBairros.Close;
                              SQLBairros.ParamByName('PARBAIRRO').AsInteger := StrToInt(Edtbusca.Text);
                              SQLBairros.Open;
                              CDSBairros.Open;

                              CDSBairros.Edit;
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

  inherited;

end;

procedure TFrmCadBairros.DBNOMEEnter(Sender: TObject);
begin
  inherited;
DBNOME.Color    := clsilver;
end;

procedure TFrmCadBairros.DBNOMEExit(Sender: TObject);
begin
  inherited;
DBNOME.Color    := clWindow;
 CDSBairrosNOME_BAIRRO.AsString:=Trim(CDSBairrosNOME_BAIRRO.AsString);
end;

procedure TFrmCadBairros.BtnBuscarClick(Sender: TObject);
begin
   SQLBairros.ParamByName('PARBAIRRO').AsInteger := 0;
  Application.CreateForm(TFrmBusBairros,FrmBusBairros);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusBairros.QuemChama := 'BAIRROS';

  FrmBusBairros.ShowModal;
  FrmBusBairros.Free;

  IF (SQLBairros.ParamByName('PARBAIRRO').AsInteger > 0 ) THEN
    BEGIN
      SQLBairros.Open;
      CDSBairros.Open;

      CDSBairros.Edit;
      EdtBusca.Text := IntToStr(CDSBairrosIDBAIRRO.Asinteger);
      HabilitaEdicao;
      PANDADOS.Enabled:= TRUE;
      DBNOME.Enabled:= TRUE;
      IF DBNOME.CanFocus THEN FocusControl(DBNOME);
    END;

end;

procedure TFrmCadBairros.BtnStatusClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TFrmStatusBai,FrmStatusBai);
  FrmStatusBai.ShowModal;
  FrmStatusBai.Free;
end;






END.
