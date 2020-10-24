using AutoIt;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfServiceRunAutoIt
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public string GetDict(string words)
        {
            AutoItService.SearchDictionary(words);
            return "Dict OK";
        }

        public string GetWordDetails(string words)
        {

            //List<Words> stuList = new List<Words>();
            //stuList.Add(new Words { Id = 123, Name = "Ramakrishna" });
            //AutoItX.Run("notepad.exe", @"C:\Windows");
            //AutoItX.WinWaitActive("Untitled");
            //AutoItX.Send("I'm in notepad");
            //IntPtr winHandle = AutoItX.WinGetHandle("Untitled");
            //AutoItX.WinKill(winHandle);
            //; return stuList;

            AutoItService.SearchGoogle(words);
            AutoItService.SearchDictionary(words);
            return "Dict vs web OK";
        }
    }
}
