package com.hefei.api.rms.salary.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * 工资表
 * @author yinzg
 *
 */
public class SalaryDTO implements Serializable{

	private static final long serialVersionUID = 9217083718777757584L;
	
	public static final String DEL_FLAG_TRUE="1";
	public static final String DEL_FLAG_FLASE="0";
	
	/** 工资编号 */
	private Long id;
	/** 员工编号 */
	private Long employeeId;
	
	private Long companyId;
	
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	private String employeeName;
	/** 月基本工资 */
	private Double monthlyBaseSalary;
	/** 月奖金 */
	private Double monthlyBonus;
	/** 季度奖金 */
	private Double quarterlyBonus;
	/** 年奖金 */
	private Double yearlyBonus;
	/** 删除标志：0 删除 1正常 */
	private String delFlag;
	
	/** 创建时间 */
	private Date createTime;
	/** 更新时间 */
	private Date updateTime;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}
	
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Double getMonthlyBaseSalary() {
		return monthlyBaseSalary;
	}
	public void setMonthlyBaseSalary(Double monthlyBaseSalary) {
		this.monthlyBaseSalary = monthlyBaseSalary;
	}
	public Double getMonthlyBonus() {
		return monthlyBonus;
	}
	public void setMonthlyBonus(Double monthlyBonus) {
		this.monthlyBonus = monthlyBonus;
	}
	public Double getQuarterlyBonus() {
		return quarterlyBonus;
	}
	public void setQuarterlyBonus(Double quarterlyBonus) {
		this.quarterlyBonus = quarterlyBonus;
	}
	public Double getYearlyBonus() {
		return yearlyBonus;
	}
	public void setYearlyBonus(Double yearlyBonus) {
		this.yearlyBonus = yearlyBonus;
	}
	
}

