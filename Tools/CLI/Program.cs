using System;
using System.Linq;
using System.IO;

namespace UELib.CLI
{
    public static class Program
    {
        /// <summary>
        /// Basic command line app for UELib.dll.
        /// 
        /// The CLI parses the commandline as following:
        /// <code>["path to file"] ["command"]</code>
        /// For example: <code>"Core.u" "obj decompile Object"</code>
        /// Command format: <code>[command] [action] [object path]</code>
        /// Supported commands:
        /// </summary>
        private static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("Missing file path!");
                return;
            }

            string filePath = args[0];
            string outputPath = args[1];
            var pkg = UnrealLoader.LoadPackage(filePath);
            pkg.InitializePackage(UnrealPackage.InitFlags.All);
           // pkg.InitializeImportObjects();

            for (int i = 0; i < pkg.Objects.Count; i++)
            {
                var obj = pkg.Objects[i];
                //obj.Object.BeginDeserializing();
                //obj.Object.PostInitialize();

                bool hackFindInExportTable = false;
                for (int d = 0; d < pkg.Exports.Count; d++)
                {
                    if (pkg.Exports[d].Object.Name == obj.Name)
                    {
                        hackFindInExportTable = true;
                        break;
                    }
                }

                if (!hackFindInExportTable)
                    continue;

                if (!(obj.GetType() == typeof(UELib.Core.UStruct) || obj.GetType() == typeof(UELib.Core.UClass)))
                    continue;

                string output;
                try
                {
                    output = obj.Decompile();
                }
                catch
                {
                    Console.WriteLine("FAILED");
                    continue;
                }

                File.WriteAllText(outputPath + obj.Name + ".uc", output);
            }
        }
    }
}