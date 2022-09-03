unit Controller.DataETurnos;

interface

uses system.classes,DateUtils,SysUtils,model.CadastroProfissionais,model.Agenda;

type TControllerDataETurnos = class
  private
    function UltimoID(tabela: string): integer;
    procedure IncluirDataETurno(var IDDataEturnos: Integer; pIDProfissional: Integer;pDia:TDateTime;Turno:TTurno);
    procedure GerarAgendaDosProxTrintaDias(pIDProfissional:integer);
    procedure IncluirHorariosManha(pProfissional: TProfissionais;
      IDDataEturnos: integer);
  public
    procedure Incluir(pIDProfissional:integer);
    procedure Editar;
    procedure Excluir;
    procedure Gravar;
    procedure Cancelar;
    procedure AbrirForm(ComponentePai:TComponent);
    procedure MostraDados;
    procedure GerarAgendaDoMes;
    function CriarObjetoProfissional(pID:integer):TProfissionais;
end;

implementation

uses view.MarcarAgendamento,DM, Vcl.Dialogs;

{ TControllerCadastroClientes }

procedure TControllerDataETurnos.AbrirForm(ComponentePai: TComponent);
begin
//
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

procedure TControllerDataETurnos.GerarAgendaDoMes;
begin

end;

procedure TControllerDataETurnos.IncluirHorariosManha(pProfissional:TProfissionais;IDDataEturnos:integer);
var
  QtdDeConsultasManha,I:integer;
  UltimaHora:TTime;
begin
   UltimaHora := pProfissional.Horario_Min_Manha;

   QtdDeConsultasManha := HoursBetween(pProfissional.Horario_Min_Manha,pProfissional.Horario_MAX_Manha);

   if NOT dados.qryAux.IsEmpty then
   begin
      for I := 0 to QtdDeConsultasManha do
      begin
        dados.qryHorarios.append;
        dados.qryHorariosID.Value := UltimoID('HORARIOS')+1;
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
      IDDataEturnos := UltimoID('DATAETURNOS') + 1;
      FProfissional := CriarObjetoProfissional(pIDProfissional);
      Dia := IncDay(Dia);
      if (FProfissional.Horario_MIN_manha <> 0) and (FProfissional.Horario_MAX_manha <> 0) then
      begin
         IncluirDataETurno(IDDataEturnos,pIDProfissional,Dia,tpManha);
         IncluirHorariosManha(FProfissional,IDDataEturnos)
      end;
   end;
   FProfissional.Free;
   showmessage('DEU TUDO CERTO');
end;

procedure TControllerDataETurnos.IncluirDataETurno(var IDDataEturnos: Integer; pIDProfissional: Integer;pDia:TDateTime;Turno:TTurno);
begin
  dados.qryDataEturnos.Append;
  dados.qryDataEturnosid.Value := IDDataEturnos;
  dados.qryDataEturnosidProfissional.Value := pIDProfissional;
  dados.qryDataEturnosDIA.AsDateTime := pDia;
  dados.qryDataEturnosTURNO.AsString := 'MANHA';
  dados.qryDataEturnos.Post;
end;

procedure TControllerDataETurnos.Gravar;
begin
   dados.qryAgenda.Post;

end;

function TControllerDataETurnos.UltimoID(tabela:string):integer;
begin
   dados.qryAux.Close;
   dados.qryAux.SQL.text := 'SELECT max(id) as id FROM '+tabela;
   dados.qryAux.Open;

   if dados.qryAux.IsEmpty then
    Result := 0
   else
    Result := dados.qryAux.FieldByName('ID').asInteger;
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
