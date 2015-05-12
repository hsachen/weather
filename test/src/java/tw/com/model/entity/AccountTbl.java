/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jean
 */
@Entity
@Table(name = "account_tbl")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountTbl.findAll", query = "SELECT a FROM AccountTbl a"),
    @NamedQuery(name = "AccountTbl.findByAccountGroup", query = "SELECT a FROM AccountTbl a WHERE a.accountGroup = :accountGroup"),
    @NamedQuery(name = "AccountTbl.findByUserId", query = "SELECT a FROM AccountTbl a WHERE a.userId = :userId"),
    @NamedQuery(name = "AccountTbl.findByUserName", query = "SELECT a FROM AccountTbl a WHERE a.userName = :userName"),
    @NamedQuery(name = "AccountTbl.findByEmailAddress", query = "SELECT a FROM AccountTbl a WHERE a.emailAddress = :emailAddress"),
    @NamedQuery(name = "AccountTbl.findByValidFrom", query = "SELECT a FROM AccountTbl a WHERE a.validFrom = :validFrom"),
    @NamedQuery(name = "AccountTbl.findByValidEnd", query = "SELECT a FROM AccountTbl a WHERE a.validEnd = :validEnd"),
    @NamedQuery(name = "AccountTbl.findByStatus", query = "SELECT a FROM AccountTbl a WHERE a.status = :status"),
    @NamedQuery(name = "AccountTbl.findByStatusText", query = "SELECT a FROM AccountTbl a WHERE a.statusText = :statusText"),
    @NamedQuery(name = "AccountTbl.findByPkiCode", query = "SELECT a FROM AccountTbl a WHERE a.pkiCode = :pkiCode")})
public class AccountTbl implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "ACCOUNT_GROUP")
    private String accountGroup;
    @Id
    @Basic(optional = false)
    @Column(name = "USER_ID")
    private String userId;
    @Column(name = "USER_NAME")
    private String userName;
    @Column(name = "EMAIL_ADDRESS")
    private String emailAddress;
    @Basic(optional = false)
    @Column(name = "VALID_FROM")
    @Temporal(TemporalType.TIMESTAMP)
    private Date validFrom;
    @Basic(optional = false)
    @Column(name = "VALID_END")
    @Temporal(TemporalType.TIMESTAMP)
    private Date validEnd;
    @Column(name = "STATUS")
    private Character status;
    @Column(name = "STATUS_TEXT")
    private String statusText;
    @Column(name = "PKI_CODE")
    private String pkiCode;

    public AccountTbl() {
    }

    public AccountTbl(String userId) {
        this.userId = userId;
    }

    public AccountTbl(String userId, Date validFrom, Date validEnd) {
        this.userId = userId;
        this.validFrom = validFrom;
        this.validEnd = validEnd;
    }

    public String getAccountGroup() {
        return accountGroup;
    }

    public void setAccountGroup(String accountGroup) {
        this.accountGroup = accountGroup;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public Date getValidFrom() {
        return validFrom;
    }

    public void setValidFrom(Date validFrom) {
        this.validFrom = validFrom;
    }

    public Date getValidEnd() {
        return validEnd;
    }

    public void setValidEnd(Date validEnd) {
        this.validEnd = validEnd;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public String getStatusText() {
        return statusText;
    }

    public void setStatusText(String statusText) {
        this.statusText = statusText;
    }

    public String getPkiCode() {
        return pkiCode;
    }

    public void setPkiCode(String pkiCode) {
        this.pkiCode = pkiCode;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccountTbl)) {
            return false;
        }
        AccountTbl other = (AccountTbl) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tw.com.model.dao.AccountTbl[ userId=" + userId + " ]";
    }
    
}
