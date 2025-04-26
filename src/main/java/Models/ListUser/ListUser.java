package Models.ListUser;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ListUser implements Serializable {
    public List<User> items = new ArrayList<>();
    public void addUser(User user){
        items.add(user);
    }

    public List<User> getItems() {
        return items;
    }
}
