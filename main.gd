extends Control

var multiplayer_peer = ENetMultiplayerPeer.new()


func _on_connect_pressed():
	var address = $Menu/AddressInput.text
	var port = $Menu/PortInput.text.to_int()
	multiplayer_peer.create_client(address, port)
	multiplayer.multiplayer_peer = multiplayer_peer
	multiplayer_peer.connection_succeeded.connect(func(): print("Successfully connected to %s:%d" % [address,port]))
	multiplayer_peer.connection_failed.connect(func(): print("Failed connecting to %s:%d" % [address,port]))
