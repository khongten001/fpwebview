program lclembed;

{$mode objfpc}{$H+}
{$ifdef mswindows}{$linklib libwebview}{$endif}

uses
  {$IFDEF UNIX}cthreads,{$ENDIF}
  Interfaces, Forms, math,
  classes, fphttpapp, fpwebfile,
  guiform;

{$R *.res}

type
  TWebApplication = class(THTTPApplication)
  end;

  TWebServerThread = class(TThread)
    protected
      procedure Execute; override;
    public
      constructor Create(CreateSuspended: boolean);
  end;

constructor TWebServerThread.Create(CreateSuspended: boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := true;
end;

procedure TWebServerThread.Execute;
begin
  fphttpapp.Application.Run;
end;

var
  currDir: String;

begin
  { Set math masks. libwebview throws at least one of these from somewhere deep inside. }
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);

  { Set up embedded webserver. }
  GetDir(0, currDir);
  TSimpleFileModule.BaseDir := currDir + '/htdocs';
  TSimpleFileModule.RegisterDefaultRoute;
  TSimpleFileModule.IndexPageName := 'index.html';
  MimeTypesFile := 'mime.types';
  fphttpapp.Application.Port := 8000;
  fphttpapp.Application.Threaded := true;
  fphttpapp.Application.Initialize;
  TWebServerThread.Create(false);

  { Set up LCL application. }
  RequireDerivedFormResource:=True;
  Forms.Application.Scaled:=True;
  Forms.Application.Initialize;
  Forms.Application.CreateForm(TForm1, Form1);
  Forms.Application.Run;
end.

