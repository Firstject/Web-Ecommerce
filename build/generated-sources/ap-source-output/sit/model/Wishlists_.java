package sit.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import sit.model.Products;
import sit.model.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-02T09:09:11")
@StaticMetamodel(Wishlists.class)
public class Wishlists_ { 

    public static volatile SingularAttribute<Wishlists, Users> wishlistUserid;
    public static volatile SingularAttribute<Wishlists, Products> wishlistProductid;
    public static volatile SingularAttribute<Wishlists, Integer> wishlistid;

}