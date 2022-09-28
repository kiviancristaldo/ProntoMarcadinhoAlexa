program ProntoMarcadinhoSrv;


uses
  Horse,
  DM in '..\ProntoMarcadinhoWin\DM.pas' {dados: TDataModule},
  Controller.Agendamento in '..\ProntoMarcadinhoWin\Controller\Controller.Agendamento.pas',
  model.Agenda in '..\ProntoMarcadinhoWin\Model\model.Agenda.pas',
  view.MarcarAgendamento in '..\ProntoMarcadinhoWin\View\view.MarcarAgendamento.pas',
  System.SysUtils {frmAgendamento},
  System.JSON, REST.Json, Variants, System.Generics.Collections,
  System.TypInfo;

var FController : TControllerAgendamento;

procedure GetPing(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
begin
  Res.Send('Pong');
end;

procedure LocalizarCliente(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  vNome: String;
begin
  vNome := Req.Params['nome'];
   Res.Send(InttoStr(FController.LocalizarCliente(vNome)));
end;

procedure LocalizarProfissional(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  vNome: String;
begin
  vNome := Req.Params['nome'];
  Res.Send(InttoStr(FController.LocalizarProfissional(vNome)));
end;

procedure MarcarHorario(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  vAgenda,vCliente: Integer;
begin
  vCliente := StrtoInt(Req.Params['idCliente']);
  vAgenda := StrtoInt(Req.Params['idAgenda']);
  Res.Send(BooltoStr(FController.MarcarConsulta(vCliente,vAgenda)));
end;

procedure BuscarHorariosDisponiveis(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
Var
 I,vTurno,vProfissional: Integer;
 vData,Data,vNomeProf: String;
begin
  vNomeProf := Req.Params['nomeDoProfissional'];
  vData := Req.Params['data'];
  vTurno := StrtoInt(Req.Params['turno']);
        //  mmddyyyy assim que tem ir

  Res.Send(
    FController.ConsultarAgendaAlexa(vData, TTurno(vTurno),FController.LocalizarProfissional(vNomeProf))
    );

end;



begin
  THorse.Get('/ping', GetPing);
  THorse.Get('/LocalizarCliente/:nome', LocalizarCliente);
  THorse.Get('/LocalizarProfissional/:nome', LocalizarProfissional);
  THorse.Get('/BuscarHorariosDisponiveis/:data/:turno/:nomeDoProfissional', BuscarHorariosDisponiveis);
  THorse.Get('/MarcarHorario/:idCliente/:idAgenda', MarcarHorario);
  THorse.Listen(9000);
end.
