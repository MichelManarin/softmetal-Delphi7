unit U_CadProdFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoCAD, StdCtrls, Mask, RzEdit, RzPanel, RzButton, ExtCtrls,
  FMTBcd, SqlExpr, Provider, DB, DBClient, RzDBEdit, DBCtrls, RzLabel,
  ComCtrls;

type
  TFrmCadProdFin = class(TFrmObjetoCAD)
    DSPF: TDataSource;
    CDSPF: TClientDataSet;
    PROVIDER: TDataSetProvider;
    SQLPF: TSQLDataSet;
    SQLPFIDPRODUTOFIN: TIntegerField;
    SQLPFIDGRUPO: TIntegerField;
    SQLPFPRECOCUSTO_PRODF: TBCDField;
    SQLPFPRECOMIN_PRODF: TBCDField;
    SQLPFPRECOMED_PRODF: TBCDField;
    SQLPFPRECOMAX_PRODF: TBCDField;
    SQLPFDESC_PRODF: TStringField;
    SQLPFCODBARRA_PRODF: TStringField;
    SQLPFQTDMIN_PRODF: TBCDField;
    SQLPFQTDMAX_PRODF: TBCDField;
    SQLPFQTDEST_PRODF: TIntegerField;
    SQLPFTAMANHO_PRODF: TStringField;
    SQLPFOBS_PRODF: TStringField;
    SQLPFSTATUS_PRODF: TStringField;
    CDSPFIDPRODUTOFIN: TIntegerField;
    CDSPFIDGRUPO: TIntegerField;
    CDSPFPRECOCUSTO_PRODF: TBCDField;
    CDSPFPRECOMIN_PRODF: TBCDField;
    CDSPFPRECOMED_PRODF: TBCDField;
    CDSPFPRECOMAX_PRODF: TBCDField;
    CDSPFDESC_PRODF: TStringField;
    CDSPFCODBARRA_PRODF: TStringField;
    CDSPFQTDMIN_PRODF: TBCDField;
    CDSPFQTDMAX_PRODF: TBCDField;
    CDSPFQTDEST_PRODF: TIntegerField;
    CDSPFTAMANHO_PRODF: TStringField;
    CDSPFOBS_PRODF: TStringField;
    CDSPFSTATUS_PRODF: TStringField;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure BtnStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProdFin: TFrmCadProdFin;

implementation

uses UDM, U_BusProdutoFinal, U_StatusProdFin;

{$R *.dfm}

procedure TFrmCadProdFin.BtnNovoClick(Sender: TObject);
begin

//Desligando os datasets
   CDSPF.Close;  /// ou cdscli.active := false;
   SQLPF.Close;

   //Zerando o parametro
   SQLPF.ParamByName('PARPRODUTOFINAL').AsInteger := 0;

   //Ativando os datasetws
   SQLPF.Open; // ou sqlcli.active := true;
   CDSPF.Open;

   //Inserindo um registro novo no final da entidade
   CDSPF.Append;

   //Atribuindo valores para os atributos que são instanciados automaticamente
  CDSPFSTATUS_PRODF.AsString  := 'A';


   //Gerando o código do cliente automaticamente
   DM.SqlAuxiliar.Close;
   DM.SqlAuxiliar.CommandText := 'SELECT MAX(IDPRODUTOFIN) FROM PRODUTOFINAL';
   DM.SqlAuxiliar.Open;
   CDSPFIDPRODUTOFIN.AsInteger  := DM.SqlAuxiliar.FIELDBYNAME('MAX').AsInteger + 1 ;

   //Obs.: Não esqueça que o código no form está em um edit, que não possui ligação com
   //o banco, portanto terei que repassar o valor manualmente
   EdtBusca.Text := InttoStr(CDSPFIDPRODUTOFIN.AsInteger);
  inherited;

  {DBGRUPO.Enabled:=true; DBPRECODECUSTO.Enabled:=true; DBPRECOMIN.Enabled:=true;
  DBPRECOMED.Enabled:=true; DBPRECOMAX.Enabled:=true; DBQTDMIN.Enabled:=true;
  DBQTDMAX.Enabled:=true; DBQTDEST.Enabled:=true; DBTAMANHO.Enabled:=true; DBCODBARRA.Enabled:=true;
  DBDESC.Enabled:=true; DBOBS.Enabled:=true; EdtBusca.Enabled:=false;
}
end;

procedure TFrmCadProdFin.BtnCancelarClick(Sender: TObject);
begin

 CDSPF.Cancel;
   CDSPF.Close;
   SQLPF.Close;



  inherited;
   {DBGRUPO.Clear; DBPRECODECUSTO.Clear; DBPRECOMIN.Clear; DBPRECOMED.Clear;
   DBPRECOMAX.Clear; DBQTDMIN.Clear; DBQTDMAX.Clear; DBTAMANHO.Clear; DBCODBARRA.Clear;
   DBDESC.Clear; DBOBS.Clear; EdtBusca.Clear;}

  { DBGRUPO.Enabled:=false; DBPRECODECUSTO.Enabled:=false; DBPRECOMIN.Enabled:=false;
   DBPRECOMED.Enabled:=false; DBPRECOMAX.Enabled:=false; DBQTDMIN.Enabled:=false;
   DBQTDMAX.Enabled:=false;  DBQTDEST.Enabled:=false; DBTAMANHO.Enabled:=false;
   DBCODBARRA.Enabled:=false; DBDESC.Enabled:=false; DBOBS.Enabled:=false;
   PANDADOS.Enabled:=True;}

   EdtBusca.Enabled:=true;


end;

procedure TFrmCadProdFin.BtnBuscarClick(Sender: TObject);
begin
  inherited;
SQLPF.ParamByName('PARPRODUTOFINAL').AsInteger := 0;
  Application.CreateForm(TFrmBusProdFin,FrmBusProdFin);

  //A LINHA ABAIXO COLOCA O VALOR "CLIENTES" DENTRO DA VARIAVEL
  //GLOBAL QUEMCHAMA, QUE CONTROLA PARA QUAL FORM DISPARAR O RETORNO
  FrmBusProdFin.QuemChama := 'BAIRROS';

  FrmBusProdFin.ShowModal;
  FrmBusProdFin.Free;

  IF (SQLPF.ParamByName('PARPRODUTOFINAL').AsInteger > 0 ) THEN
    BEGIN
      SQLPF.Open;
      CDSPF.Open;

      CDSPF.Edit;
      EdtBusca.Text := IntToStr(CDSPFIDPRODUTOFIN.Asinteger);
      HabilitaEdicao;
    END;
end;

procedure TFrmCadProdFin.BtnStatusClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmStatusProdFin,FrmStatusProdFin);
  FrmStatusProdFin.ShowModal;
  FrmStatusProdFin.Free;
end;

end.
