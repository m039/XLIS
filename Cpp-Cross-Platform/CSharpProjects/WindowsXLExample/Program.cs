using System;
using System.Runtime.InteropServices;

namespace WindowsXLExample
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			Console.WriteLine(CppSharpLibrary.XLExample.GetString());
		}
	}
}
