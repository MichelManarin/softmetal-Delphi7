program SOFTMETAL;

uses
  Forms,
  UObjetoINI in '..\Objetos\UObjetoINI.pas' {FrmObjetoINI},
  UObjetoCAD in '..\Objetos\UObjetoCAD.pas' {FrmObjetoCAD},
  UConfigura in '..\Configuração\UConfigura.pas' {FrmConfigura},
  UMenu in '..\Menu\UMenu.pas' {FrmMenu},
  U_CadFornecedor in '..\Cadastros\U_CadFornecedor.pas' {FrmCadForn},
  UDM in '..\DM\UDM.pas' {DM: TDataModule},
  U_CadFuncionario in '..\Cadastros\U_CadFuncionario.pas' {FrmCadFun},
  U_CadClientes in '..\Cadastros\U_CadClientes.pas' {FrmCadClien},
  U_CadBairro in '..\Cadastros\U_CadBairro.pas' {FrmCadBairros},
  U_CadCidade in '..\Cadastros\U_CadCidade.pas' {FrmCadCidades},
  U_CadCep in '..\Cadastros\U_CadCep.pas' {FrmCadCep},
  U_CadCargo in '..\Cadastros\U_CadCargo.pas' {FrmCadCargos},
  U_CadProduto in '..\Cadastros\U_CadProduto.pas' {FrmCadProd},
  U_CadCondicoes in '..\Cadastros\U_CadCondicoes.pas' {FrmCadCondicoes},
  UObjetoBUS in '..\Objetos\UObjetoBUS.pas' {FrmObjetoBUS},
  U_BusCidade in '..\Buscas\U_BusCidade.pas' {FrmBusCid},
  U_BusCargo in '..\Buscas\U_BusCargo.pas' {FrmBusCargos},
  U_BusCep in '..\Buscas\U_BusCep.pas' {FrmBusCep},
  U_BusCondicao in '..\Buscas\U_BusCondicao.pas' {FrmBusCon},
  U_BusBairro in '..\Buscas\U_BusBairro.pas' {FrmBusBairros},
  U_CadManuntencao in '..\Cadastros\U_CadManuntencao.pas' {FrmCadManun},
  U_CadMateriaPrima in '..\Cadastros\U_CadMateriaPrima.pas' {FrmCadMatPr},
  U_CadMaquina in '..\Cadastros\U_CadMaquina.pas' {FrmCadMaquinas},
  U_BusMaquina in '..\Buscas\U_BusMaquina.pas' {FrmBusMaq},
  U_BusManuntencao in '..\Buscas\U_BusManuntencao.pas' {FrmBusManun},
  U_BusFornecedor in '..\Buscas\U_BusFornecedor.pas' {FrmBusForn},
  U_BusFuncionario in '..\Buscas\U_BusFuncionario.pas' {FrmBusFun},
  U_BusMateriaPrima in '..\Buscas\U_BusMateriaPrima.pas' {FrmBusMatPr},
  U_BusProduto in '..\Buscas\U_BusProduto.pas' {FrmBusProd},
  U_BusCliente in '..\Buscas\U_BusCliente.pas' {FrmBusClien},
  UObjetoSTAT in '..\Objetos\UObjetoSTAT.pas' {FrmObjetoSTA},
  U_StatusCidade in '..\Status\U_StatusCidade.pas' {FrmStatusCid},
  U_StatusBairro in '..\Status\U_StatusBairro.pas' {FrmStatusBai},
  U_StatusCep in '..\Status\U_StatusCep.pas' {FrmStatusCep},
  U_StatusCond in '..\Status\U_StatusCond.pas' {FrmStatusCond},
  U_StatusForn in '..\Status\U_StatusForn.pas' {FrmStatusForn},
  U_StatusFun in '..\Status\U_StatusFun.pas' {FrmStatusFun},
  U_StatusClien in '..\Status\U_StatusClien.pas' {FrmStatusClien},
  U_StatusCarg in '..\Status\U_StatusCarg.pas' {FrmStatusCar},
  U_StatusManu in '..\Status\U_StatusManu.pas' {FrmStatusManun},
  U_StatusMaq in '..\Status\U_StatusMaq.pas' {FrmStatusMaq},
  U_StatusMatPr in '..\Status\U_StatusMatPr.pas' {FrmStatusMatPr},
  U_StatusProd in '..\Status\U_StatusProd.pas' {FrmStatusProd},
  U_Login in '..\Login\U_Login.pas' {FrmLogin},
  U_CadGrupo in '..\Cadastros\U_CadGrupo.pas' {FrmCadGrup},
  U_BusGrupos in '..\Buscas\U_BusGrupos.pas' {FrmBusGrup},
  U_StatusGrup in '..\Status\U_StatusGrup.pas' {FrmStatusGrup},
  U_CadTipoLog in '..\Cadastros\U_CadTipoLog.pas' {FrmCadTipoLog},
  U_BusTipoLog in '..\Buscas\U_BusTipoLog.pas' {FrmBusTipoLog},
  U_StatusTipoLog in '..\Status\U_StatusTipoLog.pas' {FrmStatusTipoLog},
  U_Venda in '..\Vendas\U_Venda.pas' {FrmVenda},
  UObjetoLIST in '..\Objetos\UObjetoLIST.pas' {FrmObjetoLISTA},
  U_ListagemVendas in '..\Listagens\U_ListagemVendas.pas' {FrmListVendas},
  U_Splash in '..\Splash\U_Splash.pas' {FrmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SOFTMETAL';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
