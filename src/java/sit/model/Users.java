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
@Table(name = "USERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u")
    , @NamedQuery(name = "Users.findByUserid", query = "SELECT u FROM Users u WHERE u.userid = :userid")
    , @NamedQuery(name = "Users.findByUsername", query = "SELECT u FROM Users u WHERE lower(u.username) like :username")
    , @NamedQuery(name = "Users.findByFname", query = "SELECT u FROM Users u WHERE u.fname = :fname")
    , @NamedQuery(name = "Users.findByLname", query = "SELECT u FROM Users u WHERE u.lname = :lname")
    , @NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE lower(u.email) like :email")
    , @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password")
    , @NamedQuery(name = "Users.findByCity", query = "SELECT u FROM Users u WHERE u.city = :city")
    , @NamedQuery(name = "Users.findByUserState", query = "SELECT u FROM Users u WHERE u.userState = :userState")
    , @NamedQuery(name = "Users.findByAddress", query = "SELECT u FROM Users u WHERE u.address = :address")
    , @NamedQuery(name = "Users.findByCountry", query = "SELECT u FROM Users u WHERE u.country = :country")
    , @NamedQuery(name = "Users.findByZipCode", query = "SELECT u FROM Users u WHERE u.zipCode = :zipCode")
    , @NamedQuery(name = "Users.findByPhoneNumber", query = "SELECT u FROM Users u WHERE u.phoneNumber = :phoneNumber")
    , @NamedQuery(name = "Users.findByRegisterDate", query = "SELECT u FROM Users u WHERE u.registerDate = :registerDate")
    , @NamedQuery(name = "Users.findByVerifyCode", query = "SELECT u FROM Users u WHERE u.verifyCode = :verifyCode")
    , @NamedQuery(name = "Users.findByResetpassCode", query = "SELECT u FROM Users u WHERE u.resetpassCode = :resetpassCode")
    , @NamedQuery(name = "Users.findByResetpassExpiredate", query = "SELECT u FROM Users u WHERE u.resetpassExpiredate = :resetpassExpiredate")
    , @NamedQuery(name = "Users.findByActivateDate", query = "SELECT u FROM Users u WHERE u.activateDate = :activateDate")})
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "USERID")
    private Integer userid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "USERNAME")
    private String username;
    @Size(max = 32)
    @Column(name = "FNAME")
    private String fname;
    @Size(max = 32)
    @Column(name = "LNAME")
    private String lname;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "EMAIL")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "PASSWORD")
    private String password;
    @Size(max = 64)
    @Column(name = "CITY")
    private String city;
    @Size(max = 32)
    @Column(name = "USER_STATE")
    private String userState;
    @Size(max = 100)
    @Column(name = "ADDRESS")
    private String address;
    @Size(max = 32)
    @Column(name = "COUNTRY")
    private String country;
    @Size(max = 16)
    @Column(name = "ZIP_CODE")
    private String zipCode;
    @Size(max = 48)
    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;
    @Basic(optional = false)
    @NotNull
    @Column(name = "REGISTER_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date registerDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "VERIFY_CODE")
    private String verifyCode;
    @Size(max = 32)
    @Column(name = "RESETPASS_CODE")
    private String resetpassCode;
    @Column(name = "RESETPASS_EXPIREDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date resetpassExpiredate;
    @Column(name = "ACTIVATE_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date activateDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productstatsUserid")
    private List<ProductStats> productStatsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "wishlistUserid")
    private List<Wishlists> wishlistsList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderUserid")
    private List<Orders> ordersList;

    public Users() {
    }

    public Users(Integer userid) {
        this.userid = userid;
    }

    public Users(Integer userid, String username, String email, String password, Date registerDate, String verifyCode) {
        this.userid = userid;
        this.username = username;
        this.email = email;
        this.password = password;
        this.registerDate = registerDate;
        this.verifyCode = verifyCode;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getResetpassCode() {
        return resetpassCode;
    }

    public void setResetpassCode(String resetpassCode) {
        this.resetpassCode = resetpassCode;
    }

    public Date getResetpassExpiredate() {
        return resetpassExpiredate;
    }

    public void setResetpassExpiredate(Date resetpassExpiredate) {
        this.resetpassExpiredate = resetpassExpiredate;
    }

    public Date getActivateDate() {
        return activateDate;
    }

    public void setActivateDate(Date activateDate) {
        this.activateDate = activateDate;
    }

    @XmlTransient
    public List<ProductStats> getProductStatsList() {
        return productStatsList;
    }

    public void setProductStatsList(List<ProductStats> productStatsList) {
        this.productStatsList = productStatsList;
    }

    @XmlTransient
    public List<Wishlists> getWishlistsList() {
        return wishlistsList;
    }

    public void setWishlistsList(List<Wishlists> wishlistsList) {
        this.wishlistsList = wishlistsList;
    }

    @XmlTransient
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userid != null ? userid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.userid == null && other.userid != null) || (this.userid != null && !this.userid.equals(other.userid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Users{" + "userid=" + userid + ", username=" + username + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", password=" + password + ", city=" + city + ", userState=" + userState + ", address=" + address + ", country=" + country + ", zipCode=" + zipCode + ", phoneNumber=" + phoneNumber + ", registerDate=" + registerDate + ", verifyCode=" + verifyCode + ", resetpassCode=" + resetpassCode + ", resetpassExpiredate=" + resetpassExpiredate + ", activateDate=" + activateDate + ", productStatsList=" + productStatsList + ", wishlistsList=" + wishlistsList + ", ordersList=" + ordersList + '}';
    }

    
    
}
