var pomelo = window.pomelo;
var username;
var users;
var rid;
var base = 1000;
var increase = 25;
var reg = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
var LOGIN_ERROR = "There is no server to log in, please wait.";
var LENGTH_ERROR = "Name/Channel is too long or too short. 20 character max.";
var NAME_ERROR = "Bad character in Name/Channel. Can only have letters, numbers, Chinese characters, and '_'";
var DUPLICATE_ERROR = "Please change your name to login.";
var avatar;

util = {
	urlRE: /https?:\/\/([-\w\.]+)+(:\d+)?(\/([^\s]*(\?\S+)?)?)?/g,
	//  html sanitizer
	toStaticHTML: function(inputHtml) {
		inputHtml = inputHtml.toString();
		return inputHtml.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
	},
	//pads n with zeros on the left,
	//digits is minimum length of output
	//zeroPad(3, 5); returns "005"
	//zeroPad(2, 500); returns "500"
	zeroPad: function(digits, n) {
		n = n.toString();
		while(n.length < digits)
		n = '0' + n;
		return n;
	},
	//it is almost 8 o'clock PM here
	//timeString(new Date); returns "19:49"
	timeString: function(date) {
		var minutes = date.getMinutes().toString();
		var hours = date.getHours().toString();
		return this.zeroPad(2, hours) + ":" + this.zeroPad(2, minutes);
	},

	//does the argument only contain whitespace?
	isBlank: function(text) {
		var blank = /^\s*$/;
		return(text.match(blank) !== null);
	}
};

//always view the most recent message when it is added
function scrollDown(base) {
	window.scrollTo(0, base);
	$("#entry").focus();
};

// add message on board
function addMessage(from, target, text, img ,time) {
	var name = (target == '*' ? 'all' : target);
	if(text === null) return;
	if(time == null) {
		// if the time is null or undefined, use the current time.
		time = new Date();
	} else if((time instanceof Date) === false) {
		// if it's a timestamp, interpret it
		time = new Date(time);
	}
	//every message you see is actually a table with 3 cols:
	//  the time,
	//  the person who caused the event,
	//  and the content
	var messageElement = $(document.createElement("table"));
	messageElement.addClass("message list-group");
	// sanitize
	text = util.toStaticHTML(text);
//	var content = '<div class="tab-content" style=" border:solid 1px red;" >' + '  <div class="tab-pane active" style=" border:solid 1px blue;" id="tab1"><div class="span2" style="padding-left:20px;color:#b8b8b8;border:solid 1px red;" ><p>' + util.timeString(time) + '</p></div>' + '  <div></div><div class="org_box" style=" border:solid 1px black;width:500px;height:180px;padding:10px 16px;" ><div class="pg"><img src="'+img+'"  class="img-rounded"></img></div>' +'  <span class="org_box_cor cor2"></span><div class="txt">' + util.toStaticHTML(from) + ' says to ' + name + ': ' + '</div><div></div>' + '  <div class="txt2">' + text + '</div></div>';
	var content = '<div class="row chat-row">' + '<div class="col-md-1 chat-time">' + util.timeString(time) + '</div>' + '<div class="col-md-5 chat-container"><div class="left-point"></div><div class="col-md-12 chat-min-left-container"><div class="col-md-2"><img src="'+img+'" class="chat-img" style="width:51px;height:51px; "></img></div>' +'<div class="col-md-10" style="margin-top:20px;"><div class="chat-name-left">' + util.toStaticHTML(from) +  '</div>' + '<p class="chat-content-left">' + text + '</p></div></div></div></div>';
	
	//the log is the stream that we view
	$("#chatHistory").append(content);
	base += increase;
	scrollDown(base);
};

// show tip
function tip(type, name) {
	var tip,title;
	switch(type){
		case 'online':
			tip = name + ' is online now.';
			title = 'Online Notify';
			break;
		case 'offline':
			tip = name + ' is offline now.';
			title = 'Offline Notify';
			break;
		case 'message':
			tip = name + ' is saying now.'
			title = 'Message Notify';
			break;
	}
	var pop=new Pop(title, tip);
};

// init user list
function initUserList(data) {
	users = data.users;
	for(var i = 0; i < users.length; i++) {
		var slElement = $(document.createElement("option"));
		slElement.attr("value", users[i]);
		slElement.text(users[i]);
		$("#usersList").append(slElement);
	}
};

// add user in user list
function addUser(user) {
	var slElement = $(document.createElement("option"));
	slElement.attr("value", user);
	slElement.text(user);
	$("#usersList").append(slElement);
};

// remove user from user list
function removeUser(user) {
	$("#usersList option").each(
		function() {
			if($(this).val() === user) $(this).remove();
	});
};

// set your name
function setName() {
	$("#name").text(username);
};

// set your room
function setRoom() {
	$("#room").text(rid);
};

//set your room
function setAvatar() {
	$("#avatarimg").attr("src",avatar);
};

// show error
function showError(content) {
	//loginAngin();
};

// show login panel
function showLogin() {
	$("#chatHistory").hide();
	$("#toolbar").show();
	$("#loginError").hide();
	$("#loginUser").focus();
};

// show chat panel
function showChat() {
	$("#loginError").hide();
	$("#toolbar").show();
	$("entry").focus();
	scrollDown(base);
};

// query connector
function queryEntry(uid, callback) {
	var route = 'gate.gateHandler.queryEntry';
	pomelo.init({
		host: "192.168.1.50",
		port: 3014,
		log: true
	}, function() {
		pomelo.request(route, {
			uid: uid
		}, function(data) {
			pomelo.disconnect();
			if(data.code === 500) {
				return;
			}
			callback(data.host, data.port);
		});
	});
};


