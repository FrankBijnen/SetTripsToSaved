program SetTripsToSaved_Delphi;

uses
  Vcl.Forms,
  UFrmSetTripsToSaved in 'UFrmSetTripsToSaved.pas' {FrmSetTripsToSaved},
  UnitTrip in 'UnitTrip.pas',
  UnitStringUtils in 'UnitStringUtils.pas',
  ListViewSort in 'ListViewSort.pas',
  mtp_helper in 'mtp_helper.pas',
  PortableDeviceApiLib_TLB in 'PortableDeviceApiLib_TLB.pas',
  UnitMtpDevice in 'UnitMtpDevice.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSetTripsToSaved, FrmSetTripsToSaved);
  Application.Run;
end.
