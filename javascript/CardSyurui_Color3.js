(function ()
{
	"use strict"; 
	kintone.events.on('app.record.index.show', function (event)
	{
		// 【開始】『カードの種類』を色分けする
		var elStatus = kintone.app.getFieldElements('カードの種類');
		for (var i = 0; i < elStatus.length; i++)
		{
			var record = event.records[i]; 
			if (record['カードの種類']['value'] === "キャッシュカード") 
			{
				elStatus[i].style.color = 'red';
			}
			if (record['カードの種類']['value'] === "ポイントカード") 
			{
				elStatus[i].style.color = 'blue';
			}
			if (record['カードの種類']['value'] === "会員カード") 
			{
				elStatus[i].style.color = 'green';
			}
			if (record['カードの種類']['value'] === "身分証明書") 
			{
				elStatus[i].style.color = 'brown';
			}
			if (record['カードの種類']['value'] === "診察券") 
			{
				elStatus[i].style.color = 'purple';
			}
			if (record['カードの種類']['value'] === "割引券") 
			{
				elStatus[i].style.color = 'olive';
			}
		}
		// 【終了】『カードの種類』を色分けする
	});
})();
