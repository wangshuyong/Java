class array{
	private long[] longarray;
	private int num;
	public array(int max){
		longarray = new long[max];
		num=0;
	}

	public void insert(long value){
		longarray[num]=value;
		num++;
	}

	public void display(){
		for(int i=0;i<num;i++){
			System.out.print(longarray[i]+" ");
			
		}
	}
//错误写法，应该为++leftPtr
	public int partition(int left,int right,long pivot){
		int rightPtr=right;
		int leftPtr=left;
		while (true)
		{
			while(leftPtr<right && longarray[leftPtr++]<pivot);//{leftPtr++;}
			while(rightPtr>left && longarray[rightPtr--]>pivot);//{rightPtr--;}
			if(leftPtr>=rightPtr)
				break;
			else swap(leftPtr,rightPtr);
		}
		return leftPtr;
	}

	public void swap(int index1,int index2){
		long temp;
		temp=longarray[index2];
		longarray[index2]=longarray[index1];
		longarray[index1]=temp;
	}
}
public class testpartition
 {
	public static void main(String[] args){
		int max=20;
		array arr = new array(max);
		for(int i=0;i<max;i++){
			long num = (int)(java.lang.Math.random()*199);
			//System.out.println(num);
			arr.insert(num);
		}
		System.out.print("random numbers is:");
			arr.display();
			long pivot=99;
	//		int size=arr.size();
			int partiIndex=arr.partition(0,max-1,pivot);
			System.out.println();
			System.out.print("after partition:");
			arr.display();
			System.out.println();
			System.out.print("left side:" + partiIndex);
	}
}