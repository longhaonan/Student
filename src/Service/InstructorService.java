package Service;

import Util.GetSqlSession;
import entity.Check;
import entity.Course;

import entity.MessageModel;
import entity.Take;
import mapper.GradeMapper;
import mapper.TakeMapper;

import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class InstructorService {
    public static MessageModel queryBYID(String ID){

        MessageModel messageModel = new MessageModel();

        SqlSession session = GetSqlSession.createSqlSession();
        TakeMapper TakeMapper = session.getMapper(TakeMapper.class);

        List<Course> instructor = TakeMapper.queryCourse(ID);


        messageModel.setObject(instructor);
        return messageModel;
    }

    public static MessageModel queryBYCheck(String course_id, String sec_id, String year, String semester){
        MessageModel messageModel = new MessageModel();

        SqlSession session = GetSqlSession.createSqlSession();
        TakeMapper TakeMapper = session.getMapper(TakeMapper.class);

        List<Check> check_result = TakeMapper.queryCheck(course_id,sec_id,year,semester);


        messageModel.setObject(check_result);
        return messageModel;
    }

    public static void update(String ID, String info, String grade){

        String[] timeArray = info.split("-");
        SqlSession session = GetSqlSession.createSqlSession();
        GradeMapper GradeMapper = session.getMapper(GradeMapper.class);

        GradeMapper.update(ID,timeArray[1],timeArray[2],timeArray[3],timeArray[4],grade);
        session.commit();
        session.close();
    }

    public static MessageModel QTT(String ID){
        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        TakeMapper TakeMapper = session.getMapper(TakeMapper.class);
        Take take_temp = null;
        List<Take> timetable = new ArrayList<Take>();
        Integer index = 0;
        List<Take> timetable_temp = TakeMapper.queryTeach(ID);
        if (timetable_temp.size() == 0) {
            for (int j = 0; j < 20; j++) {
                timetable.add(null);
            }
        } else {
            take_temp = timetable_temp.get(index);
            for (int i = 0; i < 20; i++) {
                if (take_temp.getTime_slot_id() == (i + 1)) {
                    timetable.add(take_temp);
                    index++;
                    if (index < timetable_temp.size())
                        take_temp = timetable_temp.get(index);
                } else {
                    timetable.add(null);
                }

            }
        }
        messageModel.setObject(timetable);
        return messageModel;
    }
}
