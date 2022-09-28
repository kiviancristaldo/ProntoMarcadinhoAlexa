unit Controller.Agendamento;

interface

uses system.classes, model.agenda;

type TControllerAgendamento = class
  private
    procedure Cancelar;
    procedure Editar;
    procedure Excluir;
    procedure Gravar;
    procedure Incluir;
  public
    procedure CancelarConsulta;
    function MarcarConsulta:boolean; overload;
    procedure AbrirForm(ComponentePai:TComponent);
    procedure MostraDados;
    procedure ConsultarAgenda(pData:String; Turno:TTurno; pIDProfissional,pIDCliente:Integer);
    {Funções para consumo da Alexa}
    function MarcarConsulta(pIDCliente,pIDAgenda:Integer):boolean; overload;
    function LocalizarCliente(Nome: String): integer;
    function LocalizarProfissional(Nome: String): integer;
    function ConsultarAgendaAlexa(pData: string; turno: TTurno;
      pIDProfissional: integer):String;
end;

implementation

uses view.MarcarAgendamento,DM,StrUtils, System.SysUtils, System.Variants,System.JSON, REST.Json;

{ TControllerCadastroClientes }

procedure TControllerAgendamento.AbrirForm(ComponentePai: TComponent);
var Agendamento:TFrmAgendamento;

begin
   Agendamento := TFrmAgendamento.Create(ComponentePai,Self);
   try
     MostraDados;
     Agendamento.Showmodal;
   finally
     Agendamento.Free;
   end;
end;

procedure TControllerAgendamento.Cancelar;
begin
   dados.qryAgenda.Cancel;
end;

procedure TControllerAgendamento.CancelarConsulta;
begin

  dados.qryAux.ExecSQL(
    'UPDATE HORARIOS SET IDCLIENTE = NULL '+
    ' WHERE ID = '+dados.qryAgendaIDHorario.AsString);
  dados.qryAgenda.Refresh;

end;

procedure TControllerAgendamento.Editar;
begin
   dados.qryAgenda.Edit;
end;

procedure TControllerAgendamento.Excluir;
begin
   dados.qryAgenda.Delete;
end;

procedure TControllerAgendamento.Gravar;
begin
   dados.qryAgenda.Post;

end;

procedure TControllerAgendamento.Incluir;
begin
   dados.qryAgenda.Append;

end;

function TControllerAgendamento.LocalizarProfissional(Nome: string):integer;
begin
  if dados = nil then
     Dados := TDados.Create(nil);

  dados.qryAux.Open(
    'SELECT * FROM PROFISSIONAIS WHERE NOME = '+QuotedStr(UpperCase(Nome)));

  if dados.qryAux.isEmpty then
    Result := 0
  else
    Result := dados.qryAux.FieldByName('ID').AsInteger;
end;

function TControllerAgendamento.LocalizarCliente(Nome: string):integer;
begin
  if dados = nil then
     Dados := TDados.Create(nil);

  dados.qryAux.Open(
    'SELECT * FROM CLIENTE WHERE NOME = '+QuotedStr(Uppercase(Nome)));

  if dados.qryAux.isEmpty then
    Result := 0
  else
    Result := dados.qryAux.FieldByName('ID').AsInteger;
end;

function TControllerAgendamento.MarcarConsulta(pIDCliente,pIDAgenda:integer):boolean;
begin
  if dados = nil then
     Dados := TDados.Create(nil);

  dados.qryAux.ExecSQL(
    'UPDATE HORARIOS SET IDCLIENTE = '+InttoStr(pIDCliente)+
    ' WHERE ID = '+InttoStr(pIDAgenda));

  Result := True;
end;

function TControllerAgendamento.MarcarConsulta:boolean;
begin
  dados.qryAux.ExecSQL(
    'UPDATE HORARIOS SET IDCLIENTE = '+dados.qryClientesID.AsString+
    ' WHERE ID = '+dados.qryAgendaIDHorario.AsString);
  dados.qryAgenda.Refresh;
end;

procedure TControllerAgendamento.MostraDados;
begin
   dados.qryAgenda.Open;
end;

procedure TControllerAgendamento.ConsultarAgenda(pData:string;turno:TTurno;pIDProfissional,pIDCliente:integer);
var
  SQL: string;
