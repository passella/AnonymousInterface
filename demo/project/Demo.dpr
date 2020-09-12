program Demo;

uses
   madExcept,
   madLinkDisAsm,
   madListHardware,
   madListProcesses,
   madListModules,
   Vcl.Forms,
   untPrincipal in '..\src\untPrincipal.pas' {frmPrincipal} ,
   untAnonymousInterface in '..\..\lib\untAnonymousInterface.pas';

{$R *.res}


begin
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   Application.CreateForm(TfrmPrincipal, frmPrincipal);
   Application.Run;

end.
