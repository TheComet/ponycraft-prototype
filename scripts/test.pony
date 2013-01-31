
int a 5
int b 8
int c

for a=2 to 7
	DestroyUnit a
next a

while a < 12
	DestroyUnit a
	inc a
endwhile

suck:
	DestroyUnit a
	inc a
	if a <15
		goto suck
	endif

end