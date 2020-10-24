using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoIt;
using AutoItX3Lib;


namespace FirstDemo
{
    class Program
    {
        
        static void Main(string[] args)
        {
            //AutoItX.Run("notepad.exe", @"C:\Windows");
            //AutoItX.WinWaitActive("Untitled");
            //AutoItX.Send("I'm in notepad");
            //IntPtr winHandle = AutoItX.WinGetHandle("Untitled");
            //AutoItX.WinKill(winHandle);
            

            AutoItX.ClipPut("");
            //AutoItX.Send("^c");
            //if (string.IsNullOrEmpty(AutoItX.ClipGet()))
            //{
            //    AutoItX.Send("^a");
            //    AutoItX.Send("^c");
            //}
            //string word = AutoItX.ClipGet();
            AutoItX.Run("GoldenDict.exe", @"C:\Program Files (x86)\GoldenDict");
            var x = AutoItX.WinActivate("[CLASS:QWidget]");
            var active_str = AutoItX.WinGetTitle("[ACTIVE]");
            AutoItX.Send("{DEL}");
            AutoItX.Send("{BS}");
            // end delete old word
            AutoItX.Send("yamato");
            AutoItX.Send("{ENTER}");


        }
    }
}
