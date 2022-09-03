unit view.GerarAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,DM,
  Controller.DataETurnos;

type
  TfrmGerarAgenda = class(TForm)
    dbProfissional: TDBLookupComboBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
  FController.GerarAgendaDosProxTrintaDias(StrtoInt(dbProfissional.text));
end;

constructor TfrmGerarAgenda.Create(AOwner: TComponent;
  var pController: TControllerDataETurnos);
begin
  inherited Create(AOwner);
  FOwner := AOwner;                   //tem que levar em consideração o owner aqui
  FController := pController;
end;

end.
