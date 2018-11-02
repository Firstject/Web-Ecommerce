/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Firsty
 */
@Entity
@Table(name = "PRODUCTCATEGORIES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductCategories.findAll", query = "SELECT p FROM ProductCategories p")
    , @NamedQuery(name = "ProductCategories.findByCategoryId", query = "SELECT p FROM ProductCategories p WHERE p.categoryId = :categoryId")
    , @NamedQuery(name = "ProductCategories.findByCategoryname", query = "SELECT p FROM ProductCategories p WHERE p.categoryname = :categoryname")})
public class ProductCategories implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "CATEGORY_ID")
    private Integer categoryId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "CATEGORYNAME")
    private String categoryname;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productCategotyid")
    private List<Products> productsList;

    public ProductCategories() {
    }

    public ProductCategories(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public ProductCategories(Integer categoryId, String categoryname) {
        this.categoryId = categoryId;
        this.categoryname = categoryname;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    @XmlTransient
    public List<Products> getProductsList() {
        return productsList;
    }

    public void setProductsList(List<Products> productsList) {
        this.productsList = productsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (categoryId != null ? categoryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductCategories)) {
            return false;
        }
        ProductCategories other = (ProductCategories) object;
        if ((this.categoryId == null && other.categoryId != null) || (this.categoryId != null && !this.categoryId.equals(other.categoryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.ProductCategories[ categoryId=" + categoryId + " ]";
    }
    
}
