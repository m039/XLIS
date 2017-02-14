using System;
using System.Runtime.InteropServices;
using static CSharpConsoleProject.Global;

namespace CSharpConsoleProject
{
	public class Bar : IDisposable
	{
		private IntPtr _bar;

		private IntPtr _ibar;

		// hold reference against GC
		private ibar_get_number_callback _ibar_callback;

		public Bar()
		{
			_bar = bar_create();
			if (_bar == IntPtr.Zero)
			{
				throw new OutOfMemoryException();
			}
		}

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern IntPtr bar_create();

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern void bar_destroy(IntPtr bar);

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern int bar_perform_get_number(IntPtr bar);

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern int bar_register(IntPtr bar, IntPtr ibar);

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern IntPtr ibar_create(ibar_get_number_callback callback);

		[DllImport(CFooBarDLL, CallingConvention = CallingConvention.Cdecl)]
		static extern int ibar_destroy(IntPtr ibar);

		public void Register(IBar ibar) 
		{
			if (IntPtr.Zero != _ibar)
			{
				ibar_destroy(_ibar);
				_ibar = IntPtr.Zero;
				_ibar_callback = null;
			}

			_ibar_callback = ibar.GetNumber;
			_ibar = ibar_create(_ibar_callback);

			if (_ibar == IntPtr.Zero)
			{
				throw new OutOfMemoryException();
			}

			bar_register(_bar, _ibar);
		}

		public int PerformGetNumber()
		{
			return bar_perform_get_number(_bar);
		}

		public void Dispose()
		{
			bar_destroy(_bar);
			if (IntPtr.Zero != _ibar)
			{
				ibar_destroy(_ibar);
				_ibar = IntPtr.Zero;
				_ibar_callback = null;
			}
		}

		private delegate int ibar_get_number_callback();
	}
}
