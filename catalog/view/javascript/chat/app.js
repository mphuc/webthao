var express = require('express')
  , app = express()
  , http = require('http')
  , server = http.createServer(app)
  , io = require('socket.io').listen(server);
  var mysql      = require('mysql');
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : '',
	  database : 'mmo_coinmax'
	});
	connection.connect();

	/*connection.query('SELECT id FROM sm_customer_message ORDER BY id DESC LIMIT 10',function(err,rows){
	  if(err) throw err;

	  console.log('Data received from Db:\n');
	  console.log(rows);
	  
	});*/
	
server.listen(8080);

// routing
app.get('/', function (req, res) {
  res.sendfile(__dirname + '/index.html');
});
app.get('/show_sell', function (req,res) {
	connection.query('SELECT id FROM sm_customer_message ORDER BY id DESC LIMIT 10',function(err,rows){
	  if(err) throw err;		  
	  res.json(rows);	
	});
	
});
// usernames which are currently connected to the chat
var usernames = {};

// rooms which are currently available in chat
var rooms = ['room1'];

io.sockets.on('connection', function (socket) {
	
	// when the client emits 'adduser', this listens and executes
	socket.on('adduser', function(username,avatar){
		// store the username in the socket session for this client
		socket.username = username;
		socket.avatar = avatar;
		// store the room name in the socket session for this client
		socket.room = 'room1';
		// add the client's username to the global list
		usernames[username] = username;
		usernames[avatar] = avatar;
		// send client to room 1
		socket.join('room1');
		// echo to client they've connected
		//socket.emit('updatechat', 'Hi', username);
		// echo to room 1 that a person has connected to their room
		//	socket.broadcast.to('room1').emit('updatechat', 'SERVER', username + ' has connected to this room');
		socket.emit('updaterooms', rooms, 'room1');
	});
	
	// when the client emits 'sendchat', this listens and executes
	socket.on('sendchat', function (data) {
		var dt = new Date();
		var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
		// we tell the client to execute 'updatechat' with 2 parameters
		io.sockets.in(socket.room).emit('updatechat', socket.avatar,socket.username,time, data);

	});
	
	socket.on('insert', function (customer_id,message,date_added) {
		var employee = { customer_id: customer_id, message: message, date_added : date_added };
		connection.query('INSERT INTO sm_customer_message SET ?', employee, function(err,res){
		  if(err) throw err;
		  //console.log('Last insert ID:', res.insertId);
		});
	});
	
	socket.on('show_sell', function () {
		connection.query('SELECT id FROM sm_customer_message ORDER BY id DESC LIMIT 10',function(err,rows){
		  if(err) throw err;

		  console.log('Data received from Db:\n'+rows);
		  return rows;
		});
	});
	
	
	
		
	// when the user disconnects.. perform this
	socket.on('disconnect', function(){
		// remove the username from global usernames list
		delete usernames[socket.username];
		// update list of users in chat, client-side
		io.sockets.emit('updateusers', usernames);
		// echo globally that this client has left
		//socket.broadcast.emit('updatechat', 'SERVER', socket.username + ' has disconnected');
		socket.leave(socket.room);
	});
});
