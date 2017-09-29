#!/usr/bin/bash
echo "Content-type: text/html"
echo ""
name=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[1]}' | awk '{split($0,array,"=")} END{print array[2]}'`
email=`echo "$QUERY_STRING" | awk '{split($0,array,"&")} END{print array[2]}' | awk '{split($0,array,"=")} END{print array[2]}' | sed -e 's/%40/@/g'`
cat <<EOT
<!DOCTYPE html>
<html>
<head>
	<title>Welcome to our application</title>
</head>
<body>
	<h1>Welcome $name </h1>
	<h2> Your e-mail address is $email </h2>
</body>
</html>

