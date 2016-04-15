unit U_CadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, StdCtrls, Mask, RzEdit, DBCtrls, RzDBEdit,
  RzLabel, ComCtrls, RzDBCmbo, RzCmboBx, Grids, DBGrids, RzDBGrid;

type
  TFrmCadProd = class(TFrmObjetoCAD)
    Label7: TLabel;
    DBCODIGOBARRA: TRzDBEdit;
    Label1: TLabel;
    DBDESC: TRzDBEdit;
    Label2: TLabel;
    DBOBS: TRzDBEdit;
    Label3: TLabel;
    DBPRECODECUSTO: TRzDBEdit;
    Label4: TLabel;
    DBPRECOMED: TRzDBEdit;
    Label5: TLabel;
    DBPRECOMIN: TRzDBEdit;
    Label6: TLabel;
    DBQTDEST: TRzDBEdit;
    Label8: TLabel;
    DBQTEMAX: TRzDBEdit;
    Label9: TLabel;
    DBQTDMIN: TRzDBEdit;
    Label10: TLabel;
    SQLPRO: TSQLDataSet;
    PROVIDER: TDataSetProvider;
    CDSPRO: TClientDataSet;
    DSPRO: TDataSource;
    SQLPROIDPRODUTOFIN: TIntegerField;
    SQLPROPRECOCUSTO_PRODF: TBCDField;
    SQLPROPRECOMIN_PRODF: TBCDField;
    SQLPROPRECOMED_PRODF: TBCDField;
    SQLPRODESC_PRODF: TStringField;
    SQLPROCODBARRA_PRODF: TStringField;
    SQLPROQTDMIN_PRODF: TBCDField;
    SQLPROQTDMAX_PRODF: TBCDField;
    SQLPROQTDEST_PRODF: TIntegerField;
    SQLPROTAMANHO_PRODF: TStringField;
    SQLPROOBS_PRODF: TStringField;
    SQLPROSTATUS_PRODF: TStringField;
    SQLPRONOME_GRU: TStringField;
    CDSPROIDPRODUTOFIN: TIntegerField;
    CDSPROPRECOCUSTO_PRODF: TBCDField;
    CDSPROPRECOMIN_PRODF: TBCDField;
    CDSPROPRECOMED_PRODF: TBCDField;
    CDSPRODESC_PRODF: TStringField;
    CDSPROCODBARRA_PRODF: TStringField;
    CDSPROQTDMIN_PRODF: TBCDField;
    CDSPROQTDMAX_PRODF: TBCDField;
    CDSPROQTDEST_PRODF: TIntegerField;
    CDSPROTAMANHO_PRODF: TStringField;
    CDSPROOBS_PRODF: TStringField;
    CDSPROSTATUS_PRODF: TStringField;
    CDSPRONOME_GRU: TStringField;
    SQLPROIDGRUPO: TIntegerField;
    CDSPROIDGRUPO: TIntegerField;
    GRIDGRU: TRzDBGrid;
    SQLGru: TSQLDataSet;
    SQLGruIDGRUPO: TIntegerField;
    SQLGruNOME_GRU: TStringField;
    SQLGruSTATUS_GRU: TStringField;
    PROVIDERlistar: TDataSetProvider;
    CDSGru: TClientDataSet;
    CDSGruIDGRUPO: TIntegerField;
    CDSGruNOME_GRU: TStringField;
    CDSGruSTATUS_GRU: TStringField;
    DSGru: TDataSource;
    Label11: TLabel;
    DBCODSEL: TRzDBEdit;
    RzLabel1: TRzLabel;
    SQLPROPRECOMAX_PRODF: TBCDField;
    CDSPROPRECOMAX_PRODF: TBCDField;
    DBPRECOMAX: TRzDBEdit;
    RzLabel2: TRzLabel;
    BtnCagGru: TRzButton;
    Btnbusgrup: TRzButton;
    procedure BtnNovoClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure GRIDGRUDblClick(Sender: TObject);
    procedure BtnCagGruClick(Sender: TObject);
    procedure BtnbusgrupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProd: TFrmCadProd;

implementation

uses UDM, U_BusProduto, U_StatusProd, U_CadGrupo, U_StatusGrup;

{$R *.dfm}

procedure TFrmCadProd.BtnNovoClick(Sender: TObject);
begin
//Desligando os datasets
   CDSPRO.Close;  /// ou cdscli.active := false;
   SQLPRO.Close;
   CDSGru.close;
   SQLGru.close;
   //Zerando o parametro
   SQLPRO.ParamByName('PARPRODUTO').AsInteger := 0;

   //Ativando os datasetws
   SQLPRO.Open; // ou sqlcli.active := true;
   CDSPRO.Open;
   SQLGru.Open;
   CDSGru.Open;

   //Inserindo um registro novo no final da entidade
   CDSPRO.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSPROSTATUS_PRODF.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDPRODUTOFIN) FROM PRODUTOFINAL';
   DM.SqlAuxiliar.Open;
   CDSPROIDPRODUTOFIN.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSPROIDPRODUTOFIN.AsInteger);
   GRIDGRU.Enabled:=TRUE;

  inherited;

  BtnCagGru.Enabled:=true;
  Btnbusgrup.Enabled:=true;


end;

