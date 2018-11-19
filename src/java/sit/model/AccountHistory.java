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
@Table(name = "ACCOUNTHISTORY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountHistory.findAll", query = "SELECT a FROM AccountHistory a")
    , @NamedQuery(name = "AccountHistory.findByHistoryid", query = "SELECT a FROM AccountHistory a WHERE a.historyid = :historyid")
    , @NamedQuery(name = "AccountHistory.findByHistoryUserid", query = "SELECT a FROM AccountHistory a WHERE a.historyUserid = :historyUserid ORDER BY a.historyDate DESC")
    , @NamedQuery(name = "AccountHistory.findByHistoryUseridEntities", query = "SELECT a "
                                                                             + "FROM AccountHistory a "
                                                                             + "WHERE a.historyUserid = :historyUserid "
                                                                             + "ORDER BY a.historyDate DESC")
    , @NamedQuery(name = "AccountHistory.findByHistoryType", query = "SELECT a FROM AccountHistory a WHERE a.historyType = :historyType")
    , @NamedQuery(name = "AccountHistory.findByHistoryDate", query = "SELECT a FROM AccountHistory a WHERE a.historyDate = :historyDate")
    , @NamedQuery(name = "AccountHistory.findByHistoryInfo", query = "SELECT a FROM AccountHistory a WHERE a.historyInfo = :historyInfo")})
public class AccountHistory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "HISTORYID")
    private Integer historyid;
    @Size(max = 64)
    @Column(name = "HISTORY_TYPE")
    private String historyType;
    @Column(name = "HISTORY_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date historyDate;
    @Size(max = 128)
    @Column(name = "HISTORY_INFO")
    private String historyInfo;
    @Size(max = 128)
    @Column(name = "HISTORY_INFO2")
    private String historyInfo2;
    @JoinColumn(name = "HISTORY_USERID", referencedColumnName = "USERID")
    @ManyToOne(optional = false)
    private Users historyUserid;

    public AccountHistory() {
    }

    public AccountHistory(Integer historyid) {
        this.historyid = historyid;
    }

    public Integer getHistoryid() {
        return historyid;
    }

    public void setHistoryid(Integer historyid) {
        this.historyid = historyid;
    }

    public String getHistoryType() {
        return historyType;
    }

    public void setHistoryType(String historyType) {
        this.historyType = historyType;
    }

    public Date getHistoryDate() {
        return historyDate;
    }

    public void setHistoryDate(Date historyDate) {
        this.historyDate = historyDate;
    }

    public String getHistoryInfo() {
        return historyInfo;
    }

    public void setHistoryInfo(String historyInfo) {
        this.historyInfo = historyInfo;
    }

    public String getHistoryInfo2() {
        return historyInfo2;
    }

    public void setHistoryInfo2(String historyInfo2) {
        this.historyInfo2 = historyInfo2;
    }

    public Users getHistoryUserid() {
        return historyUserid;
    }

    public void setHistoryUserid(Users historyUserid) {
        this.historyUserid = historyUserid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (historyid != null ? historyid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccountHistory)) {
            return false;
        }
        AccountHistory other = (AccountHistory) object;
        if ((this.historyid == null && other.historyid != null) || (this.historyid != null && !this.historyid.equals(other.historyid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sit.model.AccountHistory[ historyid=" + historyid + " ]";
    }
    
}
