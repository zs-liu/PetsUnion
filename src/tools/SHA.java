package tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA {

    public SHA() {

    }

    public String SHA256(final String strText) {
        return SHA(strText, "SHA-256");
    }

    public String SHA512(final String strText) {
        return SHA(strText, "SHA-512");
    }

    private String SHA(final String strText, final String strType) {

        // if valid string
        if (strText != null && strText.length() > 0) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance(strType);
                messageDigest.update(strText.getBytes());
                byte byteBuffer[] = messageDigest.digest();
                char charResult[] = new char[32];
                int i;
                for (i = 0; i < 31; i++) {
                    charResult[i] = (char) byteBuffer[i];
                }
                return (String.valueOf(charResult));
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}