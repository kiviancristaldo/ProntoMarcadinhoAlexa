unit Controller.Agendamento;

interface

uses system.classes;

type TControllerAgendamento = class
  public
    procedure Incluir;
    procedure Editar;
    procedure Excluir;
    procedure Gravar;
    procedure Cancelar;
    procedure AbrirForm(ComponentePai:TComponent);
    procedure MostraDados;
end;

implementation

uses view.MarcarAgendamento,DM;

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

procedure TControllerAgendamento.MostraDados;
begin
   dados.qryAgenda.Open;

end;

end.
