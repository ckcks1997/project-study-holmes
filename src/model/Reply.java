package model;

import java.util.Date;

public class Reply {

		private int reply_num;
		private int board_num;
		private String nickname;
		private Date regdate;
		private String content;
		private String regdate2;
		
		
		
		
		
		
		public String getRegdate2() {
			return regdate2;
		}


		public void setRegdate2(String regdate2) {
			this.regdate2 = regdate2;
		}


		public Reply() {}


		public Reply(int reply_num, int board_num, String nickname, Date regdate, String content) {
			super();
			this.reply_num = reply_num;
			this.board_num = board_num;
			this.nickname = nickname;
			this.regdate = regdate;
			this.content = content;
		}


		public int getReply_num() {
			return reply_num;
		}


		public void setReply_num(int reply_num) {
			this.reply_num = reply_num;
		}


		public int getBoard_num() {
			return board_num;
		}


		public void setBoard_num(int board_num) {
			this.board_num = board_num;
		}


		public String getNickname() {
			return nickname;
		}


		public void setNickname(String nickname) {
			this.nickname = nickname;
		}


		public Date getRegdate() {
			return regdate;
		}


		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}


		public String getContent() {
			return content;
		}


		public void setContent(String content) {
			this.content = content;
		}


		@Override
		public String toString() {
			return "Reply [reply_num=" + reply_num + ", board_num=" + board_num + ", nickname="
					+ nickname + ", regdate=" + regdate + ", content=" + content + "]";
		}
		
		
		
		
		
}
