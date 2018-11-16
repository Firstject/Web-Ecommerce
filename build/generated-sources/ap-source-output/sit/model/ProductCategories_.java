package sit.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import sit.model.Products;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-02T09:09:11")
@StaticMetamodel(ProductCategories.class)
public class ProductCategories_ { 

    public static volatile ListAttribute<ProductCategories, Products> productsList;
    public static volatile SingularAttribute<ProductCategories, String> categoryname;
    public static volatile SingularAttribute<ProductCategories, Integer> categoryId;

}