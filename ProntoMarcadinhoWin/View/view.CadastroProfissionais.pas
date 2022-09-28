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
    btInserir: TButton;
    btEditar: TButton;
    btCancelar: TButton;
    btGravar: TButton;
    DBGrid1: TDBGrid;
    btExcluir: TButton;
    procedure btInserirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
    FOwner: TComponent;
    FController : TControllerCadastroProfissionais;
    procedure HabilitarBotoes;
  public
    { Public declarations }
   constructor Create(AOwner: TComponent; var pController:TControllerCadastroProfissionais);
  end;

var
  frmCadastroProfissionais: TfrmCadastroProfissionais;

implementation

{$R *.dfm}


{ TfrmCadastroProfissionais }

procedure TfrmCadastroProfissionais.btInserirClick(Sender: TObject);
begin
  FController.Incluir;
  HabilitarBotoes;
end;

procedure TfrmCadastroProfissionais.HabilitarBotoes;
begin
  BtInserir.Enabled  := (not (DataSource1.DataSet.State in [dsInsert, dsEdit]));
  BtEditar.Enabled   := (not (DataSource1.DataSet.State in [dsInsert, dsEdit])) and (not DataSource1.DataSet.IsEmpty);
  BtExcluir.Enabled  := (not (DataSource1.DataSet.State in [dsInsert, dsEdit])) and (not DataSource1.DataSet.IsEmpty);
  BtCancelar.Enabled := (DataSource1.DataSet.State in [dsInsert, dsEdit]);
  BtGravar.Enabled   := (DataSource1.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadastroProfissionais.btEditarClick(Sender: TObject);
begin
  FController.Editar;
  HabilitarBotoes;
end;

procedure TfrmCadastroProfissionais.btCancelarClick(Sender: TObject);
begin
  FController.Cancelar;
  HabilitarBotoes;
end;

procedure TfrmCadastroProfissionais.btGravarClick(Sender: TObject);
begin
  FController.Gravar;
  HabilitarBotoes;
end;

procedure TfrmCadastroProfissionais.btExcluirClick(Sender: TObject);
begin
  FController.Excluir;
  HabilitarBotoes;
end;

constructor TfrmCadastroProfissionais.Create(AOwner: TComponent;
  var pController: TControllerCadastroProfissionais);
begin
  inherited Create(AOwner);
  FOwner := AOwner;                   //tem que levar em consideração o owner aqui
  FController := pController;
end;

end.
