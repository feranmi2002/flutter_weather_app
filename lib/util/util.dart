class Util{

   String date(){
     DateTime today = DateTime.now();
     return "${today.day}-${today.month}-${today.year}";
   }
}