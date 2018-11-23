/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
    @NamedQuery(name = "OrderDetails.findAll", query = "SELECT o FROM OrderDetails o")
    , @NamedQuery(name = "OrderDetails.findByDetailid", query = "SELECT o FROM OrderDetails o WHERE o.detailid = :detailid")
    , @NamedQuery(name = "OrderDetails.findByDetailUserid", query = "SELECT o FROM OrderDetails o "
                                                                  + "WHERE o.detailUserid = :detailUserid "
                                                                  + "ORDER BY o.detailOrderdate DESC")
    , @NamedQuery(name = "OrderDetails.findByDetailOrdernumber", query = "SELECT o FROM OrderDetails o "
                                                                       + "WHERE o.detailOrdernumber = :detailOrdernumber "
                                                                       + "AND o.detailUserid = :detailUserid")
    , @NamedQuery(name = "OrderDetails.findByDetailUserrealname", query = "SELECT o FROM OrderDetails o WHERE o.detailUserrealname = :detailUserrealname")
    , @NamedQuery(name = "OrderDetails.findByDetailAddress", query = "SELECT o FROM OrderDetails o WHERE o.detailAddress = :detailAddress")})
public class OrderDetails implements Serializable {

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "DETAIL_TOTALPRICE")
    private Double detailTotalprice;

    @Column(name = "DETAIL_ORDERDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date detailOrderdate;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "DETAILID")
    private Integer detailid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DETAIL_ORDERNUMBER")
    private int detailOrdernumber;
    @Size(max = 100)
    @Column(name = "DETAIL_USERREALNAME")
    private String detailUserrealname;
    @Size(max = 400)
    @Column(name = "DETAIL_ADDRESS")
    private String detailAddress;
    @JoinColumn(name = "DETAIL_ORDERID", referencedColumnName = "ORDER_ID")
    @ManyToOne(optional = false)
    private Orders detailOrderid;
    @JoinColumn(name = "DETAIL_USERID", referencedColumnName = "USERID")
    @ManyToOne(optional = false)
    private Users detailUserid;

    public OrderDetails() {
    }

    public OrderDetails(Integer detailid) {
        this.detailid = detailid;
    }

    public OrderDetails(Integer detailid, int detailOrdernumber) {
        this.detailid = detailid;
        this.detailOrdernumber = detailOrdernumber;
    }

    public Integer getDetailid() {
        return detailid;
    }

    public void setDetailid(Integer detailid) {
        this.detailid = detailid;
    }

    public int getDetailOrdernumber() {
        return detailOrdernumber;
    }

    public void setDetailOrdernumber(int detailOrdernumber) {
        this.detailOrdernumber = detailOrdernumber;
    }

    public String getDetailUserrealname() {
        return detailUserrealname;
    }

    public void setDetailUserrealname(String detailUserrealname) {
        this.detailUserrealname = detailUserrealname;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public Orders getDetailOrderid() {
        return detailOrderid;
    }

    public void setDetailOrderid(Orders detailOrderid) {
        this.detailOrderid = detailOrderid;
    }

    public Users getDetailUserid() {
        return detailUserid;
    }

    public void setDetailUserid(Users detailUserid) {
        this.detailUserid = detailUserid;
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
        if (!(object instanceof OrderDetails)) {
            return false;
        }
        OrderDetails other = (OrderDetails) object;
        if ((this.detailid == null && other.detailid != null) || (this.detailid != null && !this.detailid.equals(other.detailid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.OrderDetails[ detailid=" + detailid + " ]";
    }

    public Date getDetailOrderdate() {
        return detailOrderdate;
    }

    public void setDetailOrderdate(Date detailOrderdate) {
        this.detailOrderdate = detailOrderdate;
    }

    public Double getDetailTotalprice() {
        return detailTotalprice;
    }

    public void setDetailTotalprice(Double detailTotalprice) {
        this.detailTotalprice = detailTotalprice;
    }

}
