using System;
using System.Runtime.InteropServices;
using static CSharpConsoleProject.Global;

namespace CSharpConsoleProject
{
	public class Foo : IDisposable
	{
		private IntPtr _foo;

		public Foo()
		{
			_foo = foo_create();
			if (_foo == IntPtr.Zero)
			{
				throw new OutOfMemoryException();
			}
		}

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern IntPtr foo_create();

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern void foo_destroy(IntPtr foo);

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern int foo_get_number(IntPtr foo);

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern void foo_set_number(IntPtr foo, int number);

		public int Number
		{
			get
			{
				return foo_get_number(_foo);
			}

			set
			{
				foo_set_number(_foo, value);
			}
		}

		public void Dispose()
		{
			foo_destroy(_foo);
		}
	}
}
