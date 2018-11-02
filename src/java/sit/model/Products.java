/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Firsty
 */
@Entity
@Table(name = "PRODUCTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p")
    , @NamedQuery(name = "Products.findByProductId", query = "SELECT p FROM Products p WHERE p.productId = :productId")
    , @NamedQuery(name = "Products.findByProductName", query = "SELECT p FROM Products p WHERE p.productName = :productName")
    , @NamedQuery(name = "Products.findByProductPrice", query = "SELECT p FROM Products p WHERE p.productPrice = :productPrice")
    , @NamedQuery(name = "Products.findByProductDesc", query = "SELECT p FROM Products p WHERE p.productDesc = :productDesc")
    , @NamedQuery(name = "Products.findByProductImage", query = "SELECT p FROM Products p WHERE p.productImage = :productImage")
    , @NamedQuery(name = "Products.findByProductUpdatedate", query = "SELECT p FROM Products p WHERE p.productUpdatedate = :productUpdatedate")
    , @NamedQuery(name = "Products.findByProductStock", query = "SELECT p FROM Products p WHERE p.productStock = :productStock")
    , @NamedQuery(name = "Products.findByProductLive", query = "SELECT p FROM Products p WHERE p.productLive = :productLive")
    , @NamedQuery(name = "Products.findByProductLocaton", query = "SELECT p FROM Products p WHERE p.productLocaton = :productLocaton")})
public class Products implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_ID")
    private Integer productId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "PRODUCT_NAME")
    private String productName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_PRICE")
    private double productPrice;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "PRODUCT_DESC")
    private String productDesc;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "PRODUCT_IMAGE")
    private String productImage;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_UPDATEDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date productUpdatedate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_STOCK")
    private short productStock;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_LIVE")
    private short productLive;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "PRODUCT_LOCATON")
    private String productLocaton;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productstatsProductid")
    private List<ProductStats> productStatsList;
    @JoinColumn(name = "PRODUCT_CATEGOTYID", referencedColumnName = "CATEGORY_ID")
    @ManyToOne(optional = false)
    private ProductCategories productCategotyid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "wishlistProductid")
    private List<Wishlists> wishlistsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "detailProductid")
    private List<OrderDetails> orderDetailsList;

    public Products() {
    }

    public Products(Integer productId) {
        this.productId = productId;
    }

    public Products(Integer productId, String productName, double productPrice, String productDesc, String productImage, Date productUpdatedate, short productStock, short productLive, String productLocaton) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDesc = productDesc;
        this.productImage = productImage;
        this.productUpdatedate = productUpdatedate;
        this.productStock = productStock;
        this.productLive = productLive;
        this.productLocaton = productLocaton;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Date getProductUpdatedate() {
        return productUpdatedate;
    }

    public void setProductUpdatedate(Date productUpdatedate) {
        this.productUpdatedate = productUpdatedate;
    }

    public short getProductStock() {
        return productStock;
    }

    public void setProductStock(short productStock) {
        this.productStock = productStock;
    }

    public short getProductLive() {
        return productLive;
    }

    public void setProductLive(short productLive) {
        this.productLive = productLive;
    }

    public String getProductLocaton() {
        return productLocaton;
    }

    public void setProductLocaton(String productLocaton) {
        this.productLocaton = productLocaton;
    }

    @XmlTransient
    public List<ProductStats> getProductStatsList() {
        return productStatsList;
    }

    public void setProductStatsList(List<ProductStats> productStatsList) {
        this.productStatsList = productStatsList;
    }

    public ProductCategories getProductCategotyid() {
        return productCategotyid;
    }

    public void setProductCategotyid(ProductCategories productCategotyid) {
        this.productCategotyid = productCategotyid;
    }

    @XmlTransient
    public List<Wishlists> getWishlistsList() {
        return wishlistsList;
    }

    public void setWishlistsList(List<Wishlists> wishlistsList) {
        this.wishlistsList = wishlistsList;
    }

    @XmlTransient
    public List<OrderDetails> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetails> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.Products[ productId=" + productId + " ]";
    }
    
}