procedure TFrmCadProd.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBOBS.Enabled:=True;
                  DBDESC.Enabled:=True;
                  DBPRECOMED.Enabled:=True;



                  End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT PRODUTOS.IDPRODUTO, PRODUTOS.STATUS_PROD FROM PRODUTOS ' +
                                                ' WHERE PRODUTOS.IDPRODUTO = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDPRODUTO').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_PROD').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSPRO.Close;
                              SQLPRO.Close;
                              SQLPRO.ParamByName('PARPRODUTO').AsInteger := StrToInt(Edtbusca.Text);
                              SQLPRO.Open;
                              CDSPRO.Open;

                              CDSPRO.Edit;

                              HabilitaEdicao;
                              DBOBS.Enabled:=True;
                              DBDESC.Enabled:=True;
                              DBPRECOMED.Enabled:=True;






                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('OPS... Produto Desativado !');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('OPS... Produto Inexistente !');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada

  inherited;

end;

procedure TFrmCadProd.BtnCancelarClick(Sender: TObject);
begin
  CDSPRO.Cancel;
   CDSPRO.Close;
   SQLPRO.Close;
   CDSGru.Cancel;
   CDSGru.Close;
   CDSGru.Close;
  // DBOBSER.Clear; DBDESCR.Clear;   EdtBusca.Clear;  DBPRECOMAX.Clear;  DBPRECOMED.Clear;
 //   DBPRECOMIN.Clear;  DBPRECOCUSTO.Clear;

 //  DBOBSER.Enabled:=false; DBDESCR.Enabled:=false; DBPRECOMAX.Enabled:=false; DBPRECOMED.Enabled:=false;
 // DBPRECOMIN.Enabled:=false; DBPRECOCUSTO.Enabled:=false; EdtBusca.Enabled:=true;
  inherited;

  DBCODIGOBARRA.Clear; DBDESC.Clear; DBOBS.Clear; DBPRECODECUSTO.Clear; DBPRECOMED.Clear;
  DBPRECOMIN.Clear; DBQTDEST.Clear; DBQTEMAX.Clear; DBQTDMIN.Clear; DBCODSEL.Clear;
  DBPRECOMAX.Clear; EdtBusca.Clear;

end;

procedure TFrmCadProd.BtnGravarClick(Sender: TObject);
begin

    If (CDSPROIDGRUPO.AsString = '') Then
   Begin
     ShowMessage('O produto necessita de um grupo...');
     PANDADOS.Enabled:= True;
     if DBCODIGOBARRA.CanFocus then FocusControl(DBCODIGOBARRA);

     Exit;
   End
 else
  begin
      //Post salva as alterações no DataSet
      CDSPRO.Post;

      //ApplyUpdates, aplica as alterações no BD  ........ Comit
      CDSPRO.ApplyUpdates(0);
      EdtBusca.Clear;
      DBCODIGOBARRA.Clear;
      PANDADOS.Enabled:= false;
      BtnCagGru.Enabled:=true;
      Btnbusgrup.Enabled:=true;

      GRIDGRU.Enabled:=FALSE;
      CDSGru.Close;
      SQLGru.CLOSE;
  inherited;

      DBCODIGOBARRA.Clear; DBDESC.Clear; DBOBS.Clear; DBPRECODECUSTO.Clear; DBPRECOMED.Clear;
  DBPRECOMIN.Clear; DBQTDEST.Clear; DBQTEMAX.Clear; DBQTDMIN.Clear; DBCODSEL.Clear;
  DBPRECOMAX.Clear; EdtBusca.Clear;

 end; 

end;

procedure TFrmCadProd.BtnBuscarClick(Sender: TObject);
begin
  inherited;
SQLPRO.ParamByName('PARPRODUTO').AsInteger := 0;
  Application.CreateForm(TFrmBusProd,FrmBusProd);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusProd.QuemChama := 'BAIRROS';

  FrmBusProd.ShowModal;
  FrmBusProd.Free;

  IF (SQLPRO.ParamByName('PARPRODUTO').AsInteger > 0 ) THEN
    BEGIN
      SQLPRO.Open;
      CDSPRO.Open;

      CDSPRO.Edit;
     // EdtBusca.Text := IntToStr(CDSPROIDPRODUTO.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadProd.BtnStatusClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TFrmStatusProd,FrmStatusProd);
 FrmStatusProd.ShowModal;
  FrmStatusProd.Free;
end;

procedure TFrmCadProd.GRIDGRUDblClick(Sender: TObject);
begin
  inherited;

  DBCODSEL.Text := CDSGruIDGRUPO.AsString;
  CDSPROIDGRUPO.Text:= DBCODSEL.text;
         {  //REPASSANDO O VALOR PARA O PARAMETRO DO FORM DE CADASTREO DE CLIENTES
           FrmCadProd.SQLPRO.ParamByName('PARPRODUTO').AsInteger := CDSPROIDPRODUTOFIN.AsInteger;
           CLOSE;}
end;

procedure TFrmCadProd.BtnCagGruClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadGrup,FrmCadGrup);
FrmCadGrup.ShowModal;
FrmCadGrup.free;
end;

procedure TFrmCadProd.BtnbusgrupClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmStatusGrup,FrmStatusGrup);
FrmStatusGrup.ShowModal;
FrmStatusGrup.free;
end;

end.
