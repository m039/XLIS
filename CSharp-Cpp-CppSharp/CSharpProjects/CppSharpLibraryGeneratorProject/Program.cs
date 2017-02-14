using System;
using CppSharp;
using CppSharp.AST;
using CppSharp.Generators;
using CppSharp.Passes;

namespace CppSharpLibraryProject
{
	class MainClass
	{
		class FooBarLibrary : ILibrary
		{
			public void Postprocess(Driver driver, ASTContext ctx)
			{
			}

			public void Preprocess(Driver driver, ASTContext ctx)
			{
				// Fixes:
				ctx.IgnoreClassField("Foo", "number");
			}

			public void Setup(Driver driver)
			{
				var options = driver.Options;
				options.GeneratorKind = GeneratorKind.CSharp;

				options.LibraryName = "CppFooBar";
				var prefix = Environment.CurrentDirectory + "/../../../../CppLibraryProject/";
				options.Headers.Add(prefix + "Foo.hpp");
				options.Headers.Add(prefix + "IBar.hpp");
				options.Headers.Add(prefix + "Bar.hpp");
			}

			public void SetupPasses(Driver driver)
			{
			}
		}

		public static void Main(string[] args)
		{
			ConsoleDriver.Run(new FooBarLibrary());
		}
	}
}
