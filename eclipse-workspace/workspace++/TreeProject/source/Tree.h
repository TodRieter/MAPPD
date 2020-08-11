/*
 * Tree.h
 *
 *  Created on: Aug 11, 2020
 *      Author: Thomas Wilson
 */

#ifndef TREE_H_
#define TREE_H_
#include "Node.h"
#include<unordered_map>
using namespace std;
class Tree {
public:
	unordered_map<int, Node> tree;
	int size = 3;
	Tree();
	Tree(int size);
	void build_tree(int size);
	void print_tree();
	void print_tree(string str);
	string build_tree_str(string str, Node* node);
	virtual ~Tree();
};

#endif /* TREE_H_ */
