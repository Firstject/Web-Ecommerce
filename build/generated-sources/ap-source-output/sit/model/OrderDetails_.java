package sit.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import sit.model.Orders;
import sit.model.Products;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-02T09:09:11")
@StaticMetamodel(OrderDetails.class)
public class OrderDetails_ { 

    public static volatile SingularAttribute<OrderDetails, Double> detailPrice;
    public static volatile SingularAttribute<OrderDetails, String> detailName;
    public static volatile SingularAttribute<OrderDetails, Integer> detailQuantity;
    public static volatile SingularAttribute<OrderDetails, Orders> detailOrderid;
    public static volatile SingularAttribute<OrderDetails, Products> detailProductid;
    public static volatile SingularAttribute<OrderDetails, Integer> detailid;

}