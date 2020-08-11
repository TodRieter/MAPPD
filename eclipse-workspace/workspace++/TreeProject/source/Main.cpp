/*
 * Main.cpp
 *
 *  Created on: Aug 8, 2020
 *      Author: Thomas Wilson
 */
#include<iostream>
#include "Node.h"
#include "Tree.h"
#include<iostream>
using namespace std;
int main(){
	Tree t = *(new Tree(7));
	t.build_tree(7);
	for(int i = 1; i <= 7; i++){
		cout << &(t.tree.at(i)) << ": " << t.tree.at(i).id << endl;
	}
	delete &t;
	return 0;
}



