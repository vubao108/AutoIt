using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Description;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;
using WcfServiceRunAutoIt;

namespace ConsoleAppHostWcf
{
    class Program
    {
        static void Main(string[] args)
        {
            // Step 1: Create a URI to serve as the base address.
            Uri baseAddress = new Uri("http://192.168.115.1:1082/");

            // Step 2: Create a ServiceHost instance.
            using (WebServiceHost webHost = new WebServiceHost(typeof(Service1), baseAddress))
            {

                try
                {
                    webHost.Open();
                    
                    Console.WriteLine($"The service is ready at {baseAddress}");

                    // Close the ServiceHost to stop the service.
                    Console.WriteLine("Press <Enter> to terminate the service.");
                    Console.WriteLine();
                    Console.ReadLine();
                    webHost.Close();
                }
                catch (Exception ce)
                {
                    Console.WriteLine("An exception occurred: {0}", ce.Message);
                    Console.ReadLine();
                    webHost.Abort();
                }
            }
            Console.ReadLine();
        }
    }
}
