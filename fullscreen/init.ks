;【フルスクリーンボタンプラグイン ver1.00】 2021/10/15
; by hororo http://hororo.wp.xdomain.jp/
;
[loadjs storage="plugin/fullscreen/fullscreen.js"]
[loadcss file="./data/others/plugin/fullscreen/style.css"]

[iscript]
	mp.img = mp.img || "fullscreen.png";
	mp.img_exit = mp.img_exit || "fullscreen_exit.png";
	mp.width = mp.width || "50";
	mp.height = mp.height || "50";
	mp.y = mp.y || "-10";
	mp.x = mp.x || "-10";
	mp.zindex = mp.zindex || "99999999"; //"9999999999";
	mp.clearfix = mp.clearfix || "yes";
	sf.fullsc = mp;
	sf.fullsc.graphic = mp.img;
[endscript]

[macro name=fullscreen]
	[iscript]
		for(let key in sf.fullsc){ if(mp[key]) sf.fullsc[key] = mp[key]; }; //マクロの指定をsf変数に格納
		fullscreen();  //フルスクリーン状態をチェック
	[endscript]

	@button role="fullscreen" name="fullscreen" graphic=&sf.fullsc.graphic x=&sf.fullsc.x y=&sf.fullsc.y width=&sf.fullsc.width height=&sf.fullsc.height *

	[iscript]
		if(parseInt(sf.fullsc.y) < 0) $(".fullscreen").css("top","").css("bottom",-(parseInt(sf.fullsc.y)) + "px"); //-対応
		if(parseInt(sf.fullsc.x) < 0) $(".fullscreen").css("left","").css("right",-(parseInt(sf.fullsc.x)) + "px"); //-対応
		if(sf.fullsc.zindex != "default") $(".fullscreen").css("z-index",sf.fullsc.zindex); //z-index
		if(sf.fullsc.clearfix == "no" || sf.fullsc.clearfix == "false") $(".fullscreen").removeClass("fixlayer").addClass("fix"); //clearfix でクリアさせない
		if($.userenv() != 'pc') $(".fullscreen").addClass("mobile"); //モバイル判別用class追加
	[endscript]
[endmacro]


[return]
