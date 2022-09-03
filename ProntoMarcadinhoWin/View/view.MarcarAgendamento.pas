unit view.MarcarAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.WinXPickers,DM, Data.DB, Controller.Agendamento, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TfrmAgendamento = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    dsAgenda: TDataSource;
    dsProfissionais: TDataSource;
    dsClientes: TDataSource;
    procedure FormCreate(Sender: TObject);
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
  dados.qryAgenda.Open;
  dados.qryClientes.Open;
  dados.qryProfissionais.Open;
end;

constructor TfrmAgendamento.Create(AOwner: TComponent;
  var pController: TControllerAgendamento);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
  FController := pController;
end;

end.
