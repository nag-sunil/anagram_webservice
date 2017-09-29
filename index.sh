#!/usr/bin/bash
echo "Content-type: text/html"
echo ""
#echo "Hello World!"
cat <<EOT
<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Anagram Solver application</title>
</head>
<body>
	<p>The Anagram Solver will find one word anagrams. Enter a word and click search. The Anagram Solver will list all possible anagrams</p>
	<form action="search.sh" method="get">
		<label>Enter a word</label>
		<input type="text" name="word">
		<br>
		<button type="search">Search</button>
	</form>
</body>
</html>
EOT

