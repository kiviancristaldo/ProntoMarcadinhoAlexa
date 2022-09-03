unit view.CadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Controller.CadastroClientes;

type
  TfrmCadastroClientes = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FOwner:TComponent;
    FController: TControllerCadastroClientes;
  public
    constructor Create(AOwner: TComponent;
      var pController: TControllerCadastroClientes);
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

procedure TfrmCadastroClientes.Button1Click(Sender: TObject);
begin
  FController.Incluir;
end;

procedure TfrmCadastroClientes.Button2Click(Sender: TObject);
begin
  FController.Editar;
end;

procedure TfrmCadastroClientes.Button3Click(Sender: TObject);
begin
  FController.Cancelar;
end;

procedure TfrmCadastroClientes.Button4Click(Sender: TObject);
begin
  FController.Gravar;
end;

procedure TfrmCadastroClientes.Button5Click(Sender: TObject);
begin
  FController.Excluir;
end;

constructor TfrmCadastroClientes.Create(AOwner: TComponent;
  var pController: TControllerCadastroClientes);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
  FController := pController;
end;

end.
