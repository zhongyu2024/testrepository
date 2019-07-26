package com.zy.bean;

public class QueryTime {

	private int start;
	private int end;
	private int start1;
	private int end1;
	public int getStart1() {
		return start1;
	}
	public void setStart1(int start1) {
		this.start1 = start1;
	}
	public int getEnd1() {
		return end1;
	}
	public void setEnd1(int end1) {
		this.end1 = end1;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public QueryTime(int start, int end) {
		super();
		this.start = start;
		this.end = end;
	}
	public QueryTime() {
		super();
	}
	public QueryTime(int start, int end, int start1, int end1) {
		super();
		this.start = start;
		this.end = end;
		this.start1 = start1;
		this.end1 = end1;
	}
	
}
