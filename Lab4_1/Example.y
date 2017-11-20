%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "lex.yy.c"

typedef struct node
{
	char *token;
	struct node *left;
	struct node *right; 
}node;

node *mknode(char *token, node *left, node *right);
void printtree(node *tree);
#define YYSTRPE struct node*

%}

%token	NUM,PLUS,MINUS
%left	PLUS,MINUS
%%
s:	expr		{printf("OK\n");printree($1);}
	expr:expr	PLUS  expr{$$=mknode("+",$1,$3);}|
	expr		MINUS expr{$$=mknode("-",$1,$3);}|
	NUM		{$$=mknode(yytext,NULL,NULL);};
%%


node *mknode(char *token, node *left,node *right){
	node *newnode =(node*)malloc(sizeof(node));
	char *newstr  =(char*)malloc(sizeof(token)+1);
	strcpy (newstr,token);
	newnode->left=left;
	newnode->right=right;
	newnode->token=newstr;
	return newnode;
}

void printtree(node *tree){
	printf("%s\n",tree->token);
	if(tree->left){
		printtree(tree->left);
	}
	if(tree->rigth){
		ptinttree(tree->right);
	}
}

int yyerror(){
	printf("My Error\n");
	return 0;
}

main(){
	return yyparse();
}