begin
  dados.qryAgenda.Close;
  dados.qryAgenda.SQL.Clear;

  SQL := 'SELECT d.id AS IDDataETurnos,h.id as IDHORARIO,p.nome AS nomeDOprofissional ,d.TURNO , d.DIA ,h.HORARIO '
    + ',c.NOME AS nomeCLiente  '
    + ' FROM horarios h '
    + 'INNER JOIN DATAETURNOS d ON h.IDDATAETURNOS = d.ID  '
    + 'INNER JOIN PROFISSIONAIS p ON p.ID = d.IDPROFISSIONAL '
    + 'LEFT JOIN CLIENTE c ON c.ID = h.IDCLIENTE '
    + 'WHERE 1=1  ';

  if pData <> '  /  /    ' then
  begin
     SQL := SQL + ' AND d.DIA = ' + trim(QuotedStr(Copy(pData,4,2) + '/' +  Copy(pData,0,2) +'/'+ Copy(pData,7,4)));
  end;

  if turno = tpManha then
    SQL := SQL + ' AND d.TURNO = ' + QuotedStr('MANHA')
  else
    SQL := SQL + ' AND d.TURNO = ' + QuotedStr('TARDE');

  if pIDProfissional <> 0 then
    SQL := SQL + ' AND P.ID = ' + InttoStr(pIDProfissional);

  if pIDCliente > 0 then
    SQL := SQL + ' AND C.ID = ' + InttoStr(pIDCliente)
  else if (pIDCliente = -1) then
    SQL := SQL + ' AND H.IDCLIENTE is NULL ';


  dados.qryAgenda.SQL.Add(SQL);
  dados.qryAgenda.Open;
end;

function TControllerAgendamento.ConsultarAgendaAlexa(pData:string;turno:TTurno;pIDProfissional:integer):string;
var
  SQL: String;
  I: Integer;
  vListaHorarios : TListaHorarios;
  vInfosHorarios : THorarios;
begin
  if dados = nil then
     Dados := TDados.Create(nil);
  dados.qryAgenda.Close;
  dados.qryAgenda.SQL.Clear;

  SQL := 'SELECT d.id AS IDDataETurnos,h.id as IDHORARIO,p.nome AS nomeDOprofissional ,d.TURNO , d.DIA ,h.HORARIO, '
  + ' p.nome as NomeCliente '  {só botei o nome do profissional aqui para o campo nao ficar vazio}
  + ' FROM horarios h '
  + 'INNER JOIN DATAETURNOS d ON h.IDDATAETURNOS = d.ID  '
  + 'INNER JOIN PROFISSIONAIS p ON p.ID = d.IDPROFISSIONAL '
  + 'WHERE d.DIA = ' + trim(QuotedStr(Copy(pData,6,2) + '/' +  Copy(pData,9,2) +'/'+ Copy(pData,0,4)))
  + ' AND H.IDCLIENTE is NULL ';

  if turno = tpManha then
    SQL := SQL + ' AND d.TURNO = ' + QuotedStr('MANHA')
  else
    SQL := SQL + ' AND d.TURNO = ' + QuotedStr('TARDE');

  if pIDProfissional <> 0 then
    SQL := SQL + ' AND P.ID = ' + InttoStr(pIDProfissional);
  dados.qryAgenda.SQL.Add(SQL);
  dados.qryAgenda.Open;
  dados.qryAgenda.BeginBatch;
  dados.qryAgenda.First;

  vListaHorarios := TListaHorarios.Create(dados.qryAgenda.RecordCount);
  for I := 0 to dados.qryAgenda.RecordCount-1 do
  begin
    vInfosHorarios := THorarios.Create;
    vInfosHorarios.ID := dados.qryAgendaIDhorario.asInteger;
    vInfosHorarios.Horario := TimetoStr(dados.qryAgendaHorario.value);
    vListaHorarios.Lista[I] := vInfosHorarios;
    Dados.QryAgenda.Next;
  end;
  dados.qryAgenda.EndBatch;

  Result := TJson.ObjectToJsonString(vListaHorarios,[joDateFormatISO8601]);

  vListaHorarios.Free; //percorrer esse cara antes de destruir ele destruindo os filhos dele
end;

end.
