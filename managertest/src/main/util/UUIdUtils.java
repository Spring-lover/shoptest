package main.util;
import java.util.UUID;
public class UUIdUtils {
        /**
         * 产生全球唯一的字符串
         * @return
         */
        public static String getUUid() {
            return UUID.randomUUID().toString().replace("-", "").toUpperCase();
        }
}
