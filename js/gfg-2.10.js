$(document).ready(function () {
	//auto and live completion 
	ace.require("ace/ext/language_tools");
        editor.setOptions({
                enableBasicAutocompletion: true,
                enableSnippets: true,
                enableLiveAutocompletion: true
        });
	//end
	editor.$blockScrolling = Infinity;
	//disables vertical line in ace editor
	editor.setOption("showPrintMargin", false);

	var tabSize = 4;
        var tabCode = [];
        var tabLang = [];
        var tabVis = [];
        var currentTab = 0;

	var the = localStorage.getItem('theme');
	if( the == null || the == 'light' ) {
		loadLight();
	} else {
		loadDark();
	}

	$( ".theme" ).click( function() {
		if( $(this).text() == 'Light' ) {
			loadLight();
		} else if( $(this).text() == 'Dark' ) {
			loadDark();
		}
	});

	function loadLight() {
		localStorage.setItem( 'theme', 'light' );
		// $( "body" ).css( "background-color", "#fff" );
		// $( ".gb" ).css( "background-color", "" ); //gray back
		// $( ".wf" ).css( "color", "" ); //white fore
		// $( ".bb" ).css( "background-color", "" ); //black back
		$( ".g-recaptcha" ).attr( "data-theme", "light" );
		$( ".jumbotron" ).css( "background-color", "" );

		if( editor != null ) {
			editor.setTheme("ace/theme/chrome");
		}
	}

	function loadDark() {
		localStorage.setItem( 'theme', 'dark' );
		// $( "body" ).css( "background-color", "#000" );
		// $( ".gb" ).css( "background-color", "#2F2F2F" ); //gray back
		// $( ".wf" ).css( "color", "#FFFFFF" ); //white fore
		// $( ".bb" ).css( "background-color", "#000000" ); //black back
		$( ".g-recaptcha" ).attr( "data-theme", "dark" );
		$( ".jumbotron" ).css( "background-color", "#2A2A2A" );

		if( editor != null ) {
			editor.setTheme("ace/theme/vibrant_ink");
		}
	}


	if( editor == null ) {
		return;
	}
	editor.focus();

	var norOps = {
		minLines: 25,
		maxLines: null,
		fontSize: "12pt"
	};

	var fullOps = {
		minLines: null,
		maxLines: null
	};

	editor.setOptions( norOps );

	function toggleFullScreen() {
		var elem = document.getElementById("editor");
		if (elem.requestFullscreen) {
		  elem.requestFullscreen();
		} else if (elem.msRequestFullscreen) {
		  elem.msRequestFullscreen();
		} else if (elem.mozRequestFullScreen) {
		  elem.mozRequestFullScreen();
		} else if (elem.webkitRequestFullscreen) {
		  elem.webkitRequestFullscreen();
		}
	}
	$( "#full" ).click( function() {
		toggleFullScreen();
	});
	$(".ace_editor").keydown(function(e) {
		if( e.which == 122 || ( e.which == 27 && $( "body" ).hasClass( "fullScreen" ) ) ) {
			toggleFullScreen();
			e.preventDefault();
		}
    });

	var defaultC = '#include <stdio.h>\n\nint main() {\n\t//code\n\treturn 0;\n}';
    var defaultCPP = '#include <iostream>\nusing namespace std;\n\nint main() {\n\t//code\n\treturn 0;\n}';
    var defaultJava = 'import java.io.*;\n\nclass GFG {\n\tpublic static void main (String[] args) {\n\t\t//code\n\t}\n}';
    var defaultPython = '#code';
    var defaultCs='using System;\n\npublic class GFG{\n\tstatic public void Main (){\n\t\t//Code\n\t}\n}';
    var defaultScala='object Main {\n\tdef main(args: Array[String]) {\n\t\t//Code\n\t}\n}';
    var defaultPerl='#!/usr/bin/perl\n# your code here\n';
    var defaultPhp='<?php\n\t//code\n?>';

	function insertTemplate() {
		var text = editor.session.getValue();
		if( language == 'C' ) {
                        editor.session.setMode("ace/mode/c_cpp");
                        if( text === '' || text == defaultJava || text == defaultCPP || text == defaultC || text == defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp) {
                                editor.session.setValue( defaultC );
                        }
                } else if( language == 'Cpp' || language=='Cpp14' ) {
                        editor.session.setMode("ace/mode/c_cpp");
                        if( text === '' || text == defaultJava || text == defaultCPP || text == defaultC || text == defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp) {
                                editor.session.setValue( defaultCPP );
                        }
                } else if( language == 'Java' ) {
                        editor.session.setMode("ace/mode/java");
                        if( text === '' || text == defaultJava || text == defaultCPP || text == defaultC || text == defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp) {
                                editor.session.setValue( defaultJava );
                        }
                } else if( language == 'Python' || language == 'Python3' ) {
                        editor.session.setMode("ace/mode/python");
                        if( text === '' || text == defaultJava || text == defaultCPP || text == defaultC || text == defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp) {
                                editor.session.setValue( defaultPython );
                        }
                } else if( language == 'Csharp') {
                        editor.session.setMode("ace/mode/csharp");
                        if( text === '' || text==defaultJava || text==defaultCPP || text==defaultC || text==defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp){
                                editor.session.setValue(defaultCs);
                        }
                } else if( language == 'Scala') {
                        editor.session.setMode("ace/mode/scala");
                        if( text === '' || text==defaultJava || text==defaultCPP || text==defaultC || text==defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp){
                                editor.session.setValue(defaultScala);
                        }
                } else if( language == 'Perl') {
                        editor.session.setMode("ace/mode/perl");
                        if( text === '' || text==defaultJava || text==defaultCPP || text==defaultC || text==defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp){
                                editor.session.setValue(defaultPerl);
                        }
                } else if( language == 'Php') {
                        editor.session.setMode("ace/mode/php");
                        if( text === '' || text==defaultJava || text==defaultCPP || text==defaultC || text==defaultPython || text==defaultCs || text==defaultScala || text==defaultPerl
                                || text==defaultPhp){
                                editor.session.setValue(defaultPhp);
                        }
                }
		tabCode[currentTab] = editor.session.getValue();
	}

	currentTab = parseInt(localStorage.getItem( 'currentTab' ));
        var tabCounter = 0;
        if( currentTab == '' || currentTab == null )currentTab = 0;

        for( var i = 0; i < tabSize; i++ ){
                tabCode[i] = localStorage.getItem( 'code'+i );
                tabLang[i] = localStorage.getItem( 'lang'+i );
                tabVis[i] = $.parseJSON(localStorage.getItem( 'vis'+i ));
                if( tabVis[i] == '' || tabVis[i] == null )tabVis[i] = false;
                if( tabCode[i] == null ) tabCode[i] = '';
                if( tabLang[i] == null || tabLang[i] == '' ) tabLang[i] = 'C';
                if( tabVis[i] == true )tabCounter++;
                $('#tab'+i+' > .text').text( $('[l='+tabLang[i]+']').html() );
        }
	var valid = true;
        if( tabVis[currentTab] == false || tabVis[0] == false )valid = false;
        for( var i = 1; i < tabSize; i++ ){
                if( tabVis[i] == true && tabVis[i-1] == false){
                        valid = false;
                        break;
                }
        }
        if( !valid ){
                for( var i = 1; i < tabSize; i++ ){
                        tabVis[i] = false;
                }
                tabCode[0] = '';
                tabLang[0] = 'C';
                tabVis[0] = true;
                currentTab = 0;
        }
        tabVis[currentTab] = true;
        if( tabLang[currentTab] == '')tabLang[currentTab] = 'C';
        if( tabCounter == 0 )tabCounter = 1;
        var text = editor.session.getValue();
        if( text != ''){ 
                for( var i = 1; i < tabSize; i++ ){
                        tabVis[i] = false;
                }
                tabCode[0] = text;
                tabLang[0] = language;
                tabVis[0] = true;
                currentTab = 0;
                tabCounter = 1;
        }else{
                language = tabLang[currentTab];
        }
        if( tabCode[currentTab] != ''){
                editor.session.setValue( tabCode[currentTab] );
        }
	$('#tab'+currentTab).css({'border-left':'1.5px solid #adadad','border-right':'1.5px solid #adadad','border-top':'1.5px solid #adadad','background-color':'#ebebeb'});
        $('#tab'+currentTab).css({'border-bottom':'none'});
        $('#tab'+currentTab+' > .closeTab').css({'background-color':'#ebebeb'});
        insertTemplate();
        for( var i = 0; i< tabSize; i++ ){
                if( tabVis[i] )$('#tab'+i).show();
                else break;
        }
	if( tabCounter == tabSize )$( '#addTab' ).fadeOut();
	if( tabCounter == 1 )$( '.closeTab' ).fadeOut();
        $('#addTab').click( function(){
            if( tabCounter >= tabSize ){alert("Can't add more tabs!");return;}
            $('#tab'+tabCounter).show();
            tabCode[tabCounter] = '';
            tabLang[tabCounter] = 'C';
            tabVis[tabCounter] = true;
            tabCode[currentTab] = editor.session.getValue();
            tabLang[currentTab] = language;
            $('#tab'+tabCounter+' > .text').text( $('[l='+tabLang[tabCounter]+']').html() );
            $('#tab'+currentTab).css({'border-left':'1px solid #adadad','border-right':'1px solid #adadad','border-top':'1px solid #adadad','background-color':'#ffffff'});
            $('#tab'+currentTab).css({'border-bottom':'2px solid #adadad'});
            $('#tab'+currentTab+' > .closeTab').css({'background-color':'#ffffff'});
            currentTab = tabCounter;
            $('#tab'+currentTab).css({'border-left':'1.5px solid #adadad','border-right':'1.5px solid #adadad','border-top':'1.5px solid #adadad','background-color':'#ebebeb'});
            $('#tab'+currentTab).css({'border-bottom':'none'});
            $('#tab'+currentTab+' > .closeTab').css({'background-color':'#ebebeb'});
            language = tabLang[tabCounter];
            editor.session.setValue(tabCode[i]);
            insertTemplate();
            $(".lang").css("background-color", "#ffffff" );
            $(".lang").css("color", "#000000");
            $("[l="+language+"]").css("background-color", "#39B54A");
            $("[l="+language+"]").css("color", "#000000");
            tabCounter++;
		    if( tabCounter == tabSize ){
                $('#addTab').fadeOut();
            }
        	$( '.closeTab' ).fadeIn();
	});
	$('.closeTab').click( function(){
                if( tabCounter == 1 ){
                        alert('Can\'t close this tab!');
                        return;
                }
                var name = parseInt($(this).attr('name'));
                var tmp = name;
                tabCode[currentTab] = editor.session.getValue();
		tabLang[currentTab] = language;
		for( var i = name + 1; i < tabSize; i++ ){
                        if( tabVis[i] ){
                                tabVis[name] = true;
                                tabCode[name] = tabCode[i];
                                tabLang[name] = tabLang[i];
                                $('#tab'+name+' > .text').text($('[l='+tabLang[i]+']').html());
                                name++;
                        }
                }
                $('#tab'+name).hide();
                tabVis[name] = false;
                $('#tab'+currentTab).css({'border-left':'1px solid #adadad','border-right':'1px solid #adadad','border-top':'1px solid #adadad','background-color':'#ffffff'});
                $('#tab'+currentTab).css({'border-bottom':'2px solid #adadad'});
                $('#tab'+currentTab+' > .closeTab').css({'background-color':'#ffffff'});
                if( parseInt(tabCounter) == parseInt(currentTab)+1 )currentTab--;
                $('#tab'+currentTab).css({'border-left':'1.5px solid #adadad','border-right':'1.5px solid #adadad','border-top':'1.5px solid #adadad','background-color':'#ebebeb'});
                $('#tab'+currentTab).css({'border-bottom':'none'});
                $('#tab'+currentTab+' > .closeTab').css({'background-color':'#ebebeb'});
                language = tabLang[currentTab];
                editor.session.setValue(tabCode[currentTab]);
                insertTemplate();
                $(".lang").css("background-color", "#ffffff" );
                $(".lang").css("color", "#000000");
                $("[l="+language+"]").css("background-color", "#39B54A");
                $("[l="+language+"]").css("color", "#000000");
                tabCounter--;
		if( tabCounter == 1 )$( '.closeTab' ).fadeOut();
		$( '#addTab' ).fadeIn();
        });
	$('.tab').click( function(e){
                if( e.target.tagName != 'DIV' )return;
                var id = $(this).attr('name');
                tabCode[currentTab] = editor.session.getValue();
                tabLang[currentTab] = language;
                $('#tab'+currentTab).css({'border-left':'1px solid #adadad','border-right':'1px solid #adadad','border-top':'1px solid #adadad','background-color':'#ffffff'});
                $('#tab'+currentTab).css({'border-bottom':'2px solid #adadad'});
                $('#tab'+currentTab+' > .closeTab').css({'background-color':'#ffffff'});
                currentTab = id;
                $('#tab'+currentTab).css({'border-left':'1.5px solid #adadad','border-right':'1.5px solid #adadad','border-top':'1.5px solid #adadad','background-color':'#ebebeb'});
                $('#tab'+currentTab).css({'border-bottom':'none'});
                $('#tab'+currentTab+' > .closeTab').css({'background-color':'#ebebeb'});
                language = tabLang[currentTab];
                editor.session.setValue(tabCode[currentTab]);
                insertTemplate();
                $(".lang").css("background-color", "#ffffff" );
                $(".lang").css("color", "#000000");
                $("[l="+language+"]").css("background-color", "#39B54A");
                $("[l="+language+"]").css("color", "#000000");
        });

        $(window).unload( function(){
                tabCode[currentTab] = editor.session.getValue();
                tabLang[currentTab] = language;
                for( var i = 0; i < tabSize; i++ ){
                        localStorage.setItem( 'code'+i, tabCode[i] );
                        localStorage.setItem( 'lang'+i, tabLang[i] );
                        localStorage.setItem( 'vis'+i, tabVis[i] );
                }
                localStorage.setItem( 'currentTab', currentTab );
        });
//add tabs section  ends here

	$("[l="+language+"]").css("background-color", "#39B54A");
	$("[l="+language+"]").css("color", "#000000");
	$('#tab'+currentTab+' > .text').text($('[l='+language+']').html());
    
	$(".lang").click(function(){
		language = $(this).attr('l');
		tabLang[currentTab] = language;
		$('#tab'+currentTab+' > .text').text($('[l='+language+']').html());
		$(".lang").css("background-color", "#ffffff" );
		$(".lang").css("color", "#000000");
		$($('[l='+language+']')).css("background-color", "#39B54A");
		$($('[l='+language+']')).css("color", "#000000");
		insertTemplate();
	});

	function getExtension() {
		if( language == 'C' )		return 'c';
		if( language == 'Cpp' || language == 'Cpp14' )	return 'cpp';
		if( language == 'Java' )	return 'java';
		if( language == 'Python' || language == 'Python3' )	return 'py';
		if( language == 'Scala' ) return 'scala';
		if( language == 'Php' ) return 'php';
		if( language == 'Perl') return 'perl';
		if( language == 'Csharp') return 'cs';
	}
	$( "#saveFile" ).add('#saveFileSmallScreen').click( function() {
		var saver = document.createElement('a');
		saver.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(editor.getSession().getValue()));
		saver.setAttribute('download', 'code.' + getExtension() );
		saver.style.display = 'none';
		document.body.appendChild(saver);
		saver.click();
		document.body.removeChild(saver);
		return false;
	});

	$("#reset").add('#reset1').click(function() {
		editor.getSession().setValue('');
		insertTemplate();
		return false;
	});

	$("#run").click(function() {
		this1 = $(this);
		$(this).html('<span class="glyphicon glyphicon-refresh refreshIcon"></span> <b>Compiling</b>');
		$(this).attr( "disabled", "disabled" );
		$("html, body").animate({ scrollBottom: $(document).height() }, "slow");
		$( ".cmp" ).hide();
		$( ".rnt" ).hide();
		$( ".out" ).hide();
		$( ".war" ).hide();
		$( "#linkDiv" ).hide();
		$( ".stats" ).hide();
		$.ajax({
			type: "POST",
			url: 'main.php',
			data: { lang: language, code: editor.getSession().getValue(), input: $( "#input" ).val(), save: false },
			dataType: "json",
			success: function( data ) {
				this1.html('<span class="glyphicon glyphicon-chevron-right"></span> <b>Run</b>');
				var stats = "";
				if( data.rntError != "" && data.rntError != null ) {
					$( ".rnt" ).show();
					$( ".rnt pre" ).text( data.rntError );
					//stats = "Runtime Error : "+data.rntError+"\n";
				}
				if( data.cmpError != "" && data.cmpError != null  ) {
					if( data.compResult == "F" ){
						$( ".cmp" ).show();
						$( ".cmp pre" ).text( data.cmpError );
					}else{
						$( ".war" ).show();
                                                $( ".war pre" ).text( data.cmpError );
					}
				}
				$( ".stats" ).show();
				$( ".stats .time" ).text( data.time );
				$( ".stats .memory" ).text( data.memory );
				$( ".out" ).show();
				if( data.output != "" && data.output != null ) {
					$( ".out pre" ).text( data.output );
				} else {
					$( ".out pre" ).text( 'No Output' );
				}
				$("html, body").animate({ scrollTop: $(".sbt-group").offset().top + 60 }, "slow");
			},
			error: function(jqXHR, exception, errorThrown) {
				this1.html('<span class="glyphicon glyphicon-chevron-right"></span> <b>Run</b>');
	                	$( ".err" ).show().delay(5000).slideUp(200, function() {
					$(this).hide();
				});
			},
			complete: function() {
				this1.html('<span class="glyphicon glyphicon-chevron-right"></span> <b>Run</b>');
				$("#run").removeAttr( "disabled" );
			}
		});
		return false;
	});
	$("#runurl").click(function() {
		this1 = $(this);
		this1.html('<span class="glyphicon glyphicon-refresh refreshIcon"></span> <b>Compiling+Generating URL</b>');
		$(this).attr( "disabled", "disabled" );
		$("html, body").animate({ scrollBottom: $(document).height() }, "slow");
		$( ".cmp" ).hide();
		$( ".rnt" ).hide();
		$( ".out" ).hide();
		$( ".war" ).hide();
		$( "#linkDiv" ).hide();
		$( ".stats" ).hide();
		$.ajax({
			type: "POST",
			url: 'main.php',
			data: { lang: language, code: editor.getSession().getValue(), input: $( "#input" ).val(), save: true },
			dataType: "json",
			success: function( data ) {
				this1.html('<span class="glyphicon glyphicon-chevron-right"></span> <b>Run+URL (Generates URL as well)</b>');
				if( data.id ) {
					var permaLink = 'http://ide.geeksforgeeks.org/' + data.id;
					$( ".url pre" ).text( permaLink );
					$( ".url" ).show();
					history.pushState( null, "", permaLink );
				}
				var stats = "";
				if( data.rntError != "" && data.rntError != null ) {
					$( ".rnt" ).show();
					$( ".rnt pre" ).text( data.rntError );
					stats = "Runtime Error : " + data.rntError + "\n";
				}
				if( data.cmpError != "" && data.cmpError != null  ) {
					 if( data.compResult == "F" ){
                                                $( ".cmp" ).show();
                                                $( ".cmp pre" ).text( data.cmpError );
                                        }else{
                                                $( ".war" ).show();
                                                $( ".war pre" ).text( data.cmpError );
                                        }
				}
				$( ".stats" ).show();
                                $( ".time" ).text( data.time );
                                $( ".memory" ).text( data.memory );
				$( ".out" ).show();
				if( data.output != "" && data.output != null ) {
					$( ".out pre" ).text( data.output );
				} else {
					$( ".out pre" ).text( 'No Output' );
				}
				$("html, body").animate({ scrollTop: $(".sbt-group").offset().top + 60 }, "slow");
			},
			error: function(jqXHR, exception, errorThrown) {
				this1.html('<span class="glyphicon glyphicon-chevron-right"></span> <b>Run+URL (Generates URL as well)</b>');
	            		$( ".err" ).show().delay(5000).slideUp(200, function() {
					$(this).hide();
				});
			},
			complete: function() {
				this1.html('<span class="glyphicon glyphicon-chevron-right"></span> <b>Run+URL (Generates URL as well)</b>');
				$("#runurl").removeAttr( "disabled" );
			}
		});
		return false;
	});

	//copy to clipboard section
	//copy code from editor
	var clipboard=new Clipboard('.btnEditor', {
		text:function() {
			return editor.session.getValue();
		}
	});
	//change copy to copied for 2 secs
	clipboard.on('success',function(event){
                event.clearSelection();
                event.trigger.textContent='Copied';
                window.setTimeout(function(){
                        event.trigger.textContent='Copy';
                },2000);
        });
	
	//copy input
	var clipboard=new Clipboard('.btnInput', {
                text:function() {
                        return document.getElementById('input').value;
                }
        });
	
	clipboard.on('success',function(event){
                event.clearSelection();
                event.trigger.textContent='Copied';
                window.setTimeout(function(){
                        event.trigger.textContent='Copy';
                },2000);
        });
	
	//copy output
	var clipboard=new Clipboard('.btnOutput', {
                text:function() {
                        return document.getElementById('preOutput').innerHTML;
                }
        });
	
	clipboard.on('success',function(event){
                event.clearSelection();
                event.trigger.textContent='Copied';
                window.setTimeout(function(){
                        event.trigger.textContent='Copy';
                },2000);
        });
	
	//copy link
	var clipboard=new Clipboard('.btnLink', {
                text:function() {
                        return document.getElementById('preLink').innerHTML;
                }
        });

	clipboard.on('success',function(event){
		event.clearSelection();
		event.trigger.textContent='Copied';
		window.setTimeout(function(){
			event.trigger.textContent='Copy';
		},2000);
	});
});

// ctrl+enter key combination for run program code
$('body').keydown(function (e) {
	if (e.ctrlKey && e.keyCode == 13) {
    		// Ctrl-Enter pressed
		$('#run').click();
  	}
});

