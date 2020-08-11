/*
 * Node.h
 *
 *  Created on: Aug 8, 2020
 *      Author: Thomas Wilson
 */

#ifndef NODE_H_
#define NODE_H_
#include<iostream>
#include<string>
using namespace std;
class Node {
public:
	Node* parent = nullptr;
	Node* L = nullptr;
	Node* R = nullptr;
	int id = -1;
	Node();
	Node(int id);
	Node(Node* parent, int id);
	Node(Node* parent, Node* L, Node* R, int id);
	Node(Node* L, Node* R);
	string build_tree_str(string str);
	void setL(Node l);
	void setR(Node r);
	void setChildren(Node l, Node r);
	void print_tree();
	void print_tree(string str);
	void print_tree(string str, int current_depth);
	void build_tree_r(int size);
	static void build_tree_i(int size);
	~Node();
};

#endif /* NODE_H_ */
