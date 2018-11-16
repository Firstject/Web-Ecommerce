package sit.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import sit.model.Products;
import sit.model.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-02T09:09:11")
@StaticMetamodel(ProductStats.class)
public class ProductStats_ { 

    public static volatile SingularAttribute<ProductStats, Integer> productstatsid;
    public static volatile SingularAttribute<ProductStats, String> stattype;
    public static volatile SingularAttribute<ProductStats, Products> productstatsProductid;
    public static volatile SingularAttribute<ProductStats, Users> productstatsUserid;

}