unit U_Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, RzLabel, RzPrgres, RzPanel;

type
  TFrmSplash = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PB: TRzProgressBar;
    IMG: TImage;
    PnlCenter: TRzPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

uses UMenu, U_Login;

{$R *.dfm}

procedure TFrmSplash.FormCreate(Sender: TObject);
var

 x:Integer; 

begin



FrmSplash.Show;
FrmSplash.Refresh;
 for x:=0 to 99 do

  begin

    PB.Percent:=pb.Percent+1;

    Sleep(20);

  end;

  PB.Percent:=0;


  Application.CreateForm(TFrmLogin,FrmLogin);
  FrmLogin.ShowModal;
  FrmLogin.Free;
end;

end.
