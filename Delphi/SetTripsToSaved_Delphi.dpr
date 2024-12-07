program SetTripsToSaved_Delphi;

uses
  Vcl.Forms,
  UFrmSetTripsToSaved in 'UFrmSetTripsToSaved.pas' {FrmSetTripsToSaved},
  UnitStringutils,
  UnitTrip in 'UnitTrip.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

  Application.Initialize;
  CreateTempPath('TRIP');
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSetTripsToSaved, FrmSetTripsToSaved);
  Application.Run;
end.
