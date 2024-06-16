
main(){
	int  a , b ,c ;
    a=1;
    while(a<10){
        a=a+1; 
        b=a*2+2;
        c=5;
        add(a,b);
        add(b,c);
    }
    return 0;
}
add(x,y){
    return x+y;
}




main(){
	int i,n ,a , b ,tmp ,c;
    
    n=50;

    a=0;
    b=1;
    i=2;
    while(i<=n){
        tmp=b;
        b=a+b;
        a=tmp;
        c=1;
        i=i+c;
    }
    print(b);
    return 0;
}