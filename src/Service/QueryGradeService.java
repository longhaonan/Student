package Service;

import Util.GetSqlSession;
import entity.Grade;
import entity.MessageModel;

import mapper.GradeMapper;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class QueryGradeService {
    public static MessageModel QG(String ID, String semster, String year) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        GradeMapper GradeMapper = session.getMapper(GradeMapper.class);

        List<Grade> Grade = GradeMapper.queryGrade(ID,semster,year);

        messageModel.setObject(Grade);
        return messageModel;
    }
}
