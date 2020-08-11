/*
 * Tree.cpp
 *
 *  Created on: Aug 11, 2020
 *      Author: Thomas Wilson
 */

#include "Tree.h"
#include "Node.h"
#include<unordered_map>
unordered_map<int, Node> tree;
Tree::Tree() {
	// TODO Auto-generated constructor stub

}
Tree::Tree(int size){
	this->size = size;
}
Tree::~Tree() {
	// TODO Auto-generated destructor stub
}
void Tree::build_tree(int size){
	for(int i = 1; i <= size; i++){
		tree[i] = *(new Node(i));
	}
	for(int i = 1; i < size; i++){
		if(2*i+2 <= size){
			Node l = tree.at(2*i+1);
			Node r = tree.at(2*i+2);
			(tree.at(size-i)).setChildren(l,r);
		}else{
			cout << "Tree has been Built!" << endl;
			return;
		}
	}

}
void Tree::print_tree(){
	this->print_tree("");
}
void Tree::print_tree(string str){
	build_tree_str(str, &(this->tree.at(this->size)));
}
string Tree::build_tree_str(string str, Node* node){
	if(node->id > 2){
		str+= "\nif: " + build_tree_str(str, node->L) + "L  " + build_tree_str(str, node->R) + "R  ";
		return str;
	}else{
		str += "\nelse: " + to_string(node->id) + " ";
		return str;
	}
}
