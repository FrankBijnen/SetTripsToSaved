//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORMNS("..\Delphi\UFrmSetTripsToSaved.pas", Ufrmsettripstosaved, FrmSetTripsToSaved);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
    try
    {
         Application->Initialize();
         Application->MainFormOnTaskBar = true;
         Application->CreateForm(__classid(TFrmSetTripsToSaved), &FrmSetTripsToSaved);
         Application->Run();
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    catch (...)
    {
         try
         {
             throw Exception("");
         }
         catch (Exception &exception)
         {
             Application->ShowException(&exception);
         }
    }
    return 0;
}
//---------------------------------------------------------------------------
