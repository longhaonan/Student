package entity;/*
* 消息模型对象（数据响应）
* 状态码
* 提示信息
* 回显对象
* */

public class MessageModel {

    private int code = 1;// 状态码 1成功 0失败
    private String  msg = "成功";// 显示信息
    private Object object;// 回显对象

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
}
