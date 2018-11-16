package sit.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import sit.model.OrderDetails;
import sit.model.ProductCategories;
import sit.model.ProductStats;
import sit.model.Wishlists;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-02T09:09:11")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, Integer> productId;
    public static volatile ListAttribute<Products, Wishlists> wishlistsList;
    public static volatile SingularAttribute<Products, Short> productStock;
    public static volatile SingularAttribute<Products, Short> productLive;
    public static volatile ListAttribute<Products, ProductStats> productStatsList;
    public static volatile SingularAttribute<Products, String> productName;
    public static volatile SingularAttribute<Products, String> productDesc;
    public static volatile SingularAttribute<Products, Date> productUpdatedate;
    public static volatile SingularAttribute<Products, String> productLocaton;
    public static volatile SingularAttribute<Products, String> productImage;
    public static volatile ListAttribute<Products, OrderDetails> orderDetailsList;
    public static volatile SingularAttribute<Products, ProductCategories> productCategotyid;
    public static volatile SingularAttribute<Products, Double> productPrice;

}