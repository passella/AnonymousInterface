unit untPrincipal;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Rtti, System.TypInfo;

type
   IMinhaInterface1 = interface;
   IMinhaInterface2 = interface;
   IMinhaInterface3 = interface;

   TfrmPrincipal = class(TForm)
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
      procedure Fazer1(const intF: IMinhaInterface1);
      procedure Fazer2(const intF: IMinhaInterface2);
      procedure Fazer3(const intF: IMinhaInterface3);
   public
      { Public declarations }
   end;

   IMinhaInterface1 = interface(IInvokable)
      ['{584189F9-AE55-478F-B4DA-085BA48A24DE}']
      procedure Fazer(const strTexto: string); overload;
      procedure Fazer(); overload;
   end;

   IMinhaInterface2 = interface(IInvokable)
      ['{FCC5376A-835A-4D11-8522-3CF609707117}']
      procedure Fazer(const strTexto: string); overload;
   end;

   IMinhaInterface3 = interface(IInvokable)
      ['{50B27BC1-43F0-4AE3-A0AB-FD6B9DF63A64}']
      procedure Fazer(); overload;
   end;

var
   frmPrincipal: TfrmPrincipal;

implementation

uses
   untAnonymousInterface;

{$R *.dfm}


procedure TfrmPrincipal.Fazer2(const intF: IMinhaInterface2);
begin
   intF.Fazer('procedure TfrmPrincipal.Fazer2(const intF: IMinhaInterface2)');
end;

procedure TfrmPrincipal.Fazer3(const intF: IMinhaInterface3);
begin
   intF.Fazer;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
type
   TFazer1 = reference to procedure(const strTexto: string);
   TFazer2 = reference to procedure();
begin
   Fazer1(TAnonymousInterfaceBuilderFactory
      .CreateBuilder<IMinhaInterface1>()
      .AddMethod<TFazer1>(procedure(const strTexto: string)
         begin
            ShowMessage(strTexto);
         end)
      .AddMethod(@procedure
         begin
            ShowMessage(Self.ClassName);
         end)
      .Build());

   Fazer2(TAnonymousInterface.Wrap<IMinhaInterface2, TFazer1>(
      procedure(const strTexto: string)
      begin
         ShowMessage(strTexto);
      end));

   Fazer3(TAnonymousInterface.Wrap<IMinhaInterface3>(
      @procedure()
      begin
         ShowMessage(Self.ClassName);
      end));
end;

procedure TfrmPrincipal.Fazer1(const intF: IMinhaInterface1);
begin
   intF.Fazer('Teste');
   intF.Fazer();
end;

end.
