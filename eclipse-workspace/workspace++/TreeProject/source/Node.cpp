/*
 * Node.cpp
 *
 *  Created on: Aug 8, 2020
 *      Author: Thomas Wilson
 */

#include "Node.h"
#include<cmath>
#include <string>
#include<unordered_set>
#include<unordered_map>
using namespace std;
static unordered_set <int> node_ids;
static unordered_map<int, Node> tree;
Node::Node() {
}
Node::Node(int id){
	this->id = id;
}
Node::Node(Node* parent, int id){
	this->parent = parent;
	this->id = id;
}
Node::Node(Node* parent, Node* L, Node* R, int id){
	this->parent = parent;
	this->L = L;
	this->R = R;
	this->id = id;
}
Node::Node(Node* L, Node* R){
	this->L = L;
	this->R = R;
}
void Node::setL(Node l){
	Node node = *(new Node(this, l.L, l.R, l.id));
	this->L = &node;
	*(this->L) = node;
	cout << "setL: "<< this->L->id << ": " << this->L << endl;
}
void Node::setR(Node r){
	this->R = &r;
	*(this->R) = r;
	cout << "setR: " << this->R->id << ": " << this->R << endl;
}
void Node::setChildren(Node l, Node r){
	this->setL(l);
	this->setR(r);
}

void Node::print_tree(string str, int current_depth){
//	int current_width = pow(2, current_depth);
//	if(this->id <= 3){
//		str = str + "\t" + to_string(id) + "\n" + to_string(L->id) + "\t\t" + to_string(R->id);
//		cout << str << endl;
//		return;
//	}
//		str = str + "\n";
//	for(int i = 0; i <= pow(2, current_depth);i++){
//		for(int j = 0; j < current_width; j++){
//			str = str + "\t" + to_string(j);
//		}
//		str = str + to_string(this->id);
//		if(i % 2 == 0){
//			this->L->print_tree(str, current_depth+1);
//		}else{
//			this->R->print_tree(str, current_depth+1);
//		}
//	}
}
void Node::build_tree_r(int next_id){
	node_ids.insert(this->id);
	if(next_id > 0){
		next_id--;
		if(next_id % 2 == 0){
			Node l = *(new Node(this, next_id));
			this->setL(l);
		//	cout << this->L->id << "L" << endl;
			node_ids.insert(this->L->id);
			this->L->build_tree_r(next_id);
		}else if(next_id % 2 == 1){
			Node r = Node(this, next_id);
			this->setR(r);
			//cout << this->R->id << "R" << endl;
			node_ids.insert(this->R->id);
			this->R->build_tree_r(next_id);
		}
	}
}

//void Node::build_tree(){
//	Node* node = this;
//	Node* l = this->L;
//	Node* r = this->R;
//	while(node != NULL){
//		node_ids.insert(this->id);
//		if(node->id % 2 == 0){
//			node
//		}
//		if(node->id % 2 == 0){
//
//				}
//	}
//}
Node::~Node() {
	cout << this->id << ": " << this << " KAPUT!" << endl;
}

