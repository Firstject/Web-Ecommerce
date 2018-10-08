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
@Table(name = "ORDERDETAILS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderdetails.findAll", query = "SELECT o FROM Orderdetails o")
    , @NamedQuery(name = "Orderdetails.findByDetailid", query = "SELECT o FROM Orderdetails o WHERE o.detailid = :detailid")
    , @NamedQuery(name = "Orderdetails.findByDetailName", query = "SELECT o FROM Orderdetails o WHERE o.detailName = :detailName")
    , @NamedQuery(name = "Orderdetails.findByDetailPrice", query = "SELECT o FROM Orderdetails o WHERE o.detailPrice = :detailPrice")
    , @NamedQuery(name = "Orderdetails.findByDetailQuantity", query = "SELECT o FROM Orderdetails o WHERE o.detailQuantity = :detailQuantity")})
public class Orderdetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DETAILID")
    private Integer detailid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "DETAIL_NAME")
    private String detailName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DETAIL_PRICE")
    private double detailPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DETAIL_QUANTITY")
    private int detailQuantity;
    @JoinColumn(name = "DETAIL_ORDERID", referencedColumnName = "ORDER_ID")
    @ManyToOne(optional = false)
    private Orders detailOrderid;
    @JoinColumn(name = "DETAIL_PRODUCTID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Products detailProductid;

    public Orderdetails() {
    }

    public Orderdetails(Integer detailid) {
        this.detailid = detailid;
    }

    public Orderdetails(Integer detailid, String detailName, double detailPrice, int detailQuantity) {
        this.detailid = detailid;
        this.detailName = detailName;
        this.detailPrice = detailPrice;
        this.detailQuantity = detailQuantity;
    }

    public Integer getDetailid() {
        return detailid;
    }

    public void setDetailid(Integer detailid) {
        this.detailid = detailid;
    }

    public String getDetailName() {
        return detailName;
    }

    public void setDetailName(String detailName) {
        this.detailName = detailName;
    }

    public double getDetailPrice() {
        return detailPrice;
    }

    public void setDetailPrice(double detailPrice) {
        this.detailPrice = detailPrice;
    }

    public int getDetailQuantity() {
        return detailQuantity;
    }

    public void setDetailQuantity(int detailQuantity) {
        this.detailQuantity = detailQuantity;
    }

    public Orders getDetailOrderid() {
        return detailOrderid;
    }

    public void setDetailOrderid(Orders detailOrderid) {
        this.detailOrderid = detailOrderid;
    }

    public Products getDetailProductid() {
        return detailProductid;
    }

    public void setDetailProductid(Products detailProductid) {
        this.detailProductid = detailProductid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (detailid != null ? detailid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderdetails)) {
            return false;
        }
        Orderdetails other = (Orderdetails) object;
        if ((this.detailid == null && other.detailid != null) || (this.detailid != null && !this.detailid.equals(other.detailid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.Orderdetails[ detailid=" + detailid + " ]";
    }
    
}
