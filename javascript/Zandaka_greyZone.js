(function ()
{
	"use strict"; 
	kintone.events.on('app.record.index.show', function (event)
	{
		// 【開始】『ポイント残高』が入力されていないなら灰色になる
		var elStatus = kintone.app.getFieldElements('ポイント残高');
		for (var i = 0; i < elStatus.length; i++)
		{
			var record = event.records[i]; 
			if (record['ポイント残高']['value'] === "") 
			{
				elStatus[i].style.backgroundColor = 'silver';
			}
		}
		// 【終了】『ポイント残高』が入力されていないなら灰色になる
	});
})();
