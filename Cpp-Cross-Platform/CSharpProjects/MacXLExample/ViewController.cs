using System;

using AppKit;
using Foundation;

namespace MacXLExample
{
	public partial class ViewController : NSViewController
	{
		public ViewController(IntPtr handle) : base(handle)
		{
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			// Do any additional setup after loading the view.

			string a = "0";

			for (int i = 0; i < 100; i++)
			{
				a += "123";
			}

			MainLabel.StringValue = "m039\nm0391";
		}

		public override NSObject RepresentedObject
		{
			get
			{
				return base.RepresentedObject;
			}
			set
			{
				base.RepresentedObject = value;
				// Update the view, if already loaded.
			}
		}
	}
}