$(document).ready(function() {
	//when first time into chat room.
	showLogin();

	//wait message from the server.
	pomelo.on('onChat', function(data) {
		addMessage(data.from, data.target, data.msg,data.avatar);
		$("#chatHistory").show();
		if(data.from !== username)
			tip('message', data.from);
	});

	//update user list
	pomelo.on('onAdd', function(data) {
		var user = data.user;
		tip('online', user);
		addUser(user);
	});

	//update user list
	pomelo.on('onLeave', function(data) {
		var user = data.user;
		tip('offline', user);
		removeUser(user);
	});


	//handle disconect message, occours when the client is disconnect with servers
	pomelo.on('disconnect', function(reason) {
		showLogin();
	});

    $("#history").click(function(){
        var username = $("#name").attr("value");
        rid = $('#room').val();
        var target = $("#usersList").val();
        var fromId = 1;
        var targetId = 2;
        var route = "chat.chatHandler.history";
        var frist = 0;
        var max = 150;
        pomelo.request(route, {
            rid: rid,
            from:username,
            target:target,
            fromId: fromId,
            targetId: targetId,
            frist:frist,
            max:max
        }, function(data) {
            //alert(data.route[0].app);
            for(var i in data.route){
                alert(data.route[i].app + "   " +data.route[i].message + "   "+ data.route[i].created_at  + "    " +data.route[i].member_id  + "    " +data.route[i].ref_id);
            }
        });
    });

    $("#onLineUsers").click(function(){
        var route = "chat.chatHandler.onLineUsers";
        var friends = ["张三","李四","王五","刘奎","佳樽"];
        var rid = "siliao";
        pomelo.request(route, {
            friends:friends,
            rid:rid
        }, function(data) {
            for(var i in data.route){
                alert(data.route[i]
                );
            }
        });
    });

    $("#isReadMessage").click(function(){
        var route = "chat.chatHandler.isReadMessage";
        //var target = $("#usersList").val();
        var targetId = 2;
        var rid = "siliao";
        pomelo.request(route, {
            targetId:targetId,
            rid:rid
        }, function(data) {
            for(var i in data.route){
                alert(data.route[i].member_id
                );
            }
        });
    });

    $("#defMessage").click(function(){
        var route = "chat.chatHandler.defMessage";
        var rid = "zhibo";
        pomelo.request(route, {
            rid:rid
        }, function(data) {
            for(var i in data.route){
                alert(data.route[i].from_name+ "  "  + data.route[i].message
                );
            }
        });
    });

	//deal with login button click.
	$(document).ready(function(){
		username = $("#nickName").attr("value");
		rid = $('#channelName').val();
		avatar = $('#avatar').val();	
		if(!username){
			var Num=""; 
			for(var i=0;i<5;i++) 
			{ 
			Num+=Math.floor(Math.random()*10); 
			} 
			username="游客"+Num;
			avatar=$('#avatarMoRen').val()
		}
		if(username.length > 20 || username.length == 0 || rid.length > 20 || rid.length == 0) {
			showError(LENGTH_ERROR);
			return false;
		}

		if(!reg.test(username) || !reg.test(rid)) {
			showError(NAME_ERROR);
			return false;
		}

		//query entry of connection
		queryEntry(username, function(host, port) {
			pomelo.init({
				host: host,
				port: port,
				log: true
			}, function() {
				var route = "connector.entryHandler.enter";
				pomelo.request(route, {
					username: username,
					rid: rid
				}, function(data) {
					if(data.error) {
                        showError(DUPLICATE_ERROR);
                        return;
                    }
					setName();
					setRoom();
					setAvatar();
					showChat();
					initUserList(data);
				});
			});
		});
	});	

	//deal with chat mode.
	$("#entry").keypress(function(e) {
		var route = "chat.chatHandler.send";
		var target = $("#usersList").val();

        var fromId = null;
        var targetId = null;
        if(target =="*"){
            targetId = "*";
        }else{
            targetId = null;
        }

		if(e.keyCode != 13 /* Return */ ) return;
		var msg = $("#entry").attr("value").replace("\n", "");
		if(!util.isBlank(msg)) {
			pomelo.request(route, {
                    rid: rid,
                    content: msg,
                    from: username,
                    target: target,
                    fromId:fromId,
                    targetId:targetId,
                    avatar:avatar
			}, function(data) {
				$("#entry").attr("value", ""); // clear the entry field.
				if(target != '*' && target != username) {
					addMessage(username, data.route.target, msg,data.route.avatar);
					$("#chatHistory").show();
				}
			});
		}
	});
	
	$("#sayButton").click(function(){
		var route = "chat.chatHandler.send";
		var target = $("#usersList").val();

        var fromId = null;
        var targetId = null;
        if(target =="*"){
            targetId = "*";
        }else{
            targetId = null;
        }

		var msg = $("#entry").attr("value").replace("\n", "");
		if(!util.isBlank(msg)) {
			pomelo.request(route, {
                    rid: rid,
                    content: msg,
                    from: username,
                    target: target,
                    fromId:fromId,
                    targetId:targetId,
                    avatar:avatar
			}, function(data) {
				$("#entry").attr("value", ""); // clear the entry field.
				if(target != '*' && target != username) {
					addMessage(username, data.route.target, msg,data.route.avatar);
					$("#chatHistory").show();
				}
			});
		}
	});
	
	
});