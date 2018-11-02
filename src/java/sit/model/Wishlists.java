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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Firsty
 */
@Entity
@Table(name = "WISHLISTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Wishlists.findAll", query = "SELECT w FROM Wishlists w")
    , @NamedQuery(name = "Wishlists.findByWishlistid", query = "SELECT w FROM Wishlists w WHERE w.wishlistid = :wishlistid")})
public class Wishlists implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "WISHLISTID")
    private Integer wishlistid;
    @JoinColumn(name = "WISHLIST_PRODUCTID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Products wishlistProductid;
    @JoinColumn(name = "WISHLIST_USERID", referencedColumnName = "USERID")
    @ManyToOne(optional = false)
    private Users wishlistUserid;

    public Wishlists() {
    }

    public Wishlists(Integer wishlistid) {
        this.wishlistid = wishlistid;
    }

    public Integer getWishlistid() {
        return wishlistid;
    }

    public void setWishlistid(Integer wishlistid) {
        this.wishlistid = wishlistid;
    }

    public Products getWishlistProductid() {
        return wishlistProductid;
    }

    public void setWishlistProductid(Products wishlistProductid) {
        this.wishlistProductid = wishlistProductid;
    }

    public Users getWishlistUserid() {
        return wishlistUserid;
    }

    public void setWishlistUserid(Users wishlistUserid) {
        this.wishlistUserid = wishlistUserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (wishlistid != null ? wishlistid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Wishlists)) {
            return false;
        }
        Wishlists other = (Wishlists) object;
        if ((this.wishlistid == null && other.wishlistid != null) || (this.wishlistid != null && !this.wishlistid.equals(other.wishlistid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.Wishlists[ wishlistid=" + wishlistid + " ]";
    }
    
}
