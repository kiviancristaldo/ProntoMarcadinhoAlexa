unit view.GerarAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,DM,
  Controller.DataETurnos;

type
  TfrmGerarAgenda = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    Button1: TButton;
    dbProfissionais: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FOwner : TComponent;
    FController : TControllerDataEturnos;
  public
    constructor Create(AOwner: TComponent;
      var pController: TControllerDataETurnos);
    { Public declarations }
  end;

var
  frmGerarAgenda: TfrmGerarAgenda;

implementation

{$R *.dfm}

procedure TfrmGerarAgenda.Button1Click(Sender: TObject);
begin
  FController.GerarAgendaDosProxTrintaDias(dados.qryProfissionaisID.asInteger);
end;

constructor TfrmGerarAgenda.Create(AOwner: TComponent;
  var pController: TControllerDataETurnos);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
  FController := pController;
end;

procedure TfrmGerarAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.qryProfissionais.CLose;
end;

procedure TfrmGerarAgenda.FormCreate(Sender: TObject);
begin
  dados.qryProfissionais.Open;


end;

end.
