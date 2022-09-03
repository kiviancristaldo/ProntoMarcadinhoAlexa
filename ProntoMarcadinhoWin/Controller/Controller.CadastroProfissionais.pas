unit Controller.CadastroProfissionais;

interface

uses
  System.Classes;

type TControllerCadastroProfissionais = class
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

uses view.CadastroProfissionais,DM;

{ TControllerCadastroProfissionais }

procedure TControllerCadastroProfissionais.AbrirForm(ComponentePai:TComponent);
var CadastroProfissionais:TFrmCadastroProfissionais;

begin
   CadastroProfissionais := TFrmCadastroProfissionais.Create(ComponentePai,Self);
   try
     MostraDados;
     CadastroProfissionais.Showmodal;
   finally
     CadastroProfissionais.Free;
   end;
end;

procedure TControllerCadastroProfissionais.Cancelar;
begin
   dados.qryProfissionais.Cancel;
end;


procedure TControllerCadastroProfissionais.Editar;
begin

   dados.qryProfissionais.Edit;
end;

procedure TControllerCadastroProfissionais.Excluir;
begin

   dados.qryProfissionais.Delete;
end;

procedure TControllerCadastroProfissionais.Gravar;
begin
  dados.qryProfissionais.Post;
end;

procedure TControllerCadastroProfissionais.Incluir;
begin
   dados.qryProfissionais.Append;
end;

procedure TControllerCadastroProfissionais.MostraDados;
begin
  dados.qryProfissionais.Open;
end;

end.
