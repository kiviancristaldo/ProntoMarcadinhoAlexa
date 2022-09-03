unit view.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Controller.CadastroProfissionais,
  Controller.CadastroClientes,
  Controller.Agendamento,
  Controller.DataETurnos;
{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  ControllerCadastroProfissionais:TControllerCadastroProfissionais;
begin
   ControllerCadastroProfissionais := TControllerCadastroProfissionais.Create;
   try
     ControllerCadastroProfissionais.AbrirForm(self);
   finally
     ControllerCadastroProfissionais.Free;
   end;
end;



procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  ControllerCadastroClientes:TControllerCadastroClientes;
begin
   ControllerCadastroClientes := TControllerCadastroClientes.Create;
   try
     ControllerCadastroClientes.AbrirForm(self);
   finally
     ControllerCadastroClientes.Free;
   end;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
var
  ControllerAgendamento:TControllerDataETurnos;
begin
   ControllerAgendamento := TControllerDataETurnos.Create;
   try
     ControllerAgendamento.AbrirForm(self);
   finally
     ControllerAgendamento.Free;
   end;
end;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
var
  ControllerAgendamento:TControllerAgendamento;
begin
   ControllerAgendamento := TControllerAgendamento.Create;
   try
     ControllerAgendamento.AbrirForm(self);
   finally
     ControllerAgendamento.Free;
   end;
end;



end.
