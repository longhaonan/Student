package mapper;

import entity.Instructor;
import entity.Section;
import entity.Take;

import java.util.List;

public interface SectionMapper {
    // 显示选课界面的课程
    public List<Section> querySection();
    // 通过课程号、课段号精确查找课程
    public List<Section> querySectionAccurate(String course_id, String sec_id);
    // 通过课程名称模糊查找课程
    public List<Section> querySectionBYID(String coursename);
    // 添加学生选课
    public void add(String ID, String course_id, String sec_id, String semester, String year);
    // 删除学生选课
    public void delete(String ID, String course_id, String sec_id, String semester, String year);
    // 显示学生选课结果
    public List<Section> queryResult(String ID);
    // 删除选课
    public void deleteS(String course_id, String sec_id);
    // 删除teaches表中的相关选课
    public List<Section> confirmBYtime(String building, String room_number, Integer time);
    // 管理员更新teaches表
    public void update_teaches(String I_ID, String course_id, String sec_id);
    // 管理员更新section表
    public void update_section(String course_id, String sec_id,String building, String room_number, Integer time);
    // 从teaches中查找教师是否存在时间冲突
    public Instructor ins_timefree_confirm(String ID, Integer time);
    // 添加新teach
    public void add_teaches(String ID, String course_id, String sec_id);
    // 添加新section
    public void add_section(String course_id, String sec_id, String building, String room_number, Integer time);
}
