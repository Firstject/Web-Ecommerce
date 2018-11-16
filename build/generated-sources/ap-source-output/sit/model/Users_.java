package sit.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import sit.model.Orders;
import sit.model.ProductStats;
import sit.model.Wishlists;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-02T09:09:11")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, String> fname;
    public static volatile SingularAttribute<Users, String> country;
    public static volatile SingularAttribute<Users, String> zipCode;
    public static volatile SingularAttribute<Users, String> address;
    public static volatile SingularAttribute<Users, String> verifyCode;
    public static volatile SingularAttribute<Users, Date> activateDate;
    public static volatile ListAttribute<Users, Wishlists> wishlistsList;
    public static volatile SingularAttribute<Users, String> city;
    public static volatile SingularAttribute<Users, Date> resetpassExpiredate;
    public static volatile ListAttribute<Users, ProductStats> productStatsList;
    public static volatile SingularAttribute<Users, Integer> userid;
    public static volatile SingularAttribute<Users, String> lname;
    public static volatile SingularAttribute<Users, String> password;
    public static volatile SingularAttribute<Users, String> phoneNumber;
    public static volatile SingularAttribute<Users, String> resetpassCode;
    public static volatile SingularAttribute<Users, String> userState;
    public static volatile SingularAttribute<Users, String> email;
    public static volatile ListAttribute<Users, Orders> ordersList;
    public static volatile SingularAttribute<Users, String> username;
    public static volatile SingularAttribute<Users, Date> registerDate;

}