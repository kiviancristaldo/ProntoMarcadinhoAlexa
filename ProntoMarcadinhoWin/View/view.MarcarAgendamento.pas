unit view.MarcarAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.WinXPickers,DM, Data.DB, Controller.Agendamento, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask,model.agenda;

type
  TfrmAgendamento = class(TForm)
    Panel1: TPanel;
    Button3: TButton;
    Button5: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbCliente: TDBLookupComboBox;
    dsAgenda: TDataSource;
    dsProfissionais: TDataSource;
    dsClientes: TDataSource;
    rgTurno: TRadioGroup;
    dtData: TMaskEdit;
    Button6: TButton;
    Label4: TLabel;
    dbProfissionais: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FOwner:TComponent;
    FController: TControllerAgendamento;
  public
    constructor Create(AOwner: TComponent;
      var pController: TControllerAgendamento);
    { Public declarations }
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

procedure TfrmAgendamento.FormCreate(Sender: TObject);
begin
  dados.qryClientes.Open;
  dados.qryProfissionais.Open;
end;

procedure TfrmAgendamento.Button3Click(Sender: TObject);
begin
  if MessageDlg('Deseja CANCELAR este horário para o cliente '+dados.qryAgendaNOMECLIENTE.AsString+'?',mtConfirmation,[mbyes,mbno],0) = mrYes then
  begin
    FController.CancelarConsulta;
  end;
end;

procedure TfrmAgendamento.Button5Click(Sender: TObject);
begin
  if MessageDlg('Deseja marcar este horário para o cliente '+dados.qryClientesNOME.AsString+'?',mtConfirmation,[mbyes,mbno],0) = mrYes then
  begin
    FController.MarcarConsulta;
  end;
end;

procedure TfrmAgendamento.Button6Click(Sender: TObject);
var
  turno:TTurno;
  vProfissional,vCliente:integer;
begin
  if rgTurno.ItemIndex = 0 then
    turno := tpManha
  else
    turno := tpTarde;

  vProfissional := 0;
  vCliente := 0;

  if dbProfissionais.text <> '' then
    vProfissional := dados.qryProfissionaisID.asInteger;
  if dbCliente.text <> '' then
    vCliente := dados.qryClientesID.asInteger;

  FController.ConsultarAgenda(dtData.text,turno,vProfissional,vCliente);
end;

constructor TfrmAgendamento.Create(AOwner: TComponent;
  var pController: TControllerAgendamento);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
  FController := pController;
end;

end.
