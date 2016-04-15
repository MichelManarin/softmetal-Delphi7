unit U_CadFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, RzPanel, RzButton, ExtCtrls, FMTBcd, SqlExpr,
  Provider, DB, DBClient, RzDBEdit, StdCtrls, Mask, RzEdit, RzLabel,
  ComCtrls, DBCtrls, RzRadGrp, RzDBRGrp, Grids, DBGrids, RzDBGrid,
  RzCmboBx, RzDBCmbo;

type
  TFrmCadFun = class(TFrmObjetoCAD)
    DSFUN: TDataSource;
    CDSFUN: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLFUN: TSQLDataSet;
    Label3: TLabel;
    DBNOMEFU: TRzDBEdit;
    Label13: TLabel;
    DBCPFFUN: TRzDBEdit;
    DBRGFUN: TRzDBEdit;
    Label14: TLabel;
    DBCARTFUN: TRzDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBDATANASC: TRzDBDateTimeEdit;
    DBCOMPLFUN: TRzDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBEMAILLL: TRzDBEdit;
    Label19: TLabel;
    DBFONE: TRzDBEdit;
    DBFONEOPC: TRzDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBOBSER: TRzDBEdit;
    DBIDCEP: TRzDBEdit;
    RzLabel1: TRzLabel;
    DSLIGA: TDataSource;
    SQLCARGOS: TSQLDataSet;
    CDSCARGOS: TClientDataSet;
    DSCARGOS: TDataSource;
    GridCargos: TRzDBGrid;
    DBSEXOFUN: TRzDBComboBox;
    Label24: TLabel;
    Label25: TLabel;
    SQLFUNIDFUNCIONARIO: TIntegerField;
    SQLFUNNOME_FUN: TStringField;
    SQLFUNCPF_FUN: TStringField;
    SQLFUNRG_FUN: TStringField;
    SQLFUNCART_FUN: TStringField;
    SQLFUNDTANASC_FUN: TDateField;
    SQLFUNCOMP_FUN: TStringField;
    SQLFUNEMAIL_FUN: TStringField;
    SQLFUNSEXO_FUN: TStringField;
    SQLFUNFONE1_FUN: TStringField;
    SQLFUNFONE2_FUN: TStringField;
    SQLFUNOBS_FUN: TStringField;
    SQLFUNSTATUS_FUN: TStringField;
    SQLFUNIDCEP_CEP: TIntegerField;
    SQLFUNCEP_CEP: TStringField;
    SQLCARGOSID_CARFUN: TIntegerField;
    SQLCARGOSIDCARGO: TIntegerField;
    SQLCARGOSIDFUNCIONARIO: TIntegerField;
    SQLCARGOSDTADM_FUN: TDateField;
    SQLCARGOSDTDEMI_FUN: TDateField;
    SQLCARGOSSTATUS: TStringField;
    SQLCARGOSNOME_CARGO: TStringField;
    CDSFUNIDFUNCIONARIO: TIntegerField;
    CDSFUNNOME_FUN: TStringField;
    CDSFUNCPF_FUN: TStringField;
    CDSFUNRG_FUN: TStringField;
    CDSFUNCART_FUN: TStringField;
    CDSFUNDTANASC_FUN: TDateField;
    CDSFUNCOMP_FUN: TStringField;
    CDSFUNEMAIL_FUN: TStringField;
    CDSFUNSEXO_FUN: TStringField;
    CDSFUNFONE1_FUN: TStringField;
    CDSFUNFONE2_FUN: TStringField;
    CDSFUNOBS_FUN: TStringField;
    CDSFUNSTATUS_FUN: TStringField;
    CDSFUNIDCEP_CEP: TIntegerField;
    CDSFUNCEP_CEP: TStringField;
    CDSFUNSQLCARGOS: TDataSetField;
    CDSCARGOSID_CARFUN: TIntegerField;
    CDSCARGOSIDCARGO: TIntegerField;
    CDSCARGOSIDFUNCIONARIO: TIntegerField;
    CDSCARGOSDTADM_FUN: TDateField;
    CDSCARGOSDTDEMI_FUN: TDateField;
    CDSCARGOSSTATUS: TStringField;
    CDSCARGOSNOME_CARGO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
    procedure GridCargosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridCargosEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadFun: TFrmCadFun;

implementation

uses UDM, U_BusFuncionario, U_BusFornecedor, U_StatusFun, U_BusCargo, Math;

{$R *.dfm}

procedure TFrmCadFun.BtnNovoClick(Sender: TObject);
begin


