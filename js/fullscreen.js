function toggleFullScreen(){
	db = document.getElementById('editor');
	
		if(db.requestFullScreen){
		    db.requestFullScreen();
		} else if(db.webkitRequestFullscreen){
		    db.webkitRequestFullscreen();
		} else if(db.mozRequestFullScreen){
		    db.mozRequestFullScreen();
		} else if(db.msRequestFullscreen){
		    db.msRequestFullscreen();
		}
		
	} 