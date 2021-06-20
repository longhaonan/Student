package mapper;

import entity.Grade;

import java.util.List;

public interface GradeMapper {
    public List<Grade> queryGrade(String ID, String semester, String year);

    public void update(String ID, String course_id, String sec_id, String year, String semester, String grade);
}
