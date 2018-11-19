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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Firsty
 */
@Entity
@Table(name = "ORDERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o")
    , @NamedQuery(name = "Orders.findByOrderId", query = "SELECT o FROM Orders o WHERE o.orderId = :orderId")
    , @NamedQuery(name = "Orders.findByOrderProductquantity", query = "SELECT o FROM Orders o WHERE o.orderProductquantity = :orderProductquantity")
    , @NamedQuery(name = "Orders.findByOrderProductprice", query = "SELECT o FROM Orders o WHERE o.orderProductprice = :orderProductprice")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDER_ID")
    private Integer orderId;
    @Column(name = "ORDER_PRODUCTQUANTITY")
    private Integer orderProductquantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "ORDER_PRODUCTPRICE")
    private Double orderProductprice;
    @JoinColumn(name = "ORDER_PRODUCTID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Products orderProductid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "detailOrderid")
    private List<OrderDetails> orderDetailsList;

    public Orders() {
    }

    public Orders(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderProductquantity() {
        return orderProductquantity;
    }

    public void setOrderProductquantity(Integer orderProductquantity) {
        this.orderProductquantity = orderProductquantity;
    }

    public Double getOrderProductprice() {
        return orderProductprice;
    }

    public void setOrderProductprice(Double orderProductprice) {
        this.orderProductprice = orderProductprice;
    }

    public Products getOrderProductid() {
        return orderProductid;
    }

    public void setOrderProductid(Products orderProductid) {
        this.orderProductid = orderProductid;
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
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.Orders[ orderId=" + orderId + " ]";
    }
    
}
