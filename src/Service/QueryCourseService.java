package Service;

import Util.GetSqlSession;
import entity.MessageModel;
import entity.Section;

import entity.Take;
import mapper.SectionMapper;

import mapper.TakeMapper;
import org.apache.ibatis.session.SqlSession;


import java.util.List;

public class QueryCourseService {
    public static MessageModel QC() {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper SectionMapper = session.getMapper(SectionMapper.class);

        List<Section> course_section = SectionMapper.querySection();

        messageModel.setObject(course_section);
        return messageModel;
    }

    public static MessageModel QCBYID(String coursename){
        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper SectionMapper = session.getMapper(SectionMapper.class);

        List<Section> course_section = SectionMapper.querySectionBYID(coursename);

        messageModel.setObject(course_section);
        return messageModel;
    }

    public static MessageModel QCBYTIME(String ID, String time_slot_id){
        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        TakeMapper TakeMapper = session.getMapper(TakeMapper.class);

        Take take = TakeMapper.queryTakeBYTime(ID,time_slot_id);
        if (take!=null){
            messageModel.setCode(0);
            messageModel.setMsg("该时段已有课程");
            messageModel.setObject(take);
            return messageModel;
        }else{
            return messageModel;
        }

    }

    public static void add_course(String ID, String course_id, String sec_id, String semester, String year){
        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper sectionMapper = session.getMapper(SectionMapper.class);

        sectionMapper.add(ID,course_id,sec_id,semester,year);
        session.commit();
        session.close();

    }
    //查询选课结果
    public static MessageModel QCR(String ID){
        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper SectionMapper = session.getMapper(SectionMapper.class);

        List<Section> section_result = SectionMapper.queryResult(ID);

        messageModel.setObject(section_result);
        return messageModel;
    }

    public static void delete_course(String ID, String course_id, String sec_id, String semester, String year){
        SqlSession session = GetSqlSession.createSqlSession();
        SectionMapper sectionMapper = session.getMapper(SectionMapper.class);

        sectionMapper.delete(ID,course_id,sec_id,semester,year);
        session.commit();
        session.close();

    }
}
