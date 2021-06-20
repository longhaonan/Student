package mapper;
import entity.Check;
import entity.Course;
import entity.Take;

import java.util.List;

public interface TakeMapper {
    public List<Take> queryTake(String ID, String year, String semester);

    public List<Take> queryTeach(String ID);

    public List<Take> queryClassroom(String building, String room_number);

    public Take queryTakeBYTime(String ID, String time_slot_id);

    public List<Course> queryCourse(String ID);

    public List<Check> queryCheck(String course_id, String sec_id, String year, String semester);
}
