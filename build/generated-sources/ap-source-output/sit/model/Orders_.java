package sit.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import sit.model.OrderDetails;
import sit.model.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-02T09:09:11")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, String> orderZip;
    public static volatile SingularAttribute<Orders, String> orderAddress;
    public static volatile SingularAttribute<Orders, Integer> orderId;
    public static volatile SingularAttribute<Orders, String> orderShipaddress;
    public static volatile SingularAttribute<Orders, Short> orderShipped;
    public static volatile SingularAttribute<Orders, String> orderEmail;
    public static volatile SingularAttribute<Orders, Double> orderTax;
    public static volatile SingularAttribute<Orders, String> orderState;
    public static volatile SingularAttribute<Orders, String> orderShipaddress2;
    public static volatile SingularAttribute<Orders, Users> orderUserid;
    public static volatile SingularAttribute<Orders, Integer> orderAmount;
    public static volatile ListAttribute<Orders, OrderDetails> orderDetailsList;
    public static volatile SingularAttribute<Orders, String> orderCity;
    public static volatile SingularAttribute<Orders, String> orderShipname;
    public static volatile SingularAttribute<Orders, String> orderPhone;
    public static volatile SingularAttribute<Orders, Date> orderDate;

}