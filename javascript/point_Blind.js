(function () {
    "use strict";
    kintone.events.on(['app.record.edit.change.カードの種類', 'app.record.create.change.カードの種類', 'app.record.index.edit.change.カードの種類'], function (event) {
        // ポイント残高の入力判定
        var record = event['record'];

        if (record['カードの種類'].value != "ポイントカード" ){
          record['ポイント残高'].disabled = true;


        }else {
          record['ポイント残高'].disabled =false;

        }

        return event;
    });
})();

(function () {
    "use strict";
    kintone.events.on(['app.record.edit.change.カードの種類', 'app.record.create.change.カードの種類','app.record.index.edit.change.カードの種類'], function (event) {
	// 名義の入力判定
        var record = event['record'];

        if (record['カードの種類'].value == "キャッシュカード" ){
            record['名義'].disabled =false;
    　  }else if(record['カードの種類'].value == "クレジットカード" ){
      　         record['名義'].disabled =false;
                  }else if (record['カードの種類'].value == "診察券" ) {
                            record['名義'].disabled =false;
                          }else {
                                  record['名義'].disabled = true;
                                }
        return event;
    });
})();
