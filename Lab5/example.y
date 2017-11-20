%token IF,ELSE,CASE,BREAK,DEFAULT,FOR,CONTINUE,DO,WHILE,SCANF,GETCH,GETS,PRINTF,PUTCH,PUTS

%%
s:	parsedLoop|parsedIO|parsedIf

parsedLoop:	{printf("PARSED LOOP STATMRNT\n");}
		FOR	
		|WHILE
		|DO		
		|CONTINUE

parsedIO:	{printf("PARSED I/O STATMRNT\n");}
		SCANF
		|GETCH
		|GETS
		|PRINTF
		|PUTCH
		|PUTS


parsedIf:	{printf("PARSED IF STATMRNT\n");}
		IF
		|ELSE
		|CASE
		|BREAK
		|DEFAULT;

%%
#include "lex.yy.c"
main()
{	return yyparse();}
int yyerror()
{	printf("Error in expression\n");
	return 0;}
