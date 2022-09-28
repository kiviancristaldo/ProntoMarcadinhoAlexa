unit Controller.CadastroClientes;

interface

uses system.classes;

type TControllerCadastroClientes = class
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

uses view.CadastroClientes,DM;

{ TControllerCadastroClientes }

procedure TControllerCadastroClientes.AbrirForm(ComponentePai: TComponent);
var CadastroClientes:TFrmCadastroClientes;

begin
   CadastroClientes := TFrmCadastroClientes.Create(ComponentePai,Self);
   try
     MostraDados;
     CadastroClientes.Showmodal;
   finally
     CadastroClientes.Free;
   end;
end;

procedure TControllerCadastroClientes.Cancelar;
begin
   dados.qryClientes.Cancel;
end;

procedure TControllerCadastroClientes.Editar;
begin
   dados.qryClientes.Edit;

end;

procedure TControllerCadastroClientes.Excluir;
begin
   dados.qryClientes.Delete;

end;

procedure TControllerCadastroClientes.Gravar;
begin
   dados.qryClientes.Post;

end;

procedure TControllerCadastroClientes.Incluir;
begin
   dados.qryClientes.Append;
   dados.qryClientesID.AsInteger := dados.UltimoID('CLIENTE')+1;

end;

procedure TControllerCadastroClientes.MostraDados;
begin
   dados.qryClientes.Open;

end;

end.
