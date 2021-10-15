// 【フルスクリーンボタンプラグイン ver1.00】 2021/10/15
//  by hororo http://hororo.wp.xdomain.jp/

//const MC = {};

	//const fullscreen = function(){
	function fullscreen(){
		const isFullScreen = document.webkitFullscreenElement || document.mozFullScreenElement || document.msFullscreenElement || document.fullScreenElement || false;
		const isEnableFullScreen = document.fullscreenEnabled || document.webkitFullscreenEnabled || document.mozFullScreenEnabled || document.msFullscreenEnabled || false;
		if( isEnableFullScreen ){
			if(isFullScreen) TYRANO.kag.variable.sf.fullsc.graphic = TYRANO.kag.variable.sf.fullsc.img_exit;
			else TYRANO.kag.variable.sf.fullsc.graphic = TYRANO.kag.variable.sf.fullsc.img;
		}
	};

$(function() {
	let fullsc = 0;
	$(window).on('orientationchange resize', function(e) {
		if (fullsc > 0) {clearTimeout(fullsc);}
		fullsc = setTimeout(function () {
			fullscreen();
			$(".fullscreen").attr('src','./data/image/'+TYRANO.kag.variable.sf.fullsc.graphic);
		}, 100);
	});
});
