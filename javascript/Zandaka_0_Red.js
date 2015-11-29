(function ()
{
	"use strict"; 
	kintone.events.on('app.record.index.show', function (event)
	{
		// 【開始】『ポイント残高』が0の時だけ太字の赤字にする
		var elStatus = kintone.app.getFieldElements('ポイント残高');
		for (var i = 0; i < elStatus.length; i++)
		{
			var record = event.records[i]; 
			if (record['ポイント残高']['value'] === "0") 
			{
				elStatus[i].style.color = 'red';
				elStatus[i].style.fontWeight = 'bold';
			}
		}
		// 【終了】『ポイント残高』が0の時だけ太字の赤字にする
	});
})();
