package Services;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class RenderURLFacebook {
    public String returnURL(String apiUrl) throws IOException {

        // Gọi API Facebook
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        // Đọc dữ liệu từ API
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder jsonResult = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonResult.append(line);
        }
        reader.close();

        // Chuyển đổi JSON thành Object
        JSONObject json = new JSONObject(jsonResult.toString());
        String avatarUrl = json.getJSONObject("data").getString("url");
        return avatarUrl;

    }
}




