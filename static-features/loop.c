int g;

int g_incr (int c)
{
  g += c;
}
int loop (int a, int b, int c)
{
  int i;
  int ret = 0;
  for (i = a; i < b; i++) {
      while(1){
        c = c+3;
        if(c>100)
            break;
      
      }
      if(a>0)
          ++b;
   g_incr (c);
  }

  return ret + g;
}

