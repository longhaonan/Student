package entity;
// 选课的实体类
public class Section {
    private String course_id;
    private String title;
    private String I_ID;
    private String I_name;
    private String sec_id;
    private String building;
    private String room_number;
    private Integer time_slot_id;
    private String day;
    private String start_hr;
    private String start_min;
    private String end_hr;
    private String end_min;

    public String getI_ID() {
        return I_ID;
    }

    public void setI_ID(String i_ID) {
        I_ID = i_ID;
    }

    public String getSec_id() {
        return sec_id;
    }

    public void setSec_id(String sec_id) {
        this.sec_id = sec_id;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
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

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getStart_hr() {
        return start_hr;
    }

    public void setStart_hr(String start_hr) {
        this.start_hr = start_hr;
    }

    public String getStart_min() {
        return start_min;
    }

    public void setStart_min(String start_min) {
        this.start_min = start_min;
    }

    public String getEnd_hr() {
        return end_hr;
    }

    public void setEnd_hr(String end_hr) {
        this.end_hr = end_hr;
    }

    public String getEnd_min() {
        return end_min;
    }

    public void setEnd_min(String end_min) {
        this.end_min = end_min;
    }
}
