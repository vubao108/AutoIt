using AutoIt;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls.Expressions;


namespace WcfServiceRunAutoIt
{
    public static class AutoItService
    {
        public static IntPtr DictHandle = IntPtr.Zero;
        public static string  SearchDictionary(string word)
        {
            //AutoItX.AutoItSetOption("WinTitleMatchMode", 4);
            
            
            //AutoItX.Send("^!");
            //AutoItX.Sleep(100);
            AutoItX.Run(@"C:\Program Files (x86)\GoldenDict\GoldenDict.exe -w " + $"\"{word}\"", "" );

            // AutoItX.Run
            //AutoItX.WinWait("[REGEXPTITLE:- GoldenDict$]");
            //AutoItX.Sleep(300);
            //AutoItX.WinActivate("[CLASS:QWidget]");
            //AutoItX.WinActivate("[REGEXPTITLE:- GoldenDict]");
            //AutoItX.Sleep(100);
            //var x = AutoItX.Win
            //if (DictHandle == IntPtr.Zero)
            //{
            //    DictHandle = AutoItX.WinGetHandle("[REGEXPTITLE:- GoldenDict$]");
            //}

            ////AutoItX.WinWaitActive(DictHandle);
            //AutoItX.WinActivate(DictHandle);
            //string before = AutoItX.WinGetTitle("[ACTIVE]");
            ////if (AutoItX.WinActive("[REGEXPTITLE:- GoldenDict]") == 1)
            ////{
            //string isActive = "false";
            //if(AutoItX.WinActive(DictHandle) == 1) 
            //{ 
            //    //isActive = AutoItX.WinGetTitle("[ACTIVE]");

            //    isActive = "true";
            //   //AutoItX.Send("{DEL}");
            //   //AutoItX.Send("{BS 24}");
            //   // // end delete old wor
            //   // AutoItX.Sleep(20);
            //   //AutoItX.Send(word);
            //   // //AutoItX.Sleep(80);
            //   //AutoItX.Send("{ENTER}");
            //}

            return "activeTitle = " + AutoItX.WinGetTitle("[ACTIVE]") + $"word:{word}"; 
        }

        public static string SearchGoogle(string word)
        {
            AutoItX.Run(@"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe " 
                    + $"\"https://google.com/search?q={word}\"","");
            //AutoItX.Sleep(500);
            //var x = AutoItX.WinActivate("[CLASS:Chrome_WidgetWin_1]");
            //var active_str = AutoItX.WinGetTitle("[ACTIVE]");
            //AutoItX.Sleep(30);
            //AutoItX.Send("^t");
            //// end delete old word
            //AutoItX.Sleep(30);
            //AutoItX.Send(word);
            ////AutoItX.ControlGetFocus("[CLASS:Intermediate D3D Window]");
            ////AutoItX.ControlSend()
            //AutoItX.Send("{ENTER}");
            //return AutoItX.WinGetTitle("[ACTIVE]");

            //AutoItX.
            return "activeTitle = " + AutoItX.WinGetTitle("[ACTIVE]") + $"word:{word}";
        }


    }
}