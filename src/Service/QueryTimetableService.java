package Service;

import Util.GetSqlSession;
import entity.MessageModel;
import entity.Take;
import mapper.TakeMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class QueryTimetableService {
    public static MessageModel QTT(String ID, String semester, String year) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        TakeMapper TakeMapper = session.getMapper(TakeMapper.class);
        Take take_temp = null;
        List<Take> timetable = new ArrayList<Take>();
        Integer index = 0;
        List<Take> timetable_temp = TakeMapper.queryTake(ID, year, semester);
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
