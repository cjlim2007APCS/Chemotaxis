//declare bacteria variables here
int randomized;
Bacteria [] colony;   
void setup()   
{     
	//initialize bacteria variables here
	 size(400,400);
	 colony = new Bacteria[100];
	 for (int i = 0; i<colony.length; i++) {
		colony[i] = new Bacteria();
	}
}   
void draw()   
{    
	//move and show the bacteria
	background(0);
	for (int i = 0; i<colony.length; i++) {
		colony[i].roll();
		colony[i].show();
	}
}  
class Bacteria    
{     
	int myX, myY, myR, myG, myB;
	Bacteria() 	
	{
		myX = (int)(Math.random()*400);;
		myY = (int)(Math.random()*400);;
		myR = (int)(Math.random()*256);
		myG = (int)(Math.random()*256);
		myB = (int)(Math.random()*256);
	}
	void roll() 
	{
		randomized = (int)(Math.random()*6);
	}
	void show()
	{
		fill(myR,myB,myG);
		stroke(255);
		ellipse(myX, myY, 10, 10);
		if (randomized == 0) {
			myY--;
		} else if (randomized == 1) {
			myX++;
		} else if (randomized == 2) {
			myY++;
		} else if (randomized == 3) {
			myX--;
		} else {
			if (myX > mouseX && randomized == 4) {
				myX--;
			} else if (myX < mouseX && randomized == 4) {
				myX++;
			} else if (myY > mouseY && randomized == 5) {
				myY--;
			} else if (myY < mouseY && randomized == 5) {
				myY++;
			}
		}
	}
}    