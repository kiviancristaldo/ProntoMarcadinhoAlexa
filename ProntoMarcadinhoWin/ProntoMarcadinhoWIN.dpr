program ProntoMarcadinhoWIN;

uses
  Vcl.Forms,
  view.Principal in 'View\view.Principal.pas' {frmPrincipal},
  DM in 'DM.pas' {dados: TDataModule},
  view.CadastroProfissionais in 'View\view.CadastroProfissionais.pas' {frmCadastroProfissionais},
  Controller.CadastroProfissionais in 'Controller\Controller.CadastroProfissionais.pas',
  view.CadastroClientes in 'View\view.CadastroClientes.pas' {frmCadastroClientes},
  Controller.CadastroClientes in 'Controller\Controller.CadastroClientes.pas',
  view.MarcarAgendamento in 'View\view.MarcarAgendamento.pas' {frmAgendamento},
  Controller.Agendamento in 'Controller\Controller.Agendamento.pas',
  eCalendario.Component in 'eCalendario\eCalendario.Component.pas' {eCalendario},
  model.Agenda in 'Model\model.Agenda.pas',
  Controller.DataETurnos in 'Controller\Controller.DataETurnos.pas',
  model.CadastroProfissionais in 'Model\model.CadastroProfissionais.pas',
  view.GerarAgenda in 'View\view.GerarAgenda.pas' {frmGerarAgenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdados, dados);
  Application.CreateForm(TfrmCadastroClientes, frmCadastroClientes);
  Application.CreateForm(TfrmAgendamento, frmAgendamento);
  Application.CreateForm(TfrmGerarAgenda, frmGerarAgenda);
  Application.Run;
end.
