unit view.CadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Controller.CadastroClientes;

type
  TfrmCadastroClientes = class(TForm)
    Panel1: TPanel;
    btInserir: TButton;
    btEditar: TButton;
    btCancelar: TButton;
    btGravar: TButton;
    btExcluir: TButton;
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
    procedure btInserirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
    FOwner:TComponent;
    FController: TControllerCadastroClientes;
    procedure HabilitarBotoes;
  public
    constructor Create(AOwner: TComponent;
      var pController: TControllerCadastroClientes);
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

procedure TfrmCadastroClientes.btInserirClick(Sender: TObject);
begin
  FController.Incluir;
  HabilitarBotoes;
end;

procedure TfrmCadastroClientes.HabilitarBotoes;
begin
  BtInserir.Enabled  := (not (DataSource1.DataSet.State in [dsInsert, dsEdit]));
  BtEditar.Enabled   := (not (DataSource1.DataSet.State in [dsInsert, dsEdit])) and (not DataSource1.DataSet.IsEmpty);
  BtExcluir.Enabled  := (not (DataSource1.DataSet.State in [dsInsert, dsEdit])) and (not DataSource1.DataSet.IsEmpty);
  BtCancelar.Enabled := (DataSource1.DataSet.State in [dsInsert, dsEdit]);
  BtGravar.Enabled   := (DataSource1.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadastroClientes.btEditarClick(Sender: TObject);
begin
  FController.Editar;
  HabilitarBotoes;
end;

procedure TfrmCadastroClientes.btCancelarClick(Sender: TObject);
begin
  FController.Cancelar;
  HabilitarBotoes;
end;

procedure TfrmCadastroClientes.btGravarClick(Sender: TObject);
begin
  FController.Gravar;
  HabilitarBotoes;
end;

procedure TfrmCadastroClientes.btExcluirClick(Sender: TObject);
begin
  FController.Excluir;
  HabilitarBotoes;
end;

constructor TfrmCadastroClientes.Create(AOwner: TComponent;
  var pController: TControllerCadastroClientes);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
  FController := pController;
end;

end.
