#double prcells(int size, t_cell *tc)
#{
 #   double tmp, result = 1.0;
  #  int i;

  #  for (i = 0; i < size; i++) {
   #     tmp = (double)tc[i].ns / 3.597;
    #    result += tmp;
     #   tc[i].xpt = tmp;
      #  tc[i].sum = (int)result - 1;
  #  }
  #  return result;
#}



#				Align    Size    Offset
# char smp[17];    		1                 
# double xpt;    		8                 
# int ns;    			4                  
# char id;    			1                 
# int sum;    			4                
#} t_cell;    			8           