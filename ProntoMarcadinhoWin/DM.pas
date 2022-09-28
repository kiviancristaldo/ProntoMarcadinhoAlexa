unit DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, VCL.Dialogs;

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
    qryAgendaNOMEDOPROFISSIONAL: TStringField;
    qryAgendaTURNO: TStringField;
    qryAgendaDIA: TDateField;
    qryAgendaHORARIO: TTimeField;
    qryAgendaNOMECLIENTE: TStringField;
    qryAgendaIDHORARIO: TIntegerField;
    qryAgendaIDDATAETURNOS: TIntegerField;
  private
    { Private declarations }
  public
    function UltimoID(tabela: string): integer;
  end;

var
  dados: Tdados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function Tdados.UltimoID(tabela:string):integer;
begin
  try
   qryAux.Close;
   qryAux.SQL.text := 'SELECT max(id) as id FROM '+tabela;
   qryAux.Open;
  except
   showmessage('Essa tabela nao existe!!');
  end;

  if qryAux.IsEmpty then
  Result := 0
  else
  Result := qryAux.FieldByName('ID').asInteger;
end;

end.
