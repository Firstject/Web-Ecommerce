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
@Table(name = "ORDERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o")
    , @NamedQuery(name = "Orders.findByOrderId", query = "SELECT o FROM Orders o WHERE o.orderId = :orderId")
    , @NamedQuery(name = "Orders.findByOrderAmount", query = "SELECT o FROM Orders o WHERE o.orderAmount = :orderAmount")
    , @NamedQuery(name = "Orders.findByOrderShipname", query = "SELECT o FROM Orders o WHERE o.orderShipname = :orderShipname")
    , @NamedQuery(name = "Orders.findByOrderShipaddress", query = "SELECT o FROM Orders o WHERE o.orderShipaddress = :orderShipaddress")
    , @NamedQuery(name = "Orders.findByOrderShipaddress2", query = "SELECT o FROM Orders o WHERE o.orderShipaddress2 = :orderShipaddress2")
    , @NamedQuery(name = "Orders.findByOrderCity", query = "SELECT o FROM Orders o WHERE o.orderCity = :orderCity")
    , @NamedQuery(name = "Orders.findByOrderState", query = "SELECT o FROM Orders o WHERE o.orderState = :orderState")
    , @NamedQuery(name = "Orders.findByOrderZip", query = "SELECT o FROM Orders o WHERE o.orderZip = :orderZip")
    , @NamedQuery(name = "Orders.findByOrderAddress", query = "SELECT o FROM Orders o WHERE o.orderAddress = :orderAddress")
    , @NamedQuery(name = "Orders.findByOrderPhone", query = "SELECT o FROM Orders o WHERE o.orderPhone = :orderPhone")
    , @NamedQuery(name = "Orders.findByOrderTax", query = "SELECT o FROM Orders o WHERE o.orderTax = :orderTax")
    , @NamedQuery(name = "Orders.findByOrderEmail", query = "SELECT o FROM Orders o WHERE o.orderEmail = :orderEmail")
    , @NamedQuery(name = "Orders.findByOrderDate", query = "SELECT o FROM Orders o WHERE o.orderDate = :orderDate")
    , @NamedQuery(name = "Orders.findByOrderShipped", query = "SELECT o FROM Orders o WHERE o.orderShipped = :orderShipped")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDER_ID")
    private Integer orderId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDER_AMOUNT")
    private int orderAmount;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "ORDER_SHIPNAME")
    private String orderShipname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "ORDER_SHIPADDRESS")
    private String orderShipaddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "ORDER_SHIPADDRESS2")
    private String orderShipaddress2;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "ORDER_CITY")
    private String orderCity;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "ORDER_STATE")
    private String orderState;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "ORDER_ZIP")
    private String orderZip;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "ORDER_ADDRESS")
    private String orderAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 48)
    @Column(name = "ORDER_PHONE")
    private String orderPhone;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDER_TAX")
    private double orderTax;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "ORDER_EMAIL")
    private String orderEmail;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDER_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDER_SHIPPED")
    private Boolean orderShipped;
    @JoinColumn(name = "ORDER_USERID", referencedColumnName = "USERID")
    @ManyToOne(optional = false)
    private Users orderUserid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "detailOrderid")
    private List<Orderdetails> orderdetailsList;

    public Orders() {
    }

    public Orders(Integer orderId) {
        this.orderId = orderId;
    }

    public Orders(Integer orderId, int orderAmount, String orderShipname, String orderShipaddress, String orderShipaddress2, String orderCity, String orderState, String orderZip, String orderAddress, String orderPhone, double orderTax, String orderEmail, Date orderDate, Boolean orderShipped) {
        this.orderId = orderId;
        this.orderAmount = orderAmount;
        this.orderShipname = orderShipname;
        this.orderShipaddress = orderShipaddress;
        this.orderShipaddress2 = orderShipaddress2;
        this.orderCity = orderCity;
        this.orderState = orderState;
        this.orderZip = orderZip;
        this.orderAddress = orderAddress;
        this.orderPhone = orderPhone;
        this.orderTax = orderTax;
        this.orderEmail = orderEmail;
        this.orderDate = orderDate;
        this.orderShipped = orderShipped;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public int getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(int orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getOrderShipname() {
        return orderShipname;
    }

    public void setOrderShipname(String orderShipname) {
        this.orderShipname = orderShipname;
    }

    public String getOrderShipaddress() {
        return orderShipaddress;
    }

    public void setOrderShipaddress(String orderShipaddress) {
        this.orderShipaddress = orderShipaddress;
    }

    public String getOrderShipaddress2() {
        return orderShipaddress2;
    }

    public void setOrderShipaddress2(String orderShipaddress2) {
        this.orderShipaddress2 = orderShipaddress2;
    }

    public String getOrderCity() {
        return orderCity;
    }

    public void setOrderCity(String orderCity) {
        this.orderCity = orderCity;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    public String getOrderZip() {
        return orderZip;
    }

    public void setOrderZip(String orderZip) {
        this.orderZip = orderZip;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public String getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }

    public double getOrderTax() {
        return orderTax;
    }

    public void setOrderTax(double orderTax) {
        this.orderTax = orderTax;
    }

    public String getOrderEmail() {
        return orderEmail;
    }

    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Boolean getOrderShipped() {
        return orderShipped;
    }

    public void setOrderShipped(Boolean orderShipped) {
        this.orderShipped = orderShipped;
    }

    public Users getOrderUserid() {
        return orderUserid;
    }

    public void setOrderUserid(Users orderUserid) {
        this.orderUserid = orderUserid;
    }

    @XmlTransient
    public List<Orderdetails> getOrderdetailsList() {
        return orderdetailsList;
    }

    public void setOrderdetailsList(List<Orderdetails> orderdetailsList) {
        this.orderdetailsList = orderdetailsList;
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
