unit DM;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DBXInterBase, Data.DB,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, MidasLib,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qrAgenda: TFDQuery;
    qrProfissionais: TFDQuery;
    qrClientes: TFDQuery;
    qrAgendaID: TIntegerField;
    qrAgendaIDPROFISSIONAL: TIntegerField;
    qrAgendaDIA: TDateField;
    qrAgendaHORARIO: TTimeField;
    qrAgendaIDCLIENTE: TTimeField;
    qrProfissionaisID: TIntegerField;
    qrProfissionaisNOME: TStringField;
    qrProfissionaisSOBRENOME: TStringField;
    qrProfissionaisHORARIO_MIN_MANHA: TTimeField;
    qrProfissionaisHORARIO_MAX_MANHA: TTimeField;
    qrProfissionaisHORAUNITARIA: TTimeField;
    qrProfissionaisHORARIO_MIN_TARDE: TTimeField;
    qrProfissionaisHORARIO_MAX_TARDE: TTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
