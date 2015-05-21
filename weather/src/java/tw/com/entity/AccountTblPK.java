/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Z00907
 */
@Embeddable
public class AccountTblPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "USER_ID")
    private String userId;
    @Basic(optional = false)
    @Column(name = "LOG_NUMBER")
    private int logNumber;

    public AccountTblPK() {
    }

    public AccountTblPK(String userId, int logNumber) {
        this.userId = userId;
        this.logNumber = logNumber;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getLogNumber() {
        return logNumber;
    }

    public void setLogNumber(int logNumber) {
        this.logNumber = logNumber;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        hash += (int) logNumber;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccountTblPK)) {
            return false;
        }
        AccountTblPK other = (AccountTblPK) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        if (this.logNumber != other.logNumber) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "tw.com.entity.AccountTblPK[ userId=" + userId + ", logNumber=" + logNumber + " ]";
    }
    
}
