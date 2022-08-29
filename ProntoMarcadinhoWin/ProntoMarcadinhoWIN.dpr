program ProntoMarcadinhoWIN;

uses
  Vcl.Forms,
  view.Principal in 'View\view.Principal.pas' {Form1},
  DM in 'DM.pas' {DataModule2: TDataModule},
  view.CadastroProfissionais in 'View\view.CadastroProfissionais.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
