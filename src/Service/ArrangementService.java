package Service;

import Util.GetSqlSession;
import entity.Instructor;
import entity.MessageModel;
import entity.Section;
import entity.Take;
import mapper.SectionMapper;
import mapper.TakeMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class ArrangementService {
    public static void deleteS(String course_id, String sec_id){
        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper sectionMapper = session.getMapper(SectionMapper.class);

        sectionMapper.deleteS(course_id,sec_id);

        session.commit();
        session.close();

    }

    public static MessageModel confirm(Section section){

        MessageModel messageModel = new MessageModel();

        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper sectionMapper = session.getMapper(SectionMapper.class);

        List<Section> temp = sectionMapper.confirmBYtime(section.getBuilding(),section.getRoom_number(),section.getTime_slot_id());
        if (temp.size()!=0){
            if (temp.size()==1 && temp.get(0).getCourse_id().equals(section.getCourse_id()) && temp.get(0).getSec_id().equals(section.getSec_id())){
                if (temp.get(0).getI_ID().equals(section.getI_ID())){
                    messageModel.setMsg("信息未变更。");
                    return messageModel; // 待修改的选课时间、地点、教师没有发生改变
                }
                // 选课信息只有教师发生改变
                // 验证新教师是否存在时间冲突
                if (ins_timefree_confirm(section.getI_ID(),section.getTime_slot_id()) != null){
                    messageModel.setCode(0);
                    messageModel.setMsg("该教师:"+section.getI_ID()+"在此时段已有其他课程。");
                    return messageModel;
                }
                // 新教师不存在时间冲突，更新teaches表
                sectionMapper.update_teaches(section.getI_ID(),section.getCourse_id(),section.getSec_id());
                messageModel.setMsg("更新成功");
                session.commit();
                session.close();
                return messageModel;
            }
            // 修改的选课在该时间段教室已被占用
            messageModel.setCode(0);
            messageModel.setMsg("此时段"+section.getBuilding()+section.getRoom_number()+"已被使用");
            return messageModel;
        }
        // 选课在该时间段、教室无冲突
        // 检验教师是否冲突
        if (ins_timefree_confirm(section.getI_ID(),section.getTime_slot_id()) != null){
            messageModel.setCode(0);
            messageModel.setMsg("该教师:"+section.getI_ID()+"在此时段已有其他课程。");
            return messageModel;
        }
        // 新教师不存在时间冲突，更新teaches表
        sectionMapper.update_teaches(section.getI_ID(),section.getCourse_id(),section.getSec_id());
        // 更新section表
        sectionMapper.update_section(section.getCourse_id(),section.getSec_id(),section.getBuilding(),section.getRoom_number(),section.getTime_slot_id());
        messageModel.setMsg("更新成功");
        session.commit();
        session.close();
        return messageModel;
    }

    public static MessageModel confirm_add(Section section){

        MessageModel messageModel = new MessageModel();

        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper sectionMapper = session.getMapper(SectionMapper.class);

        List<Section> temp = sectionMapper.querySectionAccurate(section.getCourse_id(),section.getSec_id());
        if (temp.size()!=0){
            messageModel.setCode(0);
            messageModel.setMsg("课程:"+section.getCourse_id()+"-"+section.getSec_id()+"已存在");
            return messageModel;
        }

        temp = sectionMapper.confirmBYtime(section.getBuilding(),section.getRoom_number(),section.getTime_slot_id());
        if (temp.size()!=0){
            // 添加的选课在该时间段教室已被占用
            messageModel.setCode(0);
            messageModel.setMsg("此时段"+section.getBuilding()+section.getRoom_number()+"已被使用");
            return messageModel;
        }
        // 选课在该时间段、教室无冲突
        // 检验教师是否冲突
        if (ins_timefree_confirm(section.getI_ID(),section.getTime_slot_id()) != null){
            messageModel.setCode(0);
            messageModel.setMsg("该教师:"+section.getI_ID()+"在此时段已有其他课程。");
            return messageModel;
        }
        // 插入section表
        sectionMapper.add_section(section.getCourse_id(),section.getSec_id(),section.getBuilding(),section.getRoom_number(),section.getTime_slot_id());
        session.commit();
        // 教师不存在时间冲突，插入teaches表
        sectionMapper.add_teaches(section.getI_ID(),section.getCourse_id(),section.getSec_id());
        messageModel.setMsg("添加成功");
        session.commit();
        session.close();
        return messageModel;
    }

    public static Instructor ins_timefree_confirm(String  ID, Integer time){
        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper sectionMapper = session.getMapper(SectionMapper.class);

        Instructor instructor = sectionMapper.ins_timefree_confirm(ID,time);
        return instructor;
    }

    public static MessageModel QClassroom(String building, String room_number){
        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        TakeMapper TakeMapper = session.getMapper(TakeMapper.class);
        Take class_temp = null;
        List<Take> classroom = new ArrayList<Take>();
        Integer index = 0;
        List<Take> timetable_temp = TakeMapper.queryClassroom(building,room_number);
        if (timetable_temp.size() == 0) {
            for (int j = 0; j < 20; j++) {
                classroom.add(null);
            }
        } else {
            class_temp = timetable_temp.get(index);
            for (int i = 0; i < 20; i++) {
                if (class_temp.getTime_slot_id() == (i + 1)) {
                    classroom.add(class_temp);
                    index++;
                    if (index < timetable_temp.size())
                        class_temp = timetable_temp.get(index);
                } else {
                    classroom.add(null);
                }

            }
        }
        messageModel.setObject(classroom);
        return messageModel;
    }
}
