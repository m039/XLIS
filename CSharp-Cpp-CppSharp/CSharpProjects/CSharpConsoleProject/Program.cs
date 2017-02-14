using System;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;
using CppFooBar;

namespace CSharpConsoleProject
{
	class MainClass
	{
		public static void TestFoo()
		{
			var foo = new Foo();

			Console.Write(
				"== Foo ==\n" +
				"Foo.number: " + foo.Number + "\n" +
				"Foo.SetNumber(4005)\n"
			);

			foo.Number = 4005;

			Console.Write(
				"Foo.number: " + foo.Number + "\n"
			);
		}

		private class BarImpl : IBar
		{
			public override int Number
			{
				get
				{
					return 131245;
				}
			}
		}

		public static void TestBar()
		{
			var bar = new Bar();

			Console.Write(
				"== Bar ==\n" +
				"Bar.PerformGetNumber: " + bar.PerformGetNumber() + "\n" +
				"Bar.Register(new BarImpl())\n"
			);

			bar.Register(new BarImpl());

			Console.Write(
				"Bar.PerformGetNumber: " + bar.PerformGetNumber() + "\n"
			);
		}

		public static void Main(string[] args)
		{
			TestFoo();
			Console.WriteLine();
			TestBar();
		}
	}
}