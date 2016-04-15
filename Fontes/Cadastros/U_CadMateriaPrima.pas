unit U_CadMateriaPrima;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, StdCtrls, Mask, RzEdit, RzPanel, RzButton, ExtCtrls,
  FMTBcd, SqlExpr, Provider, DB, DBClient, RzDBEdit, DBCtrls, RzLabel,
  ComCtrls;

type
  TFrmCadMatPr = class(TFrmObjetoCAD)
    DSMP: TDataSource;
    CDSMP: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLMP: TSQLDataSet;
    Label2: TLabel;
    DBPRECODECUSTO: TRzDBEdit;
    Label6: TLabel;
    DBQTDEMINIMA: TRzDBEdit;
    DBQTDEMAX: TRzDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBQTDEST: TRzDBEdit;
    DBDESCRICAO: TRzDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBOBSERVACAO: TRzDBEdit;
    SQLMPIDMATEIAPRIMA: TIntegerField;
    SQLMPPRECODECUSTO_MATP: TBCDField;
    SQLMPDESCRICAO_MATP: TStringField;
    SQLMPQTDMIN_MATP: TIntegerField;
    SQLMPQTDMAX_MATP: TIntegerField;
    SQLMPQTDEST_MATP: TBCDField;
    SQLMPOBS_MATP: TStringField;
    SQLMPSTATUS_MATP: TStringField;
    CDSMPIDMATEIAPRIMA: TIntegerField;
    CDSMPPRECODECUSTO_MATP: TBCDField;
    CDSMPDESCRICAO_MATP: TStringField;
    CDSMPQTDMIN_MATP: TIntegerField;
    CDSMPQTDMAX_MATP: TIntegerField;
    CDSMPQTDEST_MATP: TBCDField;
    CDSMPOBS_MATP: TStringField;
    CDSMPSTATUS_MATP: TStringField;
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
  FrmCadMatPr: TFrmCadMatPr;

implementation

uses UDM, U_BusMateriaPrima, U_StatusMatPr;

{$R *.dfm}

procedure TFrmCadMatPr.BtnNovoClick(Sender: TObject);
begin
//Desligando os datasets
   CDSMP.Close;  /// ou cdscli.active := false;
   SQLMP.Close;

   //Zerando o parametro
   SQLMP.ParamByName('PARMATERIAPRIMA').AsInteger := 0;

   //Ativando os datasetws
   SQLMP.Open; // ou sqlcli.active := true;
   CDSMP.Open;

   //Inserindo um registro novo no final da entidade
   CDSMP.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSMPSTATUS_MATP.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDMATEIAPRIMA) FROM MATERIA_PRIMA';
   DM.SqlAuxiliar.Open;
   CDSMPIDMATEIAPRIMA.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSMPIDMATEIAPRIMA.AsInteger);

  inherited;
  DBPRECODECUSTO.Enabled:=true;
   DBQTDEMINIMA.Enabled:=true;
   DBQTDEMAX.Enabled:=true;
   DBQTDEST.Enabled:=true;
   DBDESCRICAO.Enabled:=true;
   DBOBSERVACAO.Enabled:=true;
   FocusControl(DBPRECODECUSTO);
   PANDADOS.Enabled:=True;

   EdtBusca.Enabled:=false;


end;

procedure TFrmCadMatPr.BtnCancelarClick(Sender: TObject);
begin
CDSMP.Cancel;
   CDSMP.Close;
   SQLMP.Close;
   EdtBusca.Clear;
   EdtBusca.Enabled:=true;
   DBPRECODECUSTO.Enabled:=False;
   DBQTDEMINIMA.Enabled:=False;
   DBQTDEMAX.Enabled:=False;
   DBQTDEST.Enabled:=False;
   DBDESCRICAO.Enabled:=False;
   DBOBSERVACAO.Enabled:=False;
  inherited;

end;

procedure TFrmCadMatPr.BtnGravarClick(Sender: TObject);
begin
  inherited;
If (CDSMPPRECODECUSTO_MATP.AsString = '') Then
   Begin
     ShowMessage('O Atributo preço de custo Obrigatório...');
     DBPRECODECUSTO.SetFocus;
     Exit;
   End;
       //  DM.SqlAuxiliar.Close;
            //    DM.SqlAuxiliar.CommandText := ' SELECT CARGOS.NOME_CARGO FROM CARGOS ' +
              //                                  ' WHERE CARGOS.NOME_CARGO = ' + QuotedStr(DBNOME_CARGO.Text);
           //     DM.SqlAuxiliar.Open;



  //Post salva as alterações no DataSet
  CDSMP.Post;

  //ApplyUpdates, aplica as alterações no BD  ........ Comit
  CDSMP.ApplyUpdates(0);
  DBPRECODECUSTO.Clear;
  DBQTDEMINIMA.Clear;
  DBQTDEMAX.Clear;
  DBQTDEST.Clear;
  DBDESCRICAO.Clear;
  DBOBSERVACAO.Clear;
  EdtBusca.Clear;


