package ru.itmo.tpl.util;

import ru.itmo.tpl.model.Color;
import ru.itmo.tpl.model.Post;
import ru.itmo.tpl.model.User;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class DataUtil {
    private static final List<User> USERS = Arrays.asList(
            new User(1, "MikeMirayanov", "Mikhail Mirzayanov", Color.RED),
            new User(2, "tourist", "Genady Korotkevich", Color.GREEN),
            new User(3, "emusk", "Elon Musk", Color.BLUE),
            new User(5, "pashka", "Pavel Mavrin", Color.GREEN),
            new User(7, "geranazavr555", "Georgiy Nazarov", Color.RED),
            new User(11, "cannon147", "Erofey Bashunov", Color.RED)
    );

    private static List<User> getUsers() {
        return USERS;
    }

    private static final List<Post> POSTS = Arrays.asList(
            new Post(3, "by MikeMirayanov", "Mikhail Mirzayanov, says +\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris posuere nec lectus a aliquet. Pellentesque id ante a turpis imperdiet mattis. Integer non dolor quis nisl pharetra imperdiet eu sit amet odio. Mauris eu vehicula orci. Curabitur vel leo mattis, tincidunt dui non, efficitur mauris. Curabitur ut nisi aliquam, condimentum tellus ac, viverra tellus. Integer nec porta magna. Nam gravida mi nec orci consequat facilisis.\\n\" +\n" +
                    "                    \"\\n\" +\n" +
                    "                    \"Donec cursus mauris dui, nec auctor urna mattis vitae. Donec sit amet mattis mi. Mauris tempor felis a fringilla auctor. Cras imperdiet arcu vel nisi sollicitudin suscipit. In vehicula fringilla augue lacinia auctor. In finibus pharetra consectetur. Praesent convallis diam velit, eu tincidunt justo vehicula nec.\\n\" +\n" +
                    "                    \"\\n\" +\n" +
                    "                    \"Sed in enim pulvinar, convallis quam id, convallis lacus. Duis purus erat, euismod sit amet sem ac, maximus condimentum nisl. Aliquam tristique libero et velit tristique ultricies. Duis auctor nunc eu quam tincidunt, non gravida urna bibendum. Sed velit nibh, bibendum in finibus sit amet, convallis vitae odio. Mauris rhoncus imperdiet risus in placerat. Vivamus pretium quis odio eu ultrices. Quisque ullamcorper metus eget lorem auctor, sollicitudin cursus enim consequat.\\n\" +\n" +
                    "                    \"\\n\" +\n" +
                    "                    \"Aenean euismod volutpat ipsum, mattis tempor quam tempor blandit. Aenean sollicitudin tincidunt nunc, non semper neque pellentesque et. Aenean nec commodo massa, vel dignissim felis. Mauris mollis sem vel sem vulputate, sit amet congue eros ultricies. Duis velit felis, egestas ac maximus pharetra, finibus vitae augue. Vestibulum dictum mattis turpis ac vehicula. Integer porttitor sit amet massa id semper. Integer consectetur mi porttitor lacus dapibus mollis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin sit amet lacinia felis. Quisque malesuada porttitor quam a rhoncus.\\n\" +\n" +
                    "                    \"\\n\" +\n" +
                    "                    \"Suspendisse quis facilisis ex. Nullam id fringilla leo. Nam placerat et turpis vitae euismod. Sed neque ipsum, mattis eget vestibulum ut, scelerisque ut enim. Nam vel elementum justo. In hac habitasse platea dictumst. Sed non sapien rutrum, consectetur ante eget, accumsan eros. Sed ut justo vitae nulla ullamcorper ultricies. Proin sollicitudin eget est vitae vulputate. Mauris lacinia massa id suscipit vehicula. Vivamus pretium magna nunc, at vulputate tortor lobortis ac. Proin quam ipsum, faucibus eu venenatis nec, cursus sed magna. Cras id varius metus. Mauris porta orci eu purus ultrices placerat. Nulla ultricies nunc malesuada dolor efficitur, a gravida elit aliquam.\"),", 1),
            new Post(44, "by tourist", "Genady Korotkevich, says", 2),
            new Post(1, "by emusk", "Elon Musk, says", 3),
            new Post(2, "by pashka", "Pavel Mavrin says", 11),
            new Post(7, "by geranazavr555", "Georgiy Nazarov says", 5),
            new Post(4, "by cannon147", "Erofey Bashunov says", 3)
    );

    private static List<Post> getPosts() {
        return POSTS;
    }

    public static void putData(Map<String, Object> data) {
        data.put("users", getUsers());
        data.put("posts", getPosts());
        for (User user: getUsers()) {
            if (data.get("logged_user_id") != null) {
                if ((user.getId()) == Long.parseLong(String.valueOf(data.get("logged_user_id")))) {
                    data.put("user", user);
                }
            }
        }
    }
}