//Desligando os datasets
   CDSFUN.Close;  /// ou cdscli.active := false;
   SQLFUN.Close;

   //Zerando o parametro
   SQLFUN.ParamByName('PARFUN').AsInteger := 0;

   //Ativando os datasetws
   SQLFUN.Open; // ou sqlcli.active := true;
   CDSFUN.Open;

   //Inserindo um registro novo no final da entidade
   CDSFUN.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSFUNSTATUS_FUN.AsString  := 'A';
  //CDSCARGOSSTATUS.AsString   := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDFUNCIONARIO) FROM FUNCIONARIOS';
   DM.SqlAuxiliar.Open;
   CDSFUNIDFUNCIONARIO.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSFUNIDFUNCIONARIO.AsInteger);

   //CDSCARGOSDTADM_FUN.Text:=date;

  inherited;

   DBNOMEFU.Enabled:=true; DBCPFFUN.Enabled:=true; DBRGFUN.Enabled:=true;
   DBSEXOFUN.Enabled:=true; DBDataNASC.Enabled:=true; DBFONE.Enabled:=true;
   DBFONEOPC.Enabled:=true; DBCARTFUN.Enabled:=true; DBEMAILLL.Enabled:=true;
   DBOBSER.Enabled:=true; DBCOMPLFUN.Enabled:=true; DBIDCEP.Enabled:=true;

   EdtBusca.Enabled:=false;

   GridCargos.Enabled:=TRUE;



end;

procedure TFrmCadFun.BtnCancelarClick(Sender: TObject);
begin
   DBNOMEFU.Enabled:=false; DBCPFFUN.Enabled:=false; DBRGFUN.Enabled:=false; DBCARTFUN.Enabled:=false;
   DBDATANASC.Enabled:=false; DBCOMPLFUN.Enabled:=false; DBEMAILLL.Enabled:=false;
   DBSEXOFUN.Enabled:=false; DBOBSER.Enabled:=false; DBFONE.Enabled:=false; DBFONEOPC.Enabled:=false;

   DBNOMEFU.Clear; DBCPFFUN.Clear; DBRGFUN.Clear; DBCARTFUN.Clear;
   DBDATANASC.Clear; DBCOMPLFUN.Clear; DBEMAILLL.Clear;
   DBSEXOFUN.Clear; DBOBSER.Clear; DBFONE.Clear; DBFONEOPC.Clear; EdtBusca.Clear;

   CDSFUN.Cancel;
   CDSFUN.Close;
   SQLFUN.Close;
   EdtBusca.Enabled:=true;
  inherited;

end;

procedure TFrmCadFun.BtnGravarClick(Sender: TObject);
begin
If (CDSFUNNOME_FUN.AsString = '') Then
   Begin
     ShowMessage('O Atributo Nome é Obrigatório...');
     DBNOMEFU.SetFocus;
     Exit;
   End;
       //  DM.SqlAuxiliar.Close;
            //    DM.SqlAuxiliar.CommandText := ' SELECT CARGOS.NOME_CARGO FROM CARGOS ' +
              //                                  ' WHERE CARGOS.NOME_CARGO = ' + QuotedStr(DBNOME_CARGO.Text);
           //     DM.SqlAuxiliar.Open;



  //Post salva as alterações no DataSet
  CDSFUN.Post;

  //ApplyUpdates, aplica as alterações no BD  ........ Comit
  CDSFUN.ApplyUpdates(0);
  DBNOMEFU.Clear;
  DBNOMEFU.Clear;
  EdtBusca.Clear;
  GridCargos.Enabled:=False;

   

  GridCargos.Enabled:=FALSE;
  inherited;

end;

procedure TFrmCadFun.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBNOMEFU.Enabled:=True;
                  DBCPFFUN.Enabled:=True;
                  DBRGFUN.Enabled:=True;
                  DBCARTFUN.Enabled:=True;
                  DBDATANASC.Enabled:=True;
                  DBCOMPLFUN.Enabled:=True;
                  DBEMAILLL.Enabled:=True;
                  DBSEXOFUN.Enabled:=True;
                  DBOBSER.Enabled:=True;
                  DBFONE.Enabled:=True;
                  DBFONEopc.Enabled:=True;

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
                              CDSFUN.Close;
                              SQLFUN.Close;
                              SQLFUN.ParamByName('PARFUN').AsInteger := StrToInt(Edtbusca.Text);
                              SQLFUN.Open;
                              CDSFUN.Open;

                              CDSFUN.Edit;

                              HabilitaEdicao;
                              DBNOMEFU.Enabled:=True;
                  DBCPFfun.Enabled:=True;
                  DBRGfun.Enabled:=True;
                  DBCARTFUN.Enabled:=True;
                  DBDATANASC.Enabled:=True;
                  DBCOMPLFUN.Enabled:=True;
                  DBEMAILLL.Enabled:=True;
                  DBSEXOFUN.Enabled:=True;
                  DBOBSER.Enabled:=True;
                  DBFONE.Enabled:=True;
                  DBFONEOPC.Enabled:=True;

                            FocusControl(DBNOMEFU);
                            DBSEXOFUN.Items.Add('M');
                            DBSEXOFUN.Items.ADD('F');
                            DBSEXOFUN.Text:=CDSFUNSEXO_FUN.AsString;

                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('FUNCIONARIO Desativado...');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('FUNCIONARIO Inexistente...');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada




  inherited;

