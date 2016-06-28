package com.sea.model;

import java.io.File;

public class MyFile {

    private String newFileName;	
    private String oreignFileName;
    private String message = "1"; // 0格式错误 1成功(文件路径)  2失败
    private String filePath;

    public String getNewFileName() {
		return newFileName;
	}

	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	public String getOreignFileName() {
		return oreignFileName;
	}

	public void setOreignFileName(String oreignFileName) {
		this.oreignFileName = oreignFileName;
	}

	
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
