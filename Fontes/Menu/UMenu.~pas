unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UObjetoINI, ExtCtrls, RzPanel, Menus, jpeg;

type
  TFrmMenu = class(TFrmObjetoINI)
    MM: TMainMenu;
    Cadastro1: TMenuItem;
    Bairros: TMenuItem;
    Cidades1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Funcionarios1: TMenuItem;
    Movimentos1: TMenuItem;
    CEPS3: TMenuItem;
    Ceps4: TMenuItem;
    Sair1: TMenuItem;
    Produtos1: TMenuItem;
    Condies1: TMenuItem;
    Manuteno1: TMenuItem;
    Maquinas1: TMenuItem;
    Configuraop1: TMenuItem;
    Configurao1: TMenuItem;
    MateriaPrima1: TMenuItem;
    Cargos1: TMenuItem;
    Grupo1: TMenuItem;
    IPOLOGRADOURO1: TMenuItem;
    Vendas1: TMenuItem;
    Pessoas1: TMenuItem;
    EquipamentoeEstoque1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Outros1: TMenuItem;
    Contas1: TMenuItem;
    IMG: TImage;
    cOMRPAS1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Ceps4Click(Sender: TObject);
    procedure BairrosClick(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Condies1Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure Maquinas1Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure MateriaPrima1Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure Bairros2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure IPOLOGRADOURO1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Recebimentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NIVELDEACESSO: INTEGER;
  end;

var
  FrmMenu: TFrmMenu;

implementation

uses U_CadCep, U_BusBairro, U_BusCargo, U_BusCep, U_BusCidade,
  U_BusCondicao, U_CadBairro, U_CadCargo, U_CadCidade, U_CadClientes,
  U_CadCondicoes, U_CadFornecedor, U_CadFuncionario, U_CadProduto,
  U_CadManuntencao, U_CadMaquina, U_CadMateriaPrima,
  UConfigura, U_CadGrupo, U_CadTipoLog, U_Venda, U_BusCliente,
  U_ListagemVendas, Math, U_Splash;

{$R *.dfm}

procedure TFrmMenu.Sair1Click(Sender: TObject);
begin
  inherited;
close;
end;

procedure TFrmMenu.Ceps4Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadCep,FrmCadCep);
FrmCadCep.ShowModal;
FrmCadCep.Free;
end;

procedure TFrmMenu.BairrosClick(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadBairros,FrmCadBairros);
FrmCadBairros.ShowModal;
FrmCadBairros.Free;
end;

procedure TFrmMenu.Cidades1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadCidades,FrmCadCidades);
FrmCadCidades.ShowModal;
FrmCadCidades.Free;
end;

procedure TFrmMenu.Clientes1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadClien,FrmCadClien);
FrmCadClien.ShowModal;
FrmCadClien.Free;

end;

procedure TFrmMenu.Funcionarios1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadFun,FrmCadFun);
FrmCadFun.ShowModal;
FrmCadFun.Free;
end;

procedure TFrmMenu.Fornecedores1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadForn,FrmCadForn);
FrmCadForn.ShowModal;
FrmCadForn.Free;
end;

procedure TFrmMenu.Produtos1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadProd,FrmCadProd);
FrmCadProd.ShowModal;
FrmCadProd.Free;
end;

procedure TFrmMenu.Condies1Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TFrmCadCondicoes,FrmCadCondicoes);
FrmCadCondicoes.ShowModal;
FrmCadCondicoes.Free;
end;

procedure TFrmMenu.Manuteno1Click(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TFrmCadManun,FrmCadManun);
FrmCadManun.ShowModal;
FrmCadManun.Free;

end;

procedure TFrmMenu.Maquinas1Click(Sender: TObject);
begin
  inherited;
      Application.CreateForm(TFrmCadMaquinas,FrmCadMaquinas);
FrmCadMaquinas.ShowModal;
FrmCadMaquinas.Free;

end;

procedure TFrmMenu.Configurao1Click(Sender: TObject);
begin
  inherited;
        Application.CreateForm(TFrmConfigura,FrmConfigura);
FrmConfigura.ShowModal;
FrmConfigura.Free;
end;

procedure TFrmMenu.MateriaPrima1Click(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TFrmCadMatPr,FrmCadMatPr);
FrmCadMatPr.ShowModal;
FrmCadMatPr.Free;
end;

procedure TFrmMenu.Cargos1Click(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TFrmCadCargos,FrmCadCargos);
FrmCadCargos.ShowModal;
FrmCadCargos.Free;
end;

procedure TFrmMenu.Bairros2Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmBusBairros,FrmBusBairros);
FrmBusBairros.ShowModal;
FrmBusBairros.Free;

end;

procedure TFrmMenu.FormCreate(Sender: TObject);
begin
 If (NIVELDEACESSO = 1) THEN
   BEGIN
   
   END
 ELSE
    BEGIN
    END;

  //IMG.Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  //IMG.Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  IMG.Left := trunc((FrmMenu.Width - IMG.Width) / 2);
  IMG.Top := trunc((FrmMenu.Height - IMG.Height) / 2);
//FrmMenu.WindowState:= wsMaximized;



end;

procedure TFrmMenu.Grupo1Click(Sender: TObject);
begin
 inherited;
Application.CreateForm(TFrmCadGrup,FrmCadGrup);
FrmCadGrup.ShowModal;
FrmCadGrup.Free;


end;

procedure TFrmMenu.IPOLOGRADOURO1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmCadTipoLog,FrmCadTipoLog);
FrmCadTipoLog.ShowModal;
FrmCadTipoLog.Free;

end;

procedure TFrmMenu.Vendas1Click(Sender: TObject);
begin
Application.CreateForm(TFrmVenda,FrmVenda);
FrmVenda.ShowModal;
FrmVenda.Free;

end;

procedure TFrmMenu.Clientes2Click(Sender: TObject);
begin
 Application.CreateForm(TFrmBusClien,FrmBusClien);
 FrmBusClien.ShowModal;
 FrmBusClien.Free;

end;

procedure TFrmMenu.Recebimentos1Click(Sender: TObject);
begin
  inherited;
Application.CreateForm(TFrmListVendas,FrmListVendas);
FrmListVendas.ShowModal;
FrmListVendas.Free;
end;

end.
