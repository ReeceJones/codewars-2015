import std.stdio;
import std.string;
import std.range;
import std.string;
import std.conv;

version(prob00)
{
	void invoke()
	{
		writeln("Welcome, Barcelona and Newcastle");
	}
}

version(prob01)
{
	void invoke()
	{
		writeln("Hello ", readln().stripRight(), ", you look very good today");
	}
}

version(prob02)
{
	void invoke()
	{
		uint C = readln.stripRight.to!uint;
		uint P = readln.stripRight.to!uint;
		writeln(C * P);
	}
}

version(prob03)
{
	void invoke()
	{
		string[int] m = [
				0 : "zero",
				1 : "one",
				2 : "two",
				3 : "three",
				4 : "four",
				5 : "five",
				6 : "six",
				7 : "seven",
				8 : "eight",
				9 : "nine",
				10 : "ten"
			];
		writeln("Number ", m[readln.stripRight.to!int], " is alive!");
	}
}

version(prob16)
{
	struct Node
	{
		string label;
		string trigger;
		string jump;
	}

	alias NodeSet = Node[]; // array of nodes
	alias StateMap = NodeSet[string]; // hashmap of nodesets

	void invoke()
	{
		StateMap map;
		uint n;
		readf!"%u\n"(n);
		foreach(_; n.iota)
		{
			string[] tokens = readln.stripRight.split(" ");
			Node node = Node(tokens[0], tokens[1], tokens[2]);
			map[tokens[0]] ~= node;
		}
		string test = readln.stripRight(); // remove newline
		string build;
		NodeSet nodes = map["#"];
		foreach(c; test) // foreach character in the test string
		{
			// c is is the jump condition
			foreach(node; nodes)
			{
				if (c == node.trigger[0]) // we found a match
				{
					build ~= node.jump;
					nodes = map[node.jump];
					break;
				}
			}
		}
		writeln(build);
	}

}



version(unittest) {}
else
{
	void main()
	{
		invoke();
	}
}


