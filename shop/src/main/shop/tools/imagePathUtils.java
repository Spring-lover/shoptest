package main.shop.tools;

public class imagePathUtils {
        public static String imagePath(String str) {
            int start=str.indexOf("img");
            int end=str.indexOf("?");
            if(start==-1){
                return "img/"+str;
            }
            int len=end-start;
            char imagepaths[]=new char[len+1];
            for(int i=start,j=0;i<=end;i++,j++){
                imagepaths[j]=str.charAt(i);
            }
            String s1 =String.copyValueOf(imagepaths);
            return s1;
        }

}
