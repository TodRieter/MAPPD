/*
 * Main.cpp
 *
 *  Created on: Aug 8, 2020
 *      Author: Thomas Wilson
 */
#include<iostream>
#include "Node.h"
int main(){
	Node* p = new Node(7);
	p->build_tree_r(p->id);
	cout << "\n p= " << p->id << endl;
	cout << " p.L= " << p->L->id << endl;
	cout << " p.R= " << p->R->id << endl;
	cout << " p.L.L= " << p->L->L->id << endl;
	cout << " p.R.R= " << p->R->R->id << endl;
	cout << " p.L.L.L= " << p->L->L->L->id << endl;
	cout << " p.R.R.R= " << p->R->R->R->id << endl;
	return 0;
}



