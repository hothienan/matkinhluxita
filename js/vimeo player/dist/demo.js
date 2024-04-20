var players = plyr.setup('.js-player');

//players.stop();

/*
console.log(players[0].getContainer());
console.log(players[0].getMedia());
console.log(players[0].getEmbed());
console.log(players[0].getType());
console.log(players[0].isReady());
*/
//console.log(players[0]);

players[0].on('ready', function (event) {
	var instance = event.detail.plyr;

	instance.stop();

	
});


players[0].on('ended', function (event) {
	var instance = event.detail.plyr;	

	instance.restart();
	
	
	
});