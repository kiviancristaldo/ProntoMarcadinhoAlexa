unit Controller.DataETurnos;

interface

uses system.classes,DateUtils,SysUtils,model.CadastroProfissionais,
model.Agenda;

type TControllerDataETurnos = class
  private
    procedure IncluirDataETurno(var IDDataEturnos: Integer; pIDProfissional: Integer;pDia:TDateTime;Turno:TTurno);
    procedure IncluirHorariosManha(pProfissional: TProfissionais;
      IDDataEturnos: integer);
    procedure IncluirHorariosTarde(pProfissional: TProfissionais;
      IDDataEturnos: integer);
  public
    procedure Incluir(pIDProfissional:integer);
    procedure Editar;
    procedure Excluir;
    procedure Gravar;
    procedure Cancelar;
    procedure AbrirForm(ComponentePai:TComponent);
    procedure MostraDados;
    function CriarObjetoProfissional(pID:integer):TProfissionais;
    procedure GerarAgendaDosProxTrintaDias(pIDProfissional:integer);
end;

implementation

uses view.MarcarAgendamento,DM, Vcl.Dialogs,view.GerarAgenda;

{ TControllerCadastroClientes }

procedure TControllerDataETurnos.AbrirForm(ComponentePai: TComponent);
var GerarAgenda:TFrmGerarAgenda;

begin
   GerarAgenda := TFrmGerarAgenda.Create(ComponentePai,Self);
   try
     GerarAgenda.Showmodal;
   finally
     GerarAgenda.Free;
   end;
end;

procedure TControllerDataETurnos.Cancelar;
begin
   dados.qryAgenda.Cancel;
end;

function TControllerDataETurnos.CriarObjetoProfissional(pID:integer): TProfissionais;
var
  FProfissional:TProfissionais;
begin
  dados.qryAux.Open('SELECT * FROM PROFISSIONAIS WHERE ID = '+IntToStr(pID));

  if not dados.qryAux.isEmpty then
  begin
     FProfissional := TProfissionais.Create;
     FProfissional.ID := pID;
     fProfissional.Nome := dados.qryAux.FieldbyName('NOME').asString;
     FProfissional.Sobrenome := dados.qryAux.FieldbyName('SOBRENOME').asString;
     FProfissional.Horario_MIN_Manha := dados.qryAux.FieldbyName('Horario_MIN_Manha').value;
     FProfissional.Horario_MAX_Manha := dados.qryAux.FieldbyName('Horario_MAX_Manha').value;
     FProfissional.Horario_MIN_TARDE := dados.qryAux.FieldbyName('Horario_MIN_TARDE').value;
     FProfissional.Horario_MAX_TARDE := dados.qryAux.FieldbyName('Horario_MAX_TARDE').value;
  end;
  Result := FProfissional;
end;

procedure TControllerDataETurnos.Editar;
begin
   dados.qryAgenda.Edit;
end;

procedure TControllerDataETurnos.Excluir;
begin
   dados.qryAgenda.Delete;
end;

procedure TControllerDataETurnos.IncluirHorariosTarde(pProfissional:TProfissionais;IDDataEturnos:integer);
var
  QtdDeConsultas,I:integer;
  UltimaHora:TTime;
begin
   UltimaHora := pProfissional.Horario_Min_Tarde;
   QtdDeConsultas := HoursBetween(pProfissional.Horario_Min_Tarde,pProfissional.Horario_MAX_Tarde);

   if NOT dados.qryAux.IsEmpty then
   begin
      for I := 0 to QtdDeConsultas do
      begin
        dados.qryHorarios.append;
        dados.qryHorariosID.Value := dados.UltimoID('HORARIOS')+1;
        dados.qryHorariosIDDATAETURNOS.AsInteger := IDDataEturnos;

        if i = 0 then
          dados.qryHorariosHORARIO.value := pProfissional.Horario_Min_Tarde
        else
        begin
          dados.qryHorariosHORARIO.value := IncHour(UltimaHora);
        end;
        UltimaHora := dados.qryHorariosHORARIO.value;
        dados.qryHorarios.Post;
      end;
   end;
end;

procedure TControllerDataETurnos.IncluirHorariosManha(pProfissional:TProfissionais;IDDataEturnos:integer);
var
  QtdDeConsultas,I:integer;
  UltimaHora:TTime;
begin
   UltimaHora := pProfissional.Horario_Min_Manha;
   QtdDeConsultas := HoursBetween(pProfissional.Horario_Min_Manha,pProfissional.Horario_MAX_Manha);

   if NOT dados.qryAux.IsEmpty then
   begin
      for I := 0 to QtdDeConsultas do
      begin
        dados.qryHorarios.append;
        dados.qryHorariosID.Value := dados.UltimoID('HORARIOS')+1;
        dados.qryHorariosIDDATAETURNOS.AsInteger := IDDataEturnos;

        if i = 0 then
          dados.qryHorariosHORARIO.value := pProfissional.Horario_Min_Manha
        else
        begin
          dados.qryHorariosHORARIO.value := IncHour(UltimaHora);
        end;
        UltimaHora := dados.qryHorariosHORARIO.value;
        dados.qryHorarios.Post;
      end;
   end;
end;

procedure TControllerDataETurnos.GerarAgendaDosProxTrintaDias(pIDProfissional:integer);
var
  I,IDDataEturnos: Integer;
  Dia:TDate;
  FProfissional:TProfissionais;
begin
   Dia := tomorrow;

   dados.qryDataETurnos.Open;
   dados.qryHorarios.Open;

   for I := 0 to 31 do
   begin

      FProfissional := CriarObjetoProfissional(pIDProfissional);
      Dia := IncDay(Dia);
      if (FProfissional.Horario_MIN_manha <> 0) and (FProfissional.Horario_MAX_manha <> 0) then
      begin
         IDDataEturnos := dados.UltimoID('DATAETURNOS') + 1;
         IncluirDataETurno(IDDataEturnos,pIDProfissional,Dia,tpManha);
         IncluirHorariosManha(FProfissional,IDDataEturnos)
      end;
      if (FProfissional.Horario_MIN_tarde <> 0) and (FProfissional.Horario_MAX_tarde <> 0) then
      begin
         IDDataEturnos := dados.UltimoID('DATAETURNOS') + 1;
         IncluirDataETurno(IDDataEturnos,pIDProfissional,Dia,tpTarde);
         IncluirHorariosTarde(FProfissional,IDDataEturnos)
      end;
   end;
   FProfissional.Free;
   showmessage('DEU TUDO CERTO!!');
end;

procedure TControllerDataETurnos.IncluirDataETurno(var IDDataEturnos: Integer; pIDProfissional: Integer;pDia:TDateTime;Turno:TTurno);
begin
  dados.qryDataEturnos.Append;
  dados.qryDataEturnosid.Value := IDDataEturnos;
  dados.qryDataEturnosidProfissional.Value := pIDProfissional;
  dados.qryDataEturnosDIA.AsDateTime := pDia;
  if Turno = tpManha then
    dados.qryDataEturnosTURNO.AsString := 'MANHA'
  else
    dados.qryDataETurnosTURNO.asString := 'TARDE';
  dados.qryDataEturnos.Post;
end;

procedure TControllerDataETurnos.Gravar;
begin
   dados.qryAgenda.Post;
end;

procedure TControllerDataETurnos.Incluir(pIDProfissional:integer);
begin
   GerarAgendaDosProxTrintaDias(pIDProfissional);
end;

procedure TControllerDataETurnos.MostraDados;
begin
   dados.qryAgenda.Open;
end;

end.
