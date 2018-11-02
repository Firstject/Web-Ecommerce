/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Firsty
 */
@Entity
@Table(name = "PRODUCTSTATS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductStats.findAll", query = "SELECT p FROM ProductStats p")
    , @NamedQuery(name = "ProductStats.findByProductstatsid", query = "SELECT p FROM ProductStats p WHERE p.productstatsid = :productstatsid")
    , @NamedQuery(name = "ProductStats.findByStattype", query = "SELECT p FROM ProductStats p WHERE p.stattype = :stattype")})
public class ProductStats implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCTSTATSID")
    private Integer productstatsid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "STATTYPE")
    private String stattype;
    @JoinColumn(name = "PRODUCTSTATS_PRODUCTID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Products productstatsProductid;
    @JoinColumn(name = "PRODUCTSTATS_USERID", referencedColumnName = "USERID")
    @ManyToOne(optional = false)
    private Users productstatsUserid;

    public ProductStats() {
    }

    public ProductStats(Integer productstatsid) {
        this.productstatsid = productstatsid;
    }

    public ProductStats(Integer productstatsid, String stattype) {
        this.productstatsid = productstatsid;
        this.stattype = stattype;
    }

    public Integer getProductstatsid() {
        return productstatsid;
    }

    public void setProductstatsid(Integer productstatsid) {
        this.productstatsid = productstatsid;
    }

    public String getStattype() {
        return stattype;
    }

    public void setStattype(String stattype) {
        this.stattype = stattype;
    }

    public Products getProductstatsProductid() {
        return productstatsProductid;
    }

    public void setProductstatsProductid(Products productstatsProductid) {
        this.productstatsProductid = productstatsProductid;
    }

    public Users getProductstatsUserid() {
        return productstatsUserid;
    }

    public void setProductstatsUserid(Users productstatsUserid) {
        this.productstatsUserid = productstatsUserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productstatsid != null ? productstatsid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductStats)) {
            return false;
        }
        ProductStats other = (ProductStats) object;
        if ((this.productstatsid == null && other.productstatsid != null) || (this.productstatsid != null && !this.productstatsid.equals(other.productstatsid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.ProductStats[ productstatsid=" + productstatsid + " ]";
    }
    
}
