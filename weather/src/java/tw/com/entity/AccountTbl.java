/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
 * @author Z00907
 */
@Entity
@Table(name = "account_tbl")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountTbl.findAll", query = "SELECT a FROM AccountTbl a"),
    @NamedQuery(name = "AccountTbl.findByAccountGroup", query = "SELECT a FROM AccountTbl a WHERE a.accountGroup = :accountGroup"),
    @NamedQuery(name = "AccountTbl.findByUserId", query = "SELECT a FROM AccountTbl a WHERE a.accountTblPK.userId = :userId"),
    @NamedQuery(name = "AccountTbl.findByUserName", query = "SELECT a FROM AccountTbl a WHERE a.userName = :userName"),
    @NamedQuery(name = "AccountTbl.findByEmailAddress", query = "SELECT a FROM AccountTbl a WHERE a.emailAddress = :emailAddress"),
    @NamedQuery(name = "AccountTbl.findByValidFrom", query = "SELECT a FROM AccountTbl a WHERE a.validFrom = :validFrom"),
    @NamedQuery(name = "AccountTbl.findByValidEnd", query = "SELECT a FROM AccountTbl a WHERE a.validEnd = :validEnd"),
    @NamedQuery(name = "AccountTbl.findByStatus", query = "SELECT a FROM AccountTbl a WHERE a.status = :status"),
    @NamedQuery(name = "AccountTbl.findByStatusText", query = "SELECT a FROM AccountTbl a WHERE a.statusText = :statusText"),
    @NamedQuery(name = "AccountTbl.findByPkiCode", query = "SELECT a FROM AccountTbl a WHERE a.pkiCode = :pkiCode"),
    @NamedQuery(name = "AccountTbl.findByUidAttribute", query = "SELECT a FROM AccountTbl a WHERE a.uidAttribute = :uidAttribute"),
    @NamedQuery(name = "AccountTbl.findByLogNumber", query = "SELECT a FROM AccountTbl a WHERE a.accountTblPK.logNumber = :logNumber")})
public class AccountTbl implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AccountTblPK accountTblPK;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "ACCOUNT_GROUP")
    private String accountGroup;
    @Size(max = 20)
    @Column(name = "USER_NAME")
    private String userName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "EMAIL_ADDRESS")
    private String emailAddress;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VALID_FROM")
    @Temporal(TemporalType.TIMESTAMP)
    private Date validFrom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VALID_END")
    @Temporal(TemporalType.TIMESTAMP)
    private Date validEnd;
    @Column(name = "STATUS")
    private Character status;
    @Size(max = 50)
    @Column(name = "STATUS_TEXT")
    private String statusText;
    @Size(max = 100)
    @Column(name = "PKI_CODE")
    private String pkiCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "UID_ATTRIBUTE")
    private String uidAttribute;

    public AccountTbl() {
    }

    public AccountTbl(AccountTblPK accountTblPK) {
        this.accountTblPK = accountTblPK;
    }

    public AccountTbl(AccountTblPK accountTblPK, String accountGroup, String emailAddress, Date validFrom, Date validEnd, String uidAttribute) {
        this.accountTblPK = accountTblPK;
        this.accountGroup = accountGroup;
        this.emailAddress = emailAddress;
        this.validFrom = validFrom;
        this.validEnd = validEnd;
        this.uidAttribute = uidAttribute;
    }

    public AccountTbl(String userId, int logNumber) {
        this.accountTblPK = new AccountTblPK(userId, logNumber);
    }

    public AccountTblPK getAccountTblPK() {
        return accountTblPK;
    }

    public void setAccountTblPK(AccountTblPK accountTblPK) {
        this.accountTblPK = accountTblPK;
    }

    public String getAccountGroup() {
        return accountGroup;
    }

    public void setAccountGroup(String accountGroup) {
        this.accountGroup = accountGroup;
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

    public String getUidAttribute() {
        return uidAttribute;
    }

    public void setUidAttribute(String uidAttribute) {
        this.uidAttribute = uidAttribute;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (accountTblPK != null ? accountTblPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccountTbl)) {
            return false;
        }
        AccountTbl other = (AccountTbl) object;
        if ((this.accountTblPK == null && other.accountTblPK != null) || (this.accountTblPK != null && !this.accountTblPK.equals(other.accountTblPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tw.com.entity.AccountTbl[ accountTblPK=" + accountTblPK + " ]";
    }
    
}
