package com.adobe.sampleasextension;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.widget.Toast;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class getVersion implements FREFunction  {
	public FREObject call(FREContext ctx, FREObject[] passedArgs) {
		PackageManager manager = ctx.getActivity().getPackageManager();
		System.out.printf( "manager: %s\n", manager.toString() );
		
		String version = null;
		String version2 = null;
		try {
			System.out.printf( "getComponentName: %s\n", ctx.getActivity().getComponentName() );
			System.out.printf( "packageName: %s\n", ctx.getActivity().getPackageName() );
			
			PackageInfo info = manager.getPackageInfo(ctx.getActivity().getPackageName(), -1 );
			version = info.versionName;
			if (version == null) {
				version = "null !";
			} else if (version.length() == 0) {
				version = "length = 0 !";
			}
			System.out.printf( "version: %s\n", version.toString() );

			PackageInfo info2 = manager.getPackageInfo("com.adobe.air", -1 );
			version2 = info2.versionName;
			if(version2 == null) {
				version2 = "null !";
			} else if(version2.length() == 0) {
				version2 = "length = 0 !";
			}
			
			System.out.printf( "version2: %s\n", version2.toString() );
			Toast.makeText(ctx.getActivity(), "app version: " + version + " AIR version: " + version2, 
					Toast.LENGTH_SHORT).show();
		} catch (Exception e) {
			Toast.makeText(ctx.getActivity(), e.toString(), Toast.LENGTH_SHORT).show();
		}
		
		return null;
	}
}
