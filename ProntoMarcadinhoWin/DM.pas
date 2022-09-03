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
  Tdados = class(TDataModule)
    FDConnection1: TFDConnection;
    qryProfissionais: TFDQuery;
    qryClientes: TFDQuery;
    qryAgenda: TFDQuery;
    qryProfissionaisID: TIntegerField;
    qryProfissionaisNOME: TStringField;
    qryProfissionaisSOBRENOME: TStringField;
    qryProfissionaisHORARIO_MIN_MANHA: TTimeField;
    qryProfissionaisHORARIO_MAX_MANHA: TTimeField;
    qryProfissionaisHORAUNITARIA: TTimeField;
    qryProfissionaisHORARIO_MIN_TARDE: TTimeField;
    qryProfissionaisHORARIO_MAX_TARDE: TTimeField;
    qryClientesID: TIntegerField;
    qryClientesNOME: TStringField;
    qryClientesSOBRENOME: TStringField;
    qryClientesDATANASCIMENTO: TDateField;
    qryAgendaID: TIntegerField;
    qryAgendaIDPROFISSIONAL: TIntegerField;
    qryAgendaDIA: TDateField;
    qryAgendaHORARIO: TTimeField;
    qryAgendaIDCLIENTE: TTimeField;
    qryAux: TFDQuery;
    qryDataEturnos: TFDQuery;
    qryDataEturnosID: TIntegerField;
    qryDataEturnosIDPROFISSIONAL: TIntegerField;
    qryDataEturnosTURNO: TStringField;
    qryDataEturnosDIA: TDateField;
    qryHorarios: TFDQuery;
    qryHorariosID: TIntegerField;
    qryHorariosHORARIO: TTimeField;
    qryHorariosIDCLIENTE: TIntegerField;
    qryHorariosIDDATAETURNOS: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dados: Tdados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
