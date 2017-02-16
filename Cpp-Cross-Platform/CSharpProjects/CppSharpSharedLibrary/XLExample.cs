
using System;
using CppFooBar;

namespace CppSharpLibrary
{
	public static class XLExample
	{
		public static string TestFoo()
		{
			var foo = new Foo();
			var s = string.Empty;

			s += "== Foo ==\n";
			s += "Foo.number: " + foo.Number + "\n";
			s += "Foo.SetNumber(4005)\n";

			foo.Number = 4005;

			s += "Foo.number: " + foo.Number + "\n";

			return s;
		}

		private class BarImpl : IBar
		{
			public override int Number
			{
				get
				{
					return 1301245;
				}
			}
		}

		public static string TestBar()
		{
			var bar = new Bar();
			var s = string.Empty;

			s += "== Bar ==\n";
			s += "Bar.PerformGetNumber: " + bar.PerformGetNumber() + "\n";
			s += "Bar.Register(new BarImpl())\n";

			bar.Register(new BarImpl());

			s += "Bar.PerformGetNumber: " + bar.PerformGetNumber() + "\n";

			return s;
		}

		public static string GetString()
		{
			return TestFoo() + "\n" + TestBar();
		}
	}
}
