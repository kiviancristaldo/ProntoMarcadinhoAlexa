unit model.Agenda;

interface

uses
  System.Generics.Collections;



  type TTurno = (tpManha,tpTarde);

  type THorarios = class
    private
      FID:integer;
      FIDDataETurnos:integer;
      FHorario:string;
    published
      property ID: integer read FID write FID;
      property IDDataETurnos: integer read FIDDataETurnos write FIDDataETurnos;
      property Horario: string read FHorario write FHorario;
  end;

  TArrayHorarios = array of THorarios;

  type TListaHorarios = class
    private
      FLista : TArrayHorarios;
    public
    constructor Create(pSize:integer);
    destructor Destroy;
    property Lista:  TArrayHorarios read FLista write FLista;
  end;

    {
type
  TDataETurnos = class
    FID:integer;
    FIDProfissional:integer;
    FTurno:TTurno;
    FDia:String;
  end; }

implementation





{ TListaHorarios }

constructor TListaHorarios.Create(pSize:integer);
begin
  SetLength(FLista,pSize);

end;

destructor TListaHorarios.Destroy;
begin
  FLista := nil;
end;

end.
