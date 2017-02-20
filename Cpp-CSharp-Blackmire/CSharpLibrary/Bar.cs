namespace CSharpFooBarLibrary
{
	public class Bar
	{
		private IBar impl;

		public void Register(IBar ibar)
		{
			this.impl = ibar;
		}

		public int PerformGetNumber()
		{
			if (impl == null)
			{
				return -1;
			}
			else
			{
				return impl.GetNumber();
			}
		}
	}
}
