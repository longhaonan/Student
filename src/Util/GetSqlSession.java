package Util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class GetSqlSession {
    /**
     * 获取sqlsession对象
     *
     * @return
     */

    public static SqlSession createSqlSession() {
        SqlSessionFactory sqlSessionFactory = null;
        InputStream input = null;
        SqlSession session = null;

        try {
            // 获取mybatis的环境配置
            String resource = "mybatis-config.xml";
            // 以流的方式获取resource
            input = Resources.getResourceAsStream(resource);
            // 创建会话工厂
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(input);
            // 通过工厂得到SqlSession
            session = sqlSessionFactory.openSession();
            return session;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}

