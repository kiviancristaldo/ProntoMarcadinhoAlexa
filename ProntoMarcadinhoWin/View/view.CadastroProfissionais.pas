unit view.CadastroProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Controller.CadastroProfissionais,
  Vcl.WinXPickers;

type
  TfrmCadastroProfissionais = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FOwner: TComponent;
    FController : TControllerCadastroProfissionais;
  public
    { Public declarations }
   constructor Create(AOwner: TComponent; var pController:TControllerCadastroProfissionais);
  end;

var
  frmCadastroProfissionais: TfrmCadastroProfissionais;

implementation

{$R *.dfm}


{ TfrmCadastroProfissionais }

procedure TfrmCadastroProfissionais.Button1Click(Sender: TObject);
begin
  FController.Incluir;
end;

procedure TfrmCadastroProfissionais.Button2Click(Sender: TObject);
begin
  FController.Editar;
end;

procedure TfrmCadastroProfissionais.Button3Click(Sender: TObject);
begin
  FController.Cancelar;
end;

procedure TfrmCadastroProfissionais.Button4Click(Sender: TObject);
begin
  FController.Gravar;
end;

procedure TfrmCadastroProfissionais.Button5Click(Sender: TObject);
begin
  FController.Excluir;
end;

constructor TfrmCadastroProfissionais.Create(AOwner: TComponent;
  var pController: TControllerCadastroProfissionais);
begin
  inherited Create(AOwner);
  FOwner := AOwner;                   //tem que levar em consideração o owner aqui
  FController := pController;
end;

end.
