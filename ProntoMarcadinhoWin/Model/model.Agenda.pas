unit model.Agenda;

interface

uses controller.cadastroclientes,controller.cadastroprofissionais;

type TTurno = (tpManha,tpTarde);

type THorarios = class
  FID:integer;
  FIDDataETurnos:integer;
  FHorario:TTime;
end;

type
  TDataETurnos = class
    FID:integer;
    FIDProfissional:integer;
    FTurno:TTurno;
    FDia:TDate;
  end;



implementation



{ TAgenda }


end.
