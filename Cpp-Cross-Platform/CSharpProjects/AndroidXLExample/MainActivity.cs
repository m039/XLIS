using Android.App;
using Android.Widget;
using Android.OS;

namespace AndroidXLExample
{
	[Activity(Label = "AndroidXL", MainLauncher = true, Icon = "@mipmap/icon")]
	public class MainActivity : Activity
	{
		protected override void OnCreate(Bundle savedInstanceState)
		{
			base.OnCreate(savedInstanceState);

			// Set our view from the "main" layout resource
			SetContentView(Resource.Layout.Main);

			FindViewById<TextView>(Resource.Id.main_label)
				.Text = CppSharpLibrary.XLExample.GetString();
		}
	}
}

