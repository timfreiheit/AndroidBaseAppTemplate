package ${packageName}.ui;

import android.databinding.DataBindingUtil;
import android.os.Bundle;

import ${packageName}.ui.base.BaseActivity;

import ${packageName}.R;

public class ${activityClass} extends BaseActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
        DataBindingUtil.setContentView(this, R.layout.${layoutName});
	}

}