extends Node

# HTTPClient demo
# This simple class can do HTTP requests, it will not block but it needs to be polled
#http://www.google-analytics.com/?v=1&tid=UA-117329110-1&cid=1&t=hello
func _init():
	var err = 0
	print("begining")
	var http = HTTPClient.new() # Create the Client
	err = http.connect_to_host("www.google-analytics.com",80) # Connect to host/port
	assert(err == OK) # Make sure connection was OK
	if err == OK :
		print("Connection status = OK")
	else:
		print("connection status = NOK")
    # Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
		print("Connecting..")
		OS.delay_msec(500)

	assert(http.get_status() == HTTPClient.STATUS_CONNECTED) # Could not connect

    # Some headers
	var headers = [
#		"POST /collect HTTP/1.1",
		#"Host: google-analytics.com",
		"v=1",
		"&tid=UA-117329110-1",
		"&cid=1",
		"&ds"
	]

	err = http.request(HTTPClient.METHOD_GET,"/", headers) # Request a page from the site (this one was chunked..)
	print("err"+str(err))

	assert(err == OK) # Make sure all is OK

	while http.get_status() == HTTPClient.STATUS_REQUESTING:
	# Keep polling until the request is going on
		http.poll()
		print("Requesting..")
		OS.delay_msec(500)

	assert(http.get_status() == HTTPClient.STATUS_BODY or http.get_status() == HTTPClient.STATUS_CONNECTED) # Make sure request finished well.

	print("response? ", http.has_response()) # Site might not have a response.

	if http.has_response():
        # If there is a response..

		headers = http.get_response_headers_as_dictionary() # Get response headers
		print("code: ", http.get_response_code()) # Show response code
		print("**headers:\\n", headers) # Show headers

        # Getting the HTTP Body

		if http.is_response_chunked():
            # Does it use chunks?
			print("Response is Chunked!")
		else:
            # Or just plain Content-Length
			var bl = http.get_response_body_length()
			print("Response Length: ",bl)

		# This method works for both anyway

		var rb = PoolByteArray() # Array that will hold the data

		while http.get_status() == HTTPClient.STATUS_BODY:
            # While there is body left to be read
			http.poll()
			var chunk = http.read_response_body_chunk() # Get a chunk
			if chunk.size() == 0:
                # Got nothing, wait for buffers to fill a bit
				OS.delay_usec(1000)
			else:
				rb = rb + chunk # Append to read buffer

        # Done!

		print("bytes got: ", rb.size())
		var text = rb.get_string_from_ascii()
		print("Text: ", text)

	#get_tree().quit()