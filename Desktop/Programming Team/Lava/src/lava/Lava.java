package lava;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Scanner;

public class Lava {
	static HashMap<Pair, ArrayList<Pair>> father;
	static HashMap<Pair, ArrayList<Pair>> elsa;
	static HashMap<Pair, Character> map;
	static HashSet<Pair> visited;
	static Pair start;
	static Pair goal;
	static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		visited = new HashSet<>();

		String stepSize = sc.nextLine();
		String mapSize = sc.nextLine();
		
		populateMapAndSetStartAndGoal();
		
		sc.close();
		father = new HashMap<>();
		elsa = new HashMap<>();
		
		

	}
	static void findFatherPath(){
		ArrayList<Pair> fatherSteps = getFatherSteps(start);
		LinkedList<Pair> queue = new LinkedList<>();
		queue.add(start);
		while(!queue.isEmpty()) {
			fatherSteps = getFatherSteps(queue.pop());
			for(Pair step : fatherSteps) {
			visited.add(step);
			if(map.get(step)== 'G') {
				System.out.println("SUCCESS");
				return;
			}
			father.put(step, getFatherSteps(step));
			queue.add(step);
			}	
		}
	}
	static boolean canStep(Pair step) {
		return !visited.contains(step) && !map.get(step).equals('B'); 
	}
	static ArrayList<Pair> getFatherSteps(Pair loc) {
		ArrayList<Pair> temp = new ArrayList<>();
		temp.add(new Pair(loc.x++,loc.y));
		temp.add(new Pair(loc.x,loc.y++));
		temp.add(new Pair(loc.x--,loc.y));
		temp.add(new Pair(loc.x,loc.y--));
		ArrayList<Pair> steps = new ArrayList<>();
		for(Pair step : temp) {
			if(canStep(step)) {
				steps.add(step);
			}
		}
		return steps;
	}
	
	static void populateMapAndSetStartAndGoal() {
		map = new HashMap<>();
		
		int x = 0;
		int y = 0;
		
		while(sc.hasNextLine()) {
			String line = sc.nextLine();
			for(char c : line.toCharArray()) {
				if(c == 'S') {
					start = new Pair(x,y);
				} else if(c == 'G') {
					goal = new Pair(x,y);
				}
				map.put(new Pair(x,y), (Character)c);
				x++;
			}
			x = 0;
			y++;
		}
	}

}

class Pair{
	int x;
	int y;
	Pair(int x, int y){
		this.x = x;
		this.y = y;
	}
	@Override
	public String toString() {
		return "(" + x + "," + y + ")";
	}
}