end;

procedure TFrmCadMatPr.EdtBuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


  inherited;

  If (Key = VK_Return ) Then
   Begin
          If (Trim(Edtbusca.Text) = '' ) Then
              Begin
                  BtnNovo.Click;
                  DBPRECODECUSTO.Enabled:=True;
                  DBQTDEMINIMA.Enabled:=True;
                  DBQTDEMAX.Enabled:=True;
                  DBQTDEST.Enabled:=True;
                  DBDESCRICAO.Enabled:=True;
                  DBOBSERVACAO.Enabled:=True;
                  End //Endo do teste que verifica se o edit está vazio(if)
          Else
              Begin
                  //Testar a existência do registro no banco
                  DM.SqlAuxiliar.Close;
                  DM.SqlAuxiliar.CommandText := ' SELECT MATERIA_PRIMA.IDMATEIAPRIMA, MATERIA_PRIMA.STATUS_MATP FROM MATERIA_PRIMA ' +
                                                ' WHERE MATERIA_PRIMA.IDMATEIAPRIMA = ' + QuotedStr(Edtbusca.Text);
                  DM.SqlAuxiliar.Open;
                  If (DM.SqlAuxiliar.FieldByName('IDMATEIAPRIMA').AsInteger > 0) Then
                    Begin
                        IF (DM.SqlAuxiliar.FieldByName('STATUS_MATP').AsString = 'A') THEN
                          BEGIN
                              //AGORA QUE FOI PRESSIONADO ENTER, COM UM VALOR NO EDIT,
                              // QUE REPRESENTAVA UM CLIENTE EXISTENTE E COM STATUS
                              //ATIVO....VOU EDITÁ-LO
                              CDSMP.Close;
                              SQLMP.Close;
                              SQLMP.ParamByName('PARMATERIAPRIMA').AsInteger := StrToInt(Edtbusca.Text);
                              SQLMP.Open;
                              CDSMP.Open;

                              CDSMP.Edit;

                              HabilitaEdicao;
                              DBPRECODECUSTO.Enabled:=True;
                              DBQTDEMINIMA.Enabled:=True;
                              DBQTDEMAX.Enabled:=True;
                              DBQTDEST.Enabled:=True;
                              DBDESCRICAO.Enabled:=True;
                              DBOBSERVACAO.Enabled:=True;

                            FocusControl(DBPRECODECUSTO);

                          END//END DO IF, ESTÁ ATIVO
                        ELSE
                          BEGIN
                              ShowMessage('Materia prima Desativado...');
                              Edtbusca.Clear;
                             FocusControl(EdtBusca);
                              exit;
                          END;//END DO ELSE, NÃO ESTÁ ATIVO
                    End //end do if quando achou o registro
                  Else
                    Begin
                        ShowMessage('Materia Prima Inexistente...');
                        Edtbusca.Clear;
                        FocusControl(EdtBusca);
                        EdtBusca.Clear;
                        exit;
                    End; //END DO ELSE QUE RESULTOU FALSO NA EXISTENCIA DO REGISTRO
              End;//Endo do teste que verifica se o edit está vazio(else)
   End; //End do teste da tecla pressionada


end;


procedure TFrmCadMatPr.BtnBuscarClick(Sender: TObject);
begin
  inherited;
SQLMP.ParamByName('PARMATERIAPRIMA').AsInteger := 0;
  Application.CreateForm(TFrmBusMatPr,FrmBusMatPr);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusMatPr.QuemChama := 'BAIRROS';

  FrmBusMatPr.ShowModal;
  FrmBusMatPr.Free;

  IF (SQLMP.ParamByName('PARMATERIAPRIMA').AsInteger > 0 ) THEN
    BEGIN
      SQLMP.Open;
      CDSMP.Open;

      CDSMP.Edit;
      EdtBusca.Text := IntToStr(CDSMPIDMATEIAPRIMA.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadMatPr.BtnStatusClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TFrmStatusMatPr,FrmStatusMatPr);
  FrmStatusMatPr.ShowModal;
  FrmStatusMatPr.Free;
end;

end.
