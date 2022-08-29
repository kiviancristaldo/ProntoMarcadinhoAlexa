unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModule2 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryProfissionais: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    qryProfissionaisID: TIntegerField;
    qryProfissionaisNOME: TStringField;
    qryProfissionaisSOBRENOME: TStringField;
    qryProfissionaisHORARIO_MIN_MANHA: TTimeField;
    qryProfissionaisHORARIO_MAX_MANHA: TTimeField;
    qryProfissionaisHORAUNITARIA: TTimeField;
    qryProfissionaisHORARIO_MIN_TARDE: TTimeField;
    qryProfissionaisHORARIO_MAX_TARDE: TTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
