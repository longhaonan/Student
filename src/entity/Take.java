package entity;

public class Take {
    private String title;
    private String I_ID;
    private String I_name;
    private String sec_id;
    private String building;
    private String room_number;
    private Integer time_slot_id;

    public String getI_ID() {
        return I_ID;
    }

    public void setI_ID(String i_ID) {
        I_ID = i_ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getI_name() {
        return I_name;
    }

    public void setI_name(String i_name) {
        I_name = i_name;
    }

    public String getSec_id() {
        return sec_id;
    }

    public void setSec_id(String sec_id) {
        this.sec_id = sec_id;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getRoom_number() {
        return room_number;
    }

    public void setRoom_number(String room_number) {
        this.room_number = room_number;
    }

    public Integer getTime_slot_id() {
        return time_slot_id;
    }

    public void setTime_slot_id(Integer time_slot_id) {
        this.time_slot_id = time_slot_id;
    }
}