end;

procedure TFrmCadFun.BtnBuscarClick(Sender: TObject);
begin
  inherited;
   SQLFUN.ParamByName('PARFUNCIONARIO').AsInteger := 0;
  Application.CreateForm(TFrmBusFun,FrmBusFun);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusFun.QuemChama := 'BAIRROS';

  FrmBusFun.ShowModal;
  FrmBusFun.Free;

  IF (SQLFUN.ParamByName('PARFUNCIONARIO').AsInteger > 0 ) THEN
    BEGIN
      SQLFUN.Open;
      CDSFUN.Open;

      CDSFUN.Edit;
      EdtBusca.Text := IntToStr(CDSFUNIDFUNCIONARIO.Asinteger);
      HabilitaEdicao;
    END;

end;

procedure TFrmCadFun.BtnStatusClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TFrmStatusFun,FrmStatusFun);
  FrmStatusFun.ShowModal;
  FrmStatusFun.Free;
end;

procedure TFrmCadFun.GridCargosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR
  DATA : STRING;
begin

  
   //F1 - INCLUIR CARGO
   IF (KEY = VK_F1) THEN
     BEGIN
        CDSCARGOS.First;


        IF (CDSCARGOSSTATUS.AsString ='A') THEN
          BEGIN
              IF (MessageDlg('Confirma Inclusão de Cargo ?',mtConfirmation,[mbyes,mbno],0) = MRYES) THEN
                BEGIN
                  Try
                   DATA := InputBox('Desligamento de Cargo...','Informe a Data de Desligamento',DateToStr(date));
                  Except
                   DATA := DATETOSTR(DATE);
                  End;

                  CDSCARGOS.Edit;
                  CDSCARGOSDTDEMI_FUN.AsDateTime := STRTODATE(DATA);
                  CDSCARGOSSTATUS.AsString       := 'C'; // O VALOR (D) IDENTIFICA DESLIGADO DA FUNÇÃO
                  CDSCARGOS.Post;
                  CDSCARGOS.ApplyUpdates(0);

                  //CHAMAR A BUSCA DE CARGOS
                  Application.CreateForm(TFrmBusCargos,FrmBusCargos);
                  FrmBusCargos.QuemChama := 'FUNCIONARIOS';
                  FrmBusCargos.ShowModal;
                  FrmBusCargos.Free;

                END;
          END
        ELSE
          BEGIN
              IF (CDSFUNNOME_FUN.AsString <> '') THEN
                BEGIN
                    //CHAMAR A BUSCA DE CARGOS
                    Application.CreateForm(TFrmBusCargos,FrmBusCargos);
                    FrmBusCargos.QuemChama := 'FUNCIONARIOS';
                    FrmBusCargos.ShowModal;
                    FrmBusCargos.Free;
                END
              ELSE
                BEGIN
                    ShowMessage('Os Atributos Obrigatórios não Foram Preenchidos.');
                    FocusControl(DBNOMEFU);
                END;
          END;
     END;





   //F2 - DESATIVAR CARGO
   IF (key = vk_F2)  THEN
     BEGIN
              CDSCARGOS.First;
              IF (CDSCARGOSSTATUS.AsString = 'A') THEN
                BEGIN
                      IF (MessageDlg('Confirma o Desligamento do Cargo do Funcionário?',mtConfirmation,[mbyes,mbno],0) = MRYES) THEN
                        BEGIN
                          Try
                           DATA := InputBox('Desligamento de Cargo...','Informe a Data de Desligamento',DateToStr(date));
                          Except
                           DATA := DATETOSTR(DATE);
                          End;

                          CDSCARGOS.Edit;
                          CDSCARGOSDTDEMI_FUN.AsDateTime := STRTODATE(DATA);
                          CDSCARGOSSTATUS.AsString       := 'D'; // O VALOR (D) IDENTIFICA DESLIGADO DA FUNÇÃO
                          CDSCARGOS.Post;
                          CDSCARGOS.ApplyUpdates(0);
                        End;
                END;
     END;

end;

procedure TFrmCadFun.GridCargosEnter(Sender: TObject);
begin
  inherited;
if (DBNOMEFU.Text='') and (DBCPFFUN.Text='') and (DBRGFUN.Text='') and
  (DBIDCEP.Text='') and (DBSEXOFUN.Text='') and (DBDATANASC.Text='') and
  (DBFONE.Text='' ) and (DBCARTFUN.Text= '') then
  begin

      ShowMessage('Existe campos obrigatórios não cadastrados...');
      FocusControl(DBNOMEFU);
      exit;


      DM.SqlAuxiliar.Close;
      DM.SqlAuxiliar.CommandText := 'SELECT MAX(ID_CARFUN) FROM CARGOS_FUN';
      DM.SqlAuxiliar.Open;




  end;
  CDSCARGOSSTATUS.Text:='A';
end;

end.